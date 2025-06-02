import Foundation
import UIKit

public struct IAPProduct {
    public let productId: String
    public let title: String
    public let price: String
    public let module: String // e.g., "examprep"
    
    public init(productId: String, title: String, price: String, module: String) {
        self.productId = productId
        self.title = title
        self.price = price
        self.module = module
    }
}

public struct IAPViewControllerStyle {
    public let backgroundImage: UIImage?  // Background image from assets
    public let logoImage: UIImage?        // Logo from assets
    public let buttonBackgroundColor: UIColor
    public let buttonTextColor: UIColor
    public let fontName: String
    
    // Base initializer for iOS 12.0+
    public init(
        backgroundImage: UIImage? = nil,
        logoImage: UIImage? = nil,
        buttonBackgroundColor: UIColor = UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0), // Default blue color
        buttonTextColor: UIColor = .white,
        fontName: String = "System"
    ) {
        self.backgroundImage = backgroundImage
        self.logoImage = logoImage
        self.buttonBackgroundColor = buttonBackgroundColor
        self.buttonTextColor = buttonTextColor
        self.fontName = fontName
    }
    
    // iOS 13.0+ convenience initializer with system colors
    @available(iOS 13.0, *)
    public static func systemStyle(
        backgroundImage: UIImage? = nil,
        logoImage: UIImage? = nil,
        buttonBackgroundColor: UIColor = .systemBlue,
        buttonTextColor: UIColor = .white,
        fontName: String = "System"
    ) -> IAPViewControllerStyle {
        return IAPViewControllerStyle(
            backgroundImage: backgroundImage,
            logoImage: logoImage,
            buttonBackgroundColor: buttonBackgroundColor,
            buttonTextColor: buttonTextColor,
            fontName: fontName
        )
    }
}

public struct IAPConfiguration {
    public let appIdentifier: String // e.g., "ff8", "ff9"
    public let productIds: Set<String>
    public let viewControllerStyle: IAPViewControllerStyle
    public let modules: Set<String> // e.g., ["examprep", "practice", etc.]
    
    public init(
        appIdentifier: String,
        productIds: Set<String>,
        viewControllerStyle: IAPViewControllerStyle,
        modules: Set<String>
    ) {
        self.appIdentifier = appIdentifier
        self.productIds = productIds
        self.viewControllerStyle = viewControllerStyle
        self.modules = modules
    }
    
    // Helper method to get product IDs for a specific module
    public func productIds(for module: String) -> Set<String> {
        // This will be implemented by the app using the package
        // based on their module-to-product mapping
        return []
    }
} 
