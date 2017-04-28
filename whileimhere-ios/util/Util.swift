//
//  Util.swift
//  whileimhere-ios
//
//  Created by Brian Maci on 4/27/17.
//  Copyright © 2017 Brian Maci. All rights reserved.
//

import UIKit
import GoogleMaps

class Util: NSObject {

    class func printFonts() {
        let fontFamilyNames = UIFont.familyNames
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNames(forFamilyName: familyName )
            print("Font Names = [\(names)]")
        }
    }
    
    class func getPList(name:String) -> [String: AnyObject] {
        
        if let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            
            return dict
        } else {
            return [: ]
        }
    }
    
    class func getPListArray(name:String) -> [[String: AnyObject]] {
        
        if let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let dict = NSArray(contentsOfFile: path) as? [[String: AnyObject]] {
            
            return dict
        } else {
            return [[: ]]
        }
    }
    
    class func locationLabel(address: GMSAddress) -> String {
        var address0: String!
        var address1: String!

        if let tryAdd0 = address.locality {
            address0 = tryAdd0
        } else if let tryAdd0 = address.subLocality {
            address0 = tryAdd0
        } else {
            address0 = ""
        }
        
        if let tryAdd1 = address.administrativeArea {
            address1 = tryAdd1
        } else if let tryAdd1 = address.country {
            address1 = tryAdd1
        } else {
            address1 = ""
        }
        
        if address0.isEmpty && address1.isEmpty {
            return "Unknown"
        } else if !address0.isEmpty && address1.isEmpty {
            return address0
        } else if address0.isEmpty && !address1.isEmpty {
            
            //test what we have here thus far
            if address.administrativeArea != nil {
                address0 = address.administrativeArea
                address1 = address.country
                
                return String(format:"%@, %@", address0, address1)
            } else {
                return address1
            }
        } else {
            return String(format:"%@, %@", address0, address1)
        }
    }
    
    class func distanceFrom(lat:Double, lon:Double) -> Double {
        let origin:CLLocation = CLLocation(latitude: CurrentUser.shared.myLastRecordedLocation.latitude,
                                           longitude: CurrentUser.shared.myLastRecordedLocation.longitude)
        
        let here:CLLocation = CLLocation(latitude:lat, longitude:lon)
        return here.distance(from: origin)
    }
    
    class func radiusInMeters(range:Float) -> Double {
        
        var radius:Double = Double(range/2)
        
        //convert to meters if necessary
        if CurrentUser.shared.isMetric != true {
            radius = Double(Util.feetToMeters(feet: CGFloat(radius)))
        }
        
        return radius
    }
    
    class func pointsEqual(_ pointA:CLLocationCoordinate2D, _ pointB:CLLocationCoordinate2D) -> Bool {
        
        return pointA.latitude == pointB.latitude && pointA.longitude == pointB.longitude
    }
    
    class func generateUUID() -> String {
        return UUID().uuidString
    }
    
    class func metersToFeet(meters:CGFloat) -> CGFloat {
        return meters * 3.28084
    }
    
    class func feetToMeters(feet:CGFloat) -> CGFloat {
        return feet * 0.3408
    }
    
    class func intFromDate(date:Date) -> Int {
        return Int(date.timeIntervalSince1970)
    }
    
    class func dateFromInt(dateInt:Int) -> Date {
        return Date(timeIntervalSince1970: TimeInterval(dateInt))
    }
}
