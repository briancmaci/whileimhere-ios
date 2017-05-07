//
//  Config.swift
//  whileimhere-ios
//
//  Created by Chelsea Power on 4/27/17.
//  Copyright © 2017 Brian Maci. All rights reserved.
//

import UIKit

//Constants
struct K {
    
    //API Keys
    struct APIKey {
        static let Firebase = "FirebaseDBKey"
        static let GooglePlaces = "GooglePlacesAPIKey"
    }
    
    //Firebase
    struct DB {
        static let FirebaseUrlFormat = "https://%@.firebaseio.com"
        struct Storage {
            static let Images = "images"
        }
        
        struct Table {
            static let Users = "users"
            static let Reminders = "reminders"
        }
        
        struct Var {
            
            //User
            static let UserId = "uid"
            static let Username = "username"
            static let NotificationToken = "notify-token"
            static let Range = "range"
            
            //Reminder
            static let ReminderId = "rid"
            static let Name = "name"
            static let ReminderImageUrl = "img-url"
            static let AverageColorHex = "avg-img-hex"
            static let Lat = "lat"
            static let Lon = "lon"
        }
    }

    struct Screen {
        static let Width = UIScreen.main.bounds.size.width
        static let Height = UIScreen.main.bounds.size.height
    }
    
    //Colors
    struct Color {
        static let MainBackground = UIColor(red: 232/255, green: 229/255, blue: 223/255, alpha: 1)
        static let DetailRed = UIColor(red: 183/255, green: 0, blue: 22/255, alpha: 1)
        static let LogoGray = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        static let DefaultHex = "CCCCCC"
    }
    
    struct FontName {
        static let GothamCondensedBook = "GothamCondensed-Book"
    }
    
    //Icons
    struct Icon {

        struct Header {
            static let Back = "IconBack"
            static let Close = "IconClose"
        }
        
        struct Reminder {
        }
    }
    
    struct Image {
        static let DefaultReminderImage = "DefaultReminderImage"
    }
    
    struct PList {
        static let Keys = "Keys"
        static let Main = "Main"
    }
    
    //NIB Names
    struct NIBName {
        
        struct VC {
            static let Landing = "LandingViewController"
        }
        
        //Views
        //static let LocationSlider = "LocationSlider"
    }
    
    //UITableViewCell reuseIdentifiers
    struct ReuseID {
        //static let ReminderFeedCellID = "reminderFeedCell"
    }
    
    //Strings
    struct String {
        
        static let NoTitle = "NoTitle"
        
        struct ReminderType {
            static let Generic = "Generic"
            static let Specific = "Specific"
        }
        
        struct AddNewReminder {
            static let DescriptionDefault = "That reminds me. I need to..."
        }
        
    }
    
    //Constant numerical values
    struct Number {
        static let StatusBarHeight: CGFloat = 20
        
        struct Map {
            static let EarthRadius = 6371000.0
        }
    }
}
