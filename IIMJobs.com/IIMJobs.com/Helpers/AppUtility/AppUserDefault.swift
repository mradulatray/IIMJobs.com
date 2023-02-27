//
//  AppUserDefault.swift
//  IIMJobs.com
//
//  Created by mradulatray on 24/02/23.
//

import Foundation
import SwiftyJSON

enum AppUserDefaults {
    
    static func value(forKey key: Key,
                      file : String = #file,
                      line : Int = #line,
                      function : String = #function) -> JSON {
        
        guard let value = UserDefaults.standard.object(forKey: key.rawValue) else {
            
            debugPrint("No Value Found in UserDefaults\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
            
            return JSON.null
        }
        
        return JSON(value)
    }
    
    static func value<T>(forKey key: Key,
                      fallBackValue : T,
                      file : String = #file,
                      line : Int = #line,
                      function : String = #function) -> JSON {
        
        guard let value = UserDefaults.standard.object(forKey: key.rawValue) else {
            
            debugPrint("No Value Found in UserDefaults\nFile : \(file) \nFunction : \(function)")
            return JSON(fallBackValue)
        }
        
        return JSON(value)
    }
    
    static func save(value : Any, forKey key : Key) {
        
        UserDefaults.standard.set(value, forKey: key.rawValue)
//        UserDefaults.standard.synchronize()
    }
    
    static func removeValue(forKey key : Key) {
        
        UserDefaults.standard.removeObject(forKey: key.rawValue)
//        UserDefaults.standard.synchronize()
    }
    
    static func removeAllValues() {
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
//        UserDefaults.standard.synchronize()
    }
    
    //MARK:- FOR GET THE INTEGER VALUE
    //================================
  
    static func integerValueArray(forKey key: Key)->[Int]{
        guard let array = UserDefaults.standard.array(forKey: key.rawValue) as? [Int] else{return []}
        return array
    }
}

// MARK:- KEYS
//==============
extension AppUserDefaults {
    
    enum Key : String, CaseIterable {
        case firstRun
    
    }
}
