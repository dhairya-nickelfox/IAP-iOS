import Foundation
import UIKit

public struct IAPProductConfig {
    // MARK: - App Store IDs
    public struct AppStoreIDs {
        public static let ff8 = "6469591173"
        public static let ff9 = "6469591174"  // Replace with actual ID
        // Add more app store IDs as needed
    }
    
    // MARK: - Product ID Constants
    public struct ProductIDs {
        // FF8 Products
        public struct FF8 {
            public static let examPrep = "org.ifsta.e8.examprep"
            public static let audiobook = "org.ifsta.e8.audiobook"
            public static let course = "org.ifsta.e8.interactive"
        }
        
        // FF9 Products
        public struct FF9 {
            public static let examPrep = "org.ifsta.e9.examprep1"
            public static let audiobook = "org.ifsta.e9.audiobook2"
            public static let course = "org.ifsta.e9.interactive3"
        }
        public struct FF6 {
            public static let examPrep = "org.ifsta.e9.examprep4"
            public static let audiobook = "org.ifsta.e9.audiobook5"
            public static let course = "org.ifsta.e9.interactive6"
        }
        public struct FF5 {
            public static let examPrep = "org.ifsta.e9.examprep7"
            public static let audiobook = "org.ifsta.e9.audiobook8"
            public static let course = "org.ifsta.e9.interactive9"
        }
        public struct FF4 {
            public static let examPrep = "org.ifsta.e9.examprep10"
            public static let audiobook = "org.ifsta.e9.audiobook11"
            public static let course = "org.ifsta.e9.interactive12"
        }
        public struct FF3 {
            public static let examPrep = "org.ifsta.e9.examprep13"
            public static let audiobook = "org.ifsta.e9.audiobook14"
            public static let course = "org.ifsta.e9.interactive15"
        }
        public struct FF2 {
            public static let examPrep = "org.ifsta.e9.examprep16"
            public static let audiobook = "org.ifsta.e9.audiobook17"
            public static let course = "org.ifsta.e9.interactive18"
        }
        public struct FF1 {
            public static let examPrep = "org.ifsta.e9.examprep19"
            public static let audiobook = "org.ifsta.e9.audiobook20"
            public static let course = "org.ifsta.e9.interactive21"
        }
        public struct FF0 {
            public static let examPrep = "org.ifsta.e9.examprep22"
            public static let audiobook = "org.ifsta.e9.audiobook23"
            public static let course = "org.ifsta.e9.interactive24"
        }
       
    }
    
    // MARK: - App Configurations
    public static func configuration(for appIdentifier: String) -> IAPConfiguration {
        let productIds: Set<String>
        let style: IAPViewControllerStyle
        
        switch appIdentifier {
        case "ff8":
            productIds = [
                ProductIDs.FF8.examPrep,
                ProductIDs.FF8.audiobook,
                ProductIDs.FF8.course
            ]
            style = IAPViewControllerStyle(
                backgroundImage: UIImage(named: "ff8_background"),
                logoImage: UIImage(named: "ff8_logo"),
                buttonBackgroundColor: UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0), // iOS 12 compatible blue
                buttonTextColor: .white
            )
        case "ff9":
            productIds = [
                ProductIDs.FF9.examPrep,
                ProductIDs.FF9.audiobook,
                ProductIDs.FF9.course
            ]
            style = IAPViewControllerStyle(
                backgroundImage: UIImage(named: "ff9_background"),
                logoImage: UIImage(named: "ff9_logo"),
                buttonBackgroundColor: UIColor(red: 0.0, green: 0.5, blue: 0.0, alpha: 1.0), // iOS 12 compatible green
                buttonTextColor: .white
            )
        // Add more app configurations as needed...
        default:
            fatalError("Unknown app identifier: \(appIdentifier)")
        }
        
        return IAPConfiguration(
            appIdentifier: appIdentifier,
            productIds: productIds,
            viewControllerStyle: style,
            modules: ["examprep", "audiobook", "course"]
        )
    }
    
    // MARK: - Helper Methods
    public static func getProductIds(for appIdentifier: String) -> Set<String> {
        let config = configuration(for: appIdentifier)
        return config.productIds
    }
    
    public static func getProductIds(for appIdentifier: String, module: String) -> Set<String> {
        let config = configuration(for: appIdentifier)
        switch module {
        case "examprep":
            return [appIdentifier == "ff8" ? ProductIDs.FF8.examPrep : ProductIDs.FF9.examPrep]
        case "audiobook":
            return [appIdentifier == "ff8" ? ProductIDs.FF8.audiobook : ProductIDs.FF9.audiobook]
        case "course":
            return [appIdentifier == "ff8" ? ProductIDs.FF8.course : ProductIDs.FF9.course]
        default:
            return []
        }
    }
} 
