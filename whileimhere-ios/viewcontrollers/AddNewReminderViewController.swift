//
//  AddNewReminderViewController.swift
//  whileimhere-ios
//
//  Created by Chelsea Power on 4/30/17.
//  Copyright © 2017 Brian Maci. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class AddNewReminderViewController: WIHViewController {
    
    @IBOutlet weak var mapView: WIHMapView!
    @IBOutlet weak var reminderType: UISegmentedControl!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
    }
    
    func initialSetup() {
        
        initMapView()
        setupTextField()
        setupReminderType()
        setupButtons()
    }

    func initMapView() {
    
    }
    
    func setupTextField() {
    
    }
    
    func setupReminderView() {
    
    }
    
    func setupReminderType() {
    
    }
    
    func setupButtons() {
    
    }
}
