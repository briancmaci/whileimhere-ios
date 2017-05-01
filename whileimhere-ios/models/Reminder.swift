//
//  Reminder.swift
//  whileimhere-ios
//
//  Created by Chelsea Power on 4/30/17.
//  Copyright © 2017 Brian Maci. All rights reserved.
//

import UIKit
import CoreLocation

class Reminder: NSObject {
    
    public var title: String!
    public var locations: [CLLocationCoordinate2D]!
    public var type: ReminderType!
    
    convenience init(title: String, type: ReminderType) {
        self.init()
        
        self.title = title
        self.type = type
    }

}
