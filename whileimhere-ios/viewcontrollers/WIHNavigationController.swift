//
//  WIHNavigationControllerViewController.swift
//  whileimhere-ios
//
//  Created by Chelsea Power on 4/30/17.
//  Copyright © 2017 Brian Maci. All rights reserved.
//

import UIKit

class WIHNavigationController: UINavigationController {

    let kTitleFont = UIFont(name: K.FontName.GothamCondensedBook, size: 24)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitleAttributes()
        //setCustomBackButtonIcon()
    }
    
    func setTitleAttributes() {
        
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: K.Color.LogoGray, NSFontAttributeName: kTitleFont!]
    }
    
    func setCustomBackButtonIcon() {
        
        let backIcon = UIImage(named: K.Icon.Header.Back)
        navigationBar.backIndicatorImage = backIcon
    }
}
