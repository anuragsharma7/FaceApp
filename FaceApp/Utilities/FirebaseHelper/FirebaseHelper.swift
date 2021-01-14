//
//  FirebaseHelper.swift
//  FaceApp
//
//  Created by Anurag Sharma on 12/01/21.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

class FirebaseHelper: NSObject {
    /*
    static var shared = FirebaseHelper()
    
    // private override init() { }
    
    lazy var stogareRef: FirebaseStorage = {
        return Storage.storage().reference()
    }()
    
    func getVideos() -> [VideosModel] {
        //        ref.child("")
        
        stogareRef.child("Videos/") { video in
            print(video)
        }
 
        let storageRef = Storage.storage().reference(forURL: videoURL)
        storageRef.getData(maxSize: INT64_MAX) { (data, error) in
            if let error = error {
                print("Error downloading image data: \(error)")
                return
            }
            storageRef.getMetadata(completion: { (metadata, metadataErr) in
                
                if let error = metadataErr {
                    print("Error downloading metadata: \(error)")
                    return
                }
                if (metadata?.contentType == "image/gif") {
                    print("It is Gif Image")
                } else {
                    let downloadUrl = metadata?.downloadURL()
                    if downloadUrl != nil {
                        print(downloadUrl)
                        //You will get your Video Url Here
                    }
                    
                }
            })
        }
        
    }
    */
}

