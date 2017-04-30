//
//  Reminder.swift
//  whileimhere-ios
//
//  Created by Chelsea Power on 4/30/17.
//  Copyright © 2017 Brian Maci. All rights reserved.
//

import UIKit
import CoreLocation

enum ReminderType: Int {
    case generic = 0, specific
}

class Reminder: NSObject {
    
    private var title: String!
    private var locations: [CLLocationCoordinate2D]!
    private var type: ReminderType!

}
