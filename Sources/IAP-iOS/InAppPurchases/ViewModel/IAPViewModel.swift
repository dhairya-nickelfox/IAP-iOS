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

class IAPViewModel {
    var delegate: IAPViewModelDelegate?
    private let model = IAPProductModel()
    
    init() {}
    
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
        
        IAPManager.shared.getProducts { [weak self] (result) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.delegate?.didFinishLongProcess()
                switch result {
                case .success(let products):
                    self.model.products = products
                    if !products.isEmpty {
                        self.delegate?.updateProductPriceOnButton()
                    }
                case .failure(let error):
                    self.delegate?.showIAPRelatedError(error: error)
                }
            }
        }
    }
    
    func getProductForItem(productIdentifier: String) -> SKProduct? {
        // Check if there is a product fetched from App Store containing
        // the keyword matching to the selected item's index
        guard let product = model.getProduct(containing: productIdentifier) else { return nil }
        return product
    }
    
    @MainActor func purchase(product: SKProduct) -> Bool {
        if !IAPManager.shared.canMakePayments() {
            return false
        } else {
            delegate?.willStartLongProcess()
            
            IAPManager.shared.buy(product: product) { [weak self] result in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.delegate?.didFinishLongProcess()
                    switch result {
                    case .success:
                        self.updateDataWithPurchasedProduct(product: product)
                    case .failure(let error):
                        self.delegate?.showIAPRelatedError(error: error)
                    }
                }
            }
        }
        return true
    }
    
    @MainActor func restorePurchases(selectedModule: IAPModule) -> Bool {
        if !IAPManager.shared.canMakePayments() {
            return false
        } else {
            delegate?.willStartLongProcess()
            IAPManager.shared.restorePurchases(selectedModule: selectedModule) { [weak self] result in
                guard let self = self else { return }
                self.delegate?.didFinishLongProcess()
                switch result {
                case .success(let response):
                    guard response.success else {
                        self.delegate?.didFinishRestoringPurchasesWithZeroProducts()
                        return
                    }
                    
                    let productID = Constant.ProductIdentifier.examPrepProductIdentifier
                    if let purchasedModules = response.purchasedModules,
                       purchasedModules.contains(productID) {
                        self.updateDataWithRestoredProduct(module: .examPrep)
                    }
                    
                    let productAudioID = Constant.ProductIdentifier.audiobookProductIdentifier
                    if let purchasedModules = response.purchasedModules,
                       purchasedModules.contains(productAudioID) {
                        self.updateDataWithRestoredProduct(module: .audiobook)
                    }
                    
                    let productCourseID = Constant.ProductIdentifier.coursesProductIdentifier
                    if let purchasedModules = response.purchasedModules,
                       purchasedModules.contains(productCourseID) {
                        self.updateDataWithRestoredProduct(module: .course)
                    }
                    
                    self.delegate?.didFinishRestoringPurchasedProducts()
                case .failure(let error):
                    self.delegate?.showIAPRelatedError(error: error)
                }
            }
        }
        return true
    }
}
