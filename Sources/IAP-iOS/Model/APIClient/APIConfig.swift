//
//  APIConfig.swift
//  Model
//
//  Created by Nickelfox on 01/11/22.
//  Copyright © 2022 Nickelfox. All rights reserved.
//

import Foundation

public struct APIConfig {
    public static let femaleBaseUrl = "https://appdata.ifsta.org/e8-audio/en/ff1_ch01_f"
    public static let femaleBaseUrl2 = "https://appdata.ifsta.org/e8-audio/en/ff2_ch01_f"
    public static let maleBaseUrl = "https://appdata.ifsta.org/e8-audio/en/ff1_ch01_m"
    public static let maleBaseUrl2 = "https://appdata.ifsta.org/e8-audio/en/ff2_ch01_m"
    public static let storeUrl: String = "https://www.ifsta.org/shop/"
    public static let appUrlPath = "itms-apps://apple.com/app/6654913928"
    static let appStoreLookup = "https://itunes.apple.com/lookup?bundleId="
    public static let spanishAudioUrl = "https://appdata.ifsta.org/e7-audio-es/" 
    public static let downloadURLForMaleAudio = "https://appdata.ifsta.org/e8-audio/en/"
    public static let downloadURLForFemaleAudio = "https://appdata.ifsta.org/e8-audio/en/ff1_ch01_f.mp3"
    // Flashcard Data
    public static let flashcardAppDataKeyValue = "oXSEQ982L47bAtjXCHotVuPPpdSa5C98"
    public static let downloadUrlForFlashcard = "https://appdata.ifsta.org/e8-terms/key_terms.xml"
    public static let audioHeaders: [String: String] = [
        "x-appdata-key": "zeh8tZYAwteqVwLLQnHtA7YLeNAG6mUe"
    ]
    
}
