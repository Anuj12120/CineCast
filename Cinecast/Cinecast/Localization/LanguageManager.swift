//
//  LanguageManager.swift
//  Cinecast
//
//  Created by Anand Mahajan on 07/04/26.
//

import UIKit

class LanguageManager {

    static let shared = LanguageManager()
    
    private init() {}

    private let userDefaultsKey = "app_language"

    // MARK: - Current Language
    var currentLanguage: String {
        return UserDefaults.standard.string(forKey: userDefaultsKey) ?? Locale.current.language.languageCode?.identifier ?? "en"
    }

    // MARK: - Set Language
    func setLanguage(_ langCode: String) {
        UserDefaults.standard.set(langCode, forKey: userDefaultsKey)
        UserDefaults.standard.synchronize()
        
        // Reset root VC to apply language
        resetApp()
    }

    // MARK: - Get Localized String
    func localizedString(for key: String) -> String {
        guard let path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return key
        }
        
        return NSLocalizedString(key, tableName: nil, bundle: bundle, comment: "")
    }

    // MARK: - Reload App UI
    private func resetApp() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate,
              let window = sceneDelegate.window else { return }

        let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        window.rootViewController = rootVC
        window.makeKeyAndVisible()
    }
}
