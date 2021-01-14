//
//  Model+ObjectMapping.swift
//
//  Created by Vakul Saini on 15/11/17.
//  Copyright © 2017 enAct eServices. All rights reserved.
//

import UIKit

@objcMembers class Model: NSObject {
    
    /// Don't forget to add excluded keys for those variables which can not be save on Firebase like UIImage, UIView
    var excludedKeys: Array<String> = ["excludedKeys", "description"]
    
    convenience init(info: Dictionary<String, Any>) {
        self.init()
        self.setDictionary(info: info)
    }
}

extension Model {
    
    /// Get Dictionary: Converting Object's variables to dictionary's key value pair
    func getDictionary() -> Dictionary<String, Any>? {
        
        /// Check if there is any excluded keys
        var count: UInt32 = 0
        let clazz: AnyClass? = type(of: self) // `class` can be used
        guard let properties = class_copyPropertyList(clazz, &count) else { return nil }
        
        var info: Dictionary<String, Any> = [:]
        for i in 0..<Int(count) {
            let property = properties[i]
            guard let key = String.init(utf8String: property_getName(property)) else {continue}
            if (self.excludedKeys.contains(key)) {
                // Skip as it has to be exclude
                continue
            }
            
            /// Check if current class respond to this key
            if (!self.responds(to: NSSelectorFromString(key))) {
                // Skip because 'self' doesn't confirm this key
                // Safer side
                continue
            }
            
            let value = self.value(forKey: key)
            
            /// Checking if 'value' is a Model itself
            if let model = value as? Model {
                info[key] = model.getDictionary()
                continue
            }
            
            info[key] = value
        }
        
        free(properties)
        return info
    }
    
    /// Set Dictionary: Setting ditionary to a 'Model's object. Will replace the key-value if already exists
    func setDictionary(info: Dictionary<String, Any>) {
        setDictionary(info: info, parseToString: false)
    }
    
    /// Set Dictionary: Setting ditionary to a 'Model's object. Will replace the key-value if already exists
    func setDictionary(info: Dictionary<String, Any>, parseToString: Bool) {
        let keys = info.keys
        for key in keys {
            if (self.excludedKeys.contains(key)) {continue}
            
            /// Check if current class respond to this key
            if (!self.responds(to: NSSelectorFromString(key))) {
                // Skip because 'self' doesn't confirm this key
                // Safer side
                continue
            }
            
            let value = info[key]
            
            /// Checking if 'value' is a Model itself
            if let model = value as? Model {
                self.setValue(model.getDictionary(), forKey: key)
                continue
            }
            
            if value is NSNull {
                /// Ignoring the null value
                continue
            }
            
            if parseToString {
                let val = stringFromAny(value)
                self.setValue(val, forKey: key)
            }
            else {
                self.setValue(value, forKey: key)
            }
        }
    }
}


extension Model {
    func stringFromAny(_ value: Any?) -> String {
        if let v = value as? Int {
            return "\(v)"
        }
        if let v = value as? Double {
            return "\(v)"
        }
        if let v = value as? String {
            return "\(v)"
        }
        return ""
    }
}
