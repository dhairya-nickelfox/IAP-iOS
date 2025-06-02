import Foundation
import StoreKit
import ReactiveSwift
import ReactiveCocoa

@MainActor
public protocol IAPManagerDelegate: AnyObject {
    func iapManager(_ manager: IAPManager, didUpdateProducts products: [SKProduct])
    func iapManager(_ manager: IAPManager, didFailToUpdateProducts error: Error)
    func iapManager(_ manager: IAPManager, didCompletePurchase product: SKProduct)
    func iapManager(_ manager: IAPManager, didFailPurchase product: SKProduct, error: Error)
}

public final class IAPManager: NSObject {
    @MainActor public static let shared = IAPManager()
    
    private var configuration: IAPConfiguration?
    private var products: [SKProduct] = []
    private var productRequest: SKProductsRequest?
    
    public weak var delegate: IAPManagerDelegate?
    
    private override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }
    
    deinit {
        SKPaymentQueue.default().remove(self)
    }
    
    public func configure(with configuration: IAPConfiguration) {
        self.configuration = configuration
        loadProducts()
    }
    
    private func loadProducts() {
        guard let configuration = configuration else { return }
        
        productRequest = SKProductsRequest(productIdentifiers: configuration.productIds)
        productRequest?.delegate = self
        productRequest?.start()
    }
    
    @MainActor public func purchase(product: SKProduct) {
        guard SKPaymentQueue.canMakePayments() else {
            delegate?.iapManager(self, didFailPurchase: product, error: IAPError.paymentsNotAllowed)
            return
        }
        
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }
    
    public func restorePurchases() {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    
    public func getProduct(for productId: String) -> SKProduct? {
        return products.first { $0.productIdentifier == productId }
    }
    
    public func getProducts(for module: String) -> [SKProduct] {
        guard let configuration = configuration else { return [] }
        let moduleProductIds = configuration.productIds(for: module)
        return products.filter { moduleProductIds.contains($0.productIdentifier) }
    }
    
    public func getPriceFormatted(for product: SKProduct) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = product.priceLocale
        return formatter.string(from: product.price)
    }
}

// MARK: - SKProductsRequestDelegate
extension IAPManager: SKProductsRequestDelegate {
    @MainActor public func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        products = response.products
        delegate?.iapManager(self, didUpdateProducts: products)
        
        if !response.invalidProductIdentifiers.isEmpty {
            print("Invalid product identifiers: \(response.invalidProductIdentifiers)")
        }
    }
    
    @MainActor public func request(_ request: SKRequest, didFailWithError error: Error) {
        delegate?.iapManager(self, didFailToUpdateProducts: error)
    }
}

// MARK: - SKPaymentTransactionObserver
extension IAPManager: SKPaymentTransactionObserver {
    public func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            for transaction in transactions {
                self.handleTransaction(transaction)
            }
        }
    }
    
    @MainActor
    private func handleTransaction(_ transaction: SKPaymentTransaction) {
        switch transaction.transactionState {
        case .purchased:
            handlePurchased(transaction)
        case .failed:
            handleFailed(transaction)
        case .restored:
            handleRestored(transaction)
        case .deferred:
            handleDeferred(transaction)
        case .purchasing:
            break
        @unknown default:
            break
        }
    }
    
    @MainActor
    private func handlePurchased(_ transaction: SKPaymentTransaction) {
        guard let product = products.first(where: { $0.productIdentifier == transaction.payment.productIdentifier }) else {
            return
        }
        
        delegate?.iapManager(self, didCompletePurchase: product)
        SKPaymentQueue.default().finishTransaction(transaction)
    }
    
    @MainActor
    private func handleFailed(_ transaction: SKPaymentTransaction) {
        guard let product = products.first(where: { $0.productIdentifier == transaction.payment.productIdentifier }),
              let error = transaction.error else {
            return
        }
        
        delegate?.iapManager(self, didFailPurchase: product, error: error)
        SKPaymentQueue.default().finishTransaction(transaction)
    }
    
    @MainActor
    private func handleRestored(_ transaction: SKPaymentTransaction) {
        guard let product = products.first(where: { $0.productIdentifier == transaction.payment.productIdentifier }) else {
            return
        }
        
        delegate?.iapManager(self, didCompletePurchase: product)
        SKPaymentQueue.default().finishTransaction(transaction)
    }
    
    @MainActor
    private func handleDeferred(_ transaction: SKPaymentTransaction) {
        // Handle deferred state (usually for parental controls)
        print("Purchase deferred for product: \(transaction.payment.productIdentifier)")
    }
}

// MARK: - IAPError
public enum IAPError: Error {
    case paymentsNotAllowed
    case productNotFound
    case purchaseFailed
    case invalidReceipt
    case configurationMissing
} 
