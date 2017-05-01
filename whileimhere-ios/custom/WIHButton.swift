//
//  WIHButton.swift
//  whileimhere-ios
//
//  Created by Chelsea Power on 4/30/17.
//  Copyright © 2017 Brian Maci. All rights reserved.
//

import UIKit

class WIHButton: UIButton {

    override func awakeFromNib() {
        backgroundColor = K.Color.DetailRed
        setTitleColor(.white, for: .normal)
        
        layer.cornerRadius = frame.size.height / 2
        clipsToBounds = true
    }

}
