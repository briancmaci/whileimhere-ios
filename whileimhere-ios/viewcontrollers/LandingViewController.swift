//
//  LandingViewController.swift
//  whileimhere-ios
//
//  Created by Chelsea Power on 4/27/17.
//  Copyright © 2017 Brian Maci. All rights reserved.
//

import UIKit

class LandingViewController: WIHViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initialSetup()
    }

    func initialSetup() {
        
        initTextFields()
        initButtons()
    }
    
    func initTextFields() {
        
        
    }
    
    func initButtons() {
     
        loginButton.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(tappedSignupButton), for: .touchUpInside)
    }
    
    //CTA
    func tappedLoginButton(sender: UIButton) {
        print("Login tapped")
    }
    
    func tappedSignupButton(sender: UIButton) {
        
        let signup = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        navigationController?.pushViewController(signup, animated: true)
    }
}
