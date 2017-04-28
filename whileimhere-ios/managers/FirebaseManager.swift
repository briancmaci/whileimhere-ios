//
//  FirebaseManager.swift
//  whileimhere-ios
//
//  Created by Chelsea Power on 4/27/17.
//  Copyright © 2017 Brian Maci. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class FirebaseManager: NSObject {
    
    class func initFirebase() {
        
        FIRApp.configure()
    }
    
    class func getUsersRef() -> FIRDatabaseReference {
        return FIRDatabase.database().reference(withPath:K.DB.Table.Users)
    }
    
    class func getCurrentUserRef() -> FIRDatabaseReference {
        return getUsersRef().child(getCurrentUser().uid)
    }
    
    class func getCurrentUser() -> FIRUser {
        return (FIRAuth.auth()?.currentUser)!
    }
    
    class func getStorageRef() -> FIRStorageReference {
        
        let storage = FIRStorage.storage()
        let storageRef = storage.reference()
        
        return storageRef
    }
    
    class func getImageStorageRef() -> FIRStorageReference {
        return getStorageRef().child(K.DB.Storage.Images)
    }
    
}
