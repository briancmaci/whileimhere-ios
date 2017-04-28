//
//  CurrentUser.swift
//  whileimhere-ios
//
//  Created by Chelsea Power on 4/27/17.
//  Copyright © 2017 Brian Maci. All rights reserved.
//

import UIKit
import CoreLocation

class CurrentUser: NSObject {

    static let shared = CurrentUser()
    
    var isMetric:Bool = false
    
    var uid = ""
    var email = ""
    var username = ""
    
    var facebookToken = "" //This is only used for email verification
    var notificationToken = "" //This is pushed to the dB to get notifications

    var myLastRecordedLocation: CLLocationCoordinate2D! = nil
    
    var range: CGFloat! 
    
    //update rate
    var updateInterval: TimeInterval = 30
    
    func extraAttributesToFirebase() -> [String:Any] {
        
        return [K.DB.Var.Username : username]
    }
    
    func reset() {
        
        uid = ""
        username = ""
        email = ""
        facebookToken = ""
        notificationToken = ""
        myLastRecordedLocation = nil
    }
}
