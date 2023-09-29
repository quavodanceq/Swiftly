//
//  UserDefaultsManager.swift
//  LearnSwift
//
//  Created by Куат Оралбеков on 25.09.2023.
//

import Foundation

class UDManager {
    
    private init() {}
    
    static let shared = UDManager()
    
    private let userDefaults = UserDefaults.standard
    
    func passed(topicNumber: String) {
        
        userDefaults.set(true, forKey: "topic\(topicNumber)")
        
    }
    
}
