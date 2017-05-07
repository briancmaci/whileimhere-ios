//
//  ReminderTypeManager.swift
//  whileimhere-ios
//
//  Created by Chelsea Power on 4/30/17.
//  Copyright © 2017 Brian Maci. All rights reserved.
//

import UIKit

enum ReminderType: Int {
    case generic = 0, specific, here
}

class ReminderTypeManager: NSObject {
    
    class func labelForType(_ type: ReminderType) -> String {
        
        switch type {
            case .generic:
                return K.String.ReminderType.Generic
                
            case .specific:
                return K.String.ReminderType.Specific
            
        case .here:
            return K.String.ReminderType.Here
        }
    }
    
    class func typeFromLabel(_ label: String) -> ReminderType {
        
        switch label {
            case K.String.ReminderType.Generic:
                return .generic
            
            case K.String.ReminderType.Specific:
                return .specific
            
            case K.String.ReminderType.Here:
                return .here
            
            default:
                fatalError("Unaccounted for ReminderType label")
        }
    }
}
