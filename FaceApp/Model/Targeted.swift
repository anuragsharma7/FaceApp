//
//  Targeted.swift
//  FaceApp
//
//  Created by Anurag Sharma on 15/01/21.
//

import Foundation

class Targeted: Model {
    
    var name: String?
    var painPoint: String?
    var thumbImage: String?
    
    var videos: [[String: Any]] = [[:]]
    
    override init() {
        super.init()
    }
    
    convenience init(info: Dictionary<String, Any>) {
        self.init()
        self.setDictionary(info: info)
    }
    
    override func setDictionary(info: Dictionary<String, Any>) {
        super.setDictionary(info: info)
    }
    
    override func getDictionary() -> Dictionary<String, Any> {
        let dict: Dictionary<String, Any> = super.getDictionary() ?? [:]
        return dict
    }
}

//class Videos: Model {
//
//    var isPaid: Bool?
//    var times: Int?
//    var name: String?
//    var videoUrl: String?
//
//    override init() {
//        super.init()
//    }
//
//    convenience init(info: Dictionary<String, Any>) {
//        self.init()
//        self.setDictionary(info: info)
//    }
//}
