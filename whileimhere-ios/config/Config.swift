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
        //static let LandingButtonGray = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        static let DefaultHex = "CCCCCC"
    }
    
    struct FontName {
        static let InterstateLightCondensed = "Interstate-LightCondensed"
    }
    
    //Icons
    struct Icon {

        struct Header {
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
        
    }
    
    //Constant numerical values
    struct Number {
        static let StatusBarHeight: CGFloat = 20
        
        struct Map {
            static let EarthRadius = 6371000.0
        }
    }
}
