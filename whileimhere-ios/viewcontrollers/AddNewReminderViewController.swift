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

class AddNewReminderViewController: WIHViewController, UITextViewDelegate {
    
    @IBOutlet weak var mapView: WIHMapView!
    @IBOutlet weak var reminderType: UISegmentedControl!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationTitle("add new reminder")
    }
    
    func initialSetup() {
        
        addObservers()
        
        setupScrollView()
        initMapView()
        setupNavigationBar()
        setupTextField()
        setupReminderType()
        setupButtons()
    }

    func setupScrollView() {
        
        
    }
    
    func initMapView() {
    
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
    
    func setupTextField() {
    
        descriptionTextView.delegate = self
        descriptionTextView.returnKeyType = .done
        descriptionTextView.text = K.String.AddNewReminder.DescriptionDefault
    }
    
    func setupReminderView() {
    
    }
    
    func setupReminderType() {
    
    }
    
    func setupButtons() {
    
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == K.String.AddNewReminder.DescriptionDefault {
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = K.String.AddNewReminder.DescriptionDefault
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            descriptionTextView.resignFirstResponder()
        }
        
        return true
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
