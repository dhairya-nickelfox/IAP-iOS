//
//  IAPViewModel.swift
//  HazmatFirstResponderSixth
//
//  Created by Akanksha Trivedi on 19/09/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import Foundation
import StoreKit
//import Model

protocol IAPViewModelDelegate: AnyObject {
    func toggleOverlay(shouldShow: Bool)
    func willStartLongProcess()
    func didFinishLongProcess()
    func showIAPRelatedError(error: Error)
    func shouldUpdateUI()
    func didFinishRestoringPurchasesWithZeroProducts()
    func didFinishRestoringPurchasedProducts()
    func updateProductPriceOnButton()
    func updateButtonViewWithPurchaseSuccess(module: SubModule?)
}

class IAPViewModel: IAPManagerDelegate {
    var delegate: IAPViewModelDelegate?
    private let model = IAPProductModel()
    private var products: [SKProduct] = []
    
    @MainActor
    init() {
        IAPManager.shared.delegate = self
    }
    
    @MainActor fileprivate func updateDataWithPurchasedProduct(product: SKProduct) {
        // haptic after the purchase is complete
//        HapticFeedback.success()
        if product.productIdentifier == Constant.ProductIdentifier.examPrepProductIdentifier {
            DataModel.shared.isExamPrepPurchased = true
            self.delegate?.updateButtonViewWithPurchaseSuccess(module: .examPrep)
        }
        
        if product.productIdentifier == Constant.ProductIdentifier.audiobookProductIdentifier {
            DataModel.shared.isAudioBookPurchased = true
            self.delegate?.updateButtonViewWithPurchaseSuccess(module: .audiobook)
        }
        
        if product.productIdentifier == Constant.ProductIdentifier.coursesProductIdentifier {
            DataModel.shared.iscoursePurchased = true
            self.delegate?.updateButtonViewWithPurchaseSuccess(module: .course)
        }
    }
    
    fileprivate func updateDataWithRestoredProduct(module: SubModule) {
//        HapticFeedback.success()
        self.delegate?.updateButtonViewWithPurchaseSuccess(module: module)
    }
    
    @MainActor func viewDidSetup() {
        delegate?.willStartLongProcess()
        // Products will be loaded through the delegate method
    }
    
    func getProductForItem(productIdentifier: String) -> SKProduct? {
        return products.first { $0.productIdentifier == productIdentifier }
    }
    
    @MainActor func purchase(product: SKProduct) -> Bool {
        if !SKPaymentQueue.canMakePayments() {
            return false
        } else {
            delegate?.willStartLongProcess()
            IAPManager.shared.purchase(product: product)
        }
        return true
    }
    
    @MainActor func restorePurchases(selectedModule: IAPModule) -> Bool {
        if !SKPaymentQueue.canMakePayments() {
            return false
        } else {
            delegate?.willStartLongProcess()
            IAPManager.shared.restorePurchases()
        }
        return true
    }
    
    // MARK: - IAPManagerDelegate
    
    @MainActor
    func iapManager(_ manager: IAPManager, didUpdateProducts products: [SKProduct]) {
        self.delegate?.didFinishLongProcess()
        self.products = products
        if !products.isEmpty {
            self.delegate?.updateProductPriceOnButton()
        }
    }
    
    @MainActor
    func iapManager(_ manager: IAPManager, didFailToUpdateProducts error: Error) {
        self.delegate?.didFinishLongProcess()
        self.delegate?.showIAPRelatedError(error: error)
    }
    
    @MainActor
    func iapManager(_ manager: IAPManager, didCompletePurchase product: SKProduct) {
        self.delegate?.didFinishLongProcess()
        self.updateDataWithPurchasedProduct(product: product)
    }
    
    @MainActor
    func iapManager(_ manager: IAPManager, didFailPurchase product: SKProduct, error: Error) {
        self.delegate?.didFinishLongProcess()
        self.delegate?.showIAPRelatedError(error: error)
    }
}
