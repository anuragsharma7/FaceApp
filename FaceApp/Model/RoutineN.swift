//
//  RoutineN.swift
//  FaceApp
//
//  Created by Anurag Sharma on 18/01/21.
//

import Foundation
 
/// A protocol to signify the types you need to be dictionaty codable
 protocol DictionaryCodable: Codable {
 }
 
 /// The extension that actually implements the bi-directional dictionary encoding
 /// via JSON serialization
 extension DictionaryCodable {
   /// Returns optional dictionary if the encoding succeeds
   var dictionary: [String: Any]? {
       guard let data = try? JSONEncoder().encode(self) else {
           return nil
       }
       return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
   }
   /// Creates the instance of self decoded from the given dictionary, or nil on failure
   static func decode(from dictionary:[String:Any]) -> Self? {
       guard let data = try? JSONSerialization.data(withJSONObject: dictionary, options: .fragmentsAllowed) else {
           return nil
       }
       return try? JSONDecoder().decode(Self.self, from: data)
   }
 }


// Your structs now have no special code to serialze or deserialize,
 // but only need to conform to DictionaryCodable protocol
 
 struct videosN : DictionaryCodable {
    var isPaid: Bool?
    var times: Int?
    var name: String?
    var videoUrl: String?
 }
 

struct RoutineN: DictionaryCodable {
    var name: String?
    var painPoint: String?
    var thumbImage: String?
    
    var videos : [videosN]
}


//USAGE:-
/*
// This is the example of a Restaurant
  
  let r1 = Restaurant(distance: 0.1, distributionType: 1, businessHours: [
    BusinessHours(selected: false, thisDay: "Sun", startHour: 10, closeHour: 23),
    BusinessHours(selected: true, thisDay: "Mon", startHour: 11, closeHour: 18),
    BusinessHours(selected: true, thisDay: "Tue", startHour: 11, closeHour: 18),
  ])
  
  // This is how it can be serialized
  guard let dictionary = r1.dictionary else {
        print("Error encoding object")
        return
  }
  
  // Check the result
  print(dictionary)

  // This is how it can be deserialized directly to the object
  guard let r2 = Restaurant.decode(from: dictionary) else {
    print("Error decoding the object")
    return
  }
  
  // Check the result
  print(r2)
*/
