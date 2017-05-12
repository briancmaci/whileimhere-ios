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

class AddNewReminderViewController: WIHViewController, UITextViewDelegate, GMSMapViewDelegate {
    
    @IBOutlet weak var mapView: WIHMapView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationTitle("add new reminder")
    }
    
    func initialSetup() {
        
        //addObservers()
        
        initMapView()
        initLocationManager()
        setupNavigationBar()
        //setupTextField()
        //setupReminderType()
        setupButtons()
    }

    func setupScrollView() {
        
        
    }
    
    func initMapView() {
    
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.delegate = self
        
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        let marker = GMSMarker(position: coordinate)
        marker.title = "HAAAAYYYY"
        marker.map = mapView
    }
    
    func initLocationManager() {

        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        placesClient = GMSPlacesClient.shared()
    }
    
    func addObservers() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func setupNavigationBar() {
        
        let closeButton = UIButton()
        closeButton.setImage(UIImage(named: K.Icon.Header.Close), for: .normal)
        closeButton.frame = CGRect(origin: .zero, size: CGSize(width: 44, height: 44))
        closeButton.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        
        let closeBarButtonItem = UIBarButtonItem(customView: closeButton)
        
        navigationItem.rightBarButtonItem = closeBarButtonItem
    }
    
    func tappedCloseButton(sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func setupButtons() {
        
        saveButton.addTarget(self, action: #selector(tappedSaveButton), for: .touchUpInside)
    }
    
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView.text == K.String.AddNewReminder.DescriptionDefault {
//            textView.text = ""
//        }
//    }
//    
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if textView.text.isEmpty {
//            textView.text = K.String.AddNewReminder.DescriptionDefault
//        }
//    }
//    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        
//        if text == "\n" {
//            descriptionTextView.resignFirstResponder()
//        }
//        
//        return true
//    }
    
    func tappedSaveButton(_ sender: UIButton) {
        
        print("Save reminder")
    }
    
    func keyboardDidShow(_ notif: NSNotification) {
        let info = notif.userInfo!
        let kbHeight = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)!.cgRectValue.size.height
        
        UIView.animate(withDuration: 0.4) { 
            self.view.frame = CGRect(origin: CGPoint(x: 0, y: -kbHeight), size: UIScreen.main.bounds.size)
        }
        
        
    }
    
    func keyboardWillHide(_ notif: NSNotification) {
        
        UIView.animate(withDuration: 0.4) {
            self.view.frame = UIScreen.main.bounds
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension AddNewReminderViewController: CLLocationManagerDelegate {
    
    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: zoomLevel)
        
        if mapView.isHidden {
            mapView.isHidden = false
            mapView.camera = camera
        } else {
            mapView.animate(to: camera)
        }
        
       // listLikelyPlaces()
    }
    
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        }
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
}
