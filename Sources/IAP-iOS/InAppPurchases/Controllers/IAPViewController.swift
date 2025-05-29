//
//  IAPViewController.swift
//  HazmatFirstResponderSixth
//
//  Created by Akanksha Trivedi on 19/09/23.
//  Copyright © 2023 Nickelfox. All rights reserved.
//

import UIKit
import StoreKit
//import Model

public protocol NavigationAppearanceHandler: AnyObject {
    func setupNavigationBarBackground()
    func setupNavigationBarBackground(with color: UIColor?)
}


protocol IAPViewControllerDelegate: AnyObject {
    func updatePurchase(view: IAPViewController, success: Bool, module: SubModule)
    func updateRestore(view: IAPViewController, success: Bool)
}

public class IAPViewController: UIViewController {
    
    
    @IBOutlet weak var overLayView: UIView!
    @IBOutlet weak var purchaseButton: UIButton!
    @IBOutlet weak var restorePurchaseButtonOutLet: UIButton!
    @IBOutlet weak var appLogoImageView: UIImageView!
    @IBOutlet weak var appLogoImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var bgGradientView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var selectedModule: IAPModule = .audioBook
    static var newInstance: IAPViewController? {
        let sb = UIStoryboard.init(name: Storyboard.inAppPurchase.name, bundle: nil)
        return sb.instantiateViewController(withIdentifier: self.className()) as? IAPViewController
    }
    
    public weak var navAppearanceDelegate: NavigationAppearanceHandler?

    
    weak var delegate: IAPViewControllerDelegate?
    var module: SubModule = .examPrep
    var productIdentifier = ""
    
    var viewModel = IAPViewModel()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.setupUI()
    }
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupGradient()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidSetup()
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navAppearanceDelegate?.setupNavigationBarBackground()
    }
    
    private func initialSetup() {
        self.viewModel.delegate = self
        self.overLayView.isHidden = true
        navAppearanceDelegate?.setupNavigationBarBackground(with: .clear)
            self.navigationController?.navigationBar.isHidden = true
        switch module {
        case .examPrep:
            self.productIdentifier = Constant.ProductIdentifier.examPrepProductIdentifier
        case .audiobook:
            self.productIdentifier = Constant.ProductIdentifier.audiobookProductIdentifier
        case .course:
            self.productIdentifier = Constant.ProductIdentifier.coursesProductIdentifier
        }
    }
    
    private func setupUI() {
        self.appLogoImageView.image = Image.IAP.appLogoIPhone.image
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.appLogoImageViewWidthConstraint.constant = 285.0
        } else {
            self.appLogoImageViewWidthConstraint.constant = 170.0
        }
        
        switch self.selectedModule {
        case .audioBook:
            self.titleLabel.text = Constant.IAP.audioBookModule
        case .examPrep:
            self.titleLabel.text = Constant.IAP.examPrepModule
        case .course:
            self.titleLabel.text = Constant.IAP.courseModule
        }
    }
    
    private func setupGradient() {
        self.bgGradientView.layer.sublayers?.removeAll()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
        self.bgGradientView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func showSingleAlert(withMessage message: String) {
//        HapticFeedback.error()
        let alertController = UIAlertController(title: Constant.IAP.error, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Constant.ok, style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func updatePriceOnButton(for product: SKProduct) {
        guard let price = IAPManager.shared.getPriceFormatted(for: product) else { return }
        let purchasePrice = String(format: "%@ (%@)", Constant.IAP.purchase, price)
        purchaseButton.setTitle(purchasePrice, for: .normal)
    }
    
    @IBAction func purchaseButtonAction(_ sender: Any) {
        guard let product = viewModel.getProductForItem(productIdentifier: productIdentifier)
        else {
            showSingleAlert(withMessage: Constant.IAP.buyingItemNotPossible)
            return
        }
        if self.viewModel.purchase(product: product) {
        }
    }
    
    @IBAction func restorePurchaseButtonAction(_ sender: Any) {
        if self.viewModel.restorePurchases(selectedModule: selectedModule) {
        }
    }
    
    @IBAction func dismissButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func dismiss(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: IAPViewModel Delegate Methods

extension IAPViewController: @preconcurrency IAPViewModelDelegate {
    
    func toggleOverlay(shouldShow: Bool) {
        overLayView.isHidden = !shouldShow
    }
    
    func willStartLongProcess() {
        overLayView.isHidden = false
    }
    
    func didFinishLongProcess() {
        overLayView.isHidden = true
    }
    
    func showIAPRelatedError(error: Error) {
        let message = error.localizedDescription
        showSingleAlert(withMessage: message)
    }
    
    func shouldUpdateUI() {
    }
    
    func didFinishRestoringPurchasesWithZeroProducts() {
        showSingleAlert(withMessage: Constant.IAP.noPurchasedRestore)
    }
    
    func didFinishRestoringPurchasedProducts() {
        showSingleAlert(withMessage: Constant.IAP.previousPurchasesRestored)
    }
    
    func updateProductPriceOnButton() {
        guard let product = viewModel.getProductForItem(
            productIdentifier: productIdentifier
        ) else {
            showSingleAlert(withMessage: Constant.IAP.buyingItemNotPossible)
            return
        }
        updatePriceOnButton(for: product)
    }
    
    func updateButtonViewWithPurchaseSuccess(module: SubModule?) {
        // Update UI with purchase succes callback.
        purchaseButton.setTitle(Constant.IAP.purchaseComplete, for: .normal)
        purchaseButton.backgroundColor = UIColor.green
        purchaseButton.isEnabled = false
        restorePurchaseButtonOutLet.isEnabled = false
        
        switch module {
        case .examPrep:
            DataModel.shared.isExamPrepPurchased = true
            self.delegate?.updatePurchase(view: self, success: true, module: .examPrep)
        case .audiobook:
            DataModel.shared.isAudioBookPurchased = true
            self.delegate?.updatePurchase(view: self, success: true, module: .audiobook)
        case .course:
            DataModel.shared.iscoursePurchased = true
            self.delegate?.updatePurchase(view: self, success: true, module: .course)
        default:
            ()
        }
        dismiss(self)
    }
}
