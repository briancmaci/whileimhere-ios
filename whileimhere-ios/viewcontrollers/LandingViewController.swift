//
//  LandingViewController.swift
//  whileimhere-ios
//
//  Created by Chelsea Power on 4/27/17.
//  Copyright © 2017 Brian Maci. All rights reserved.
//

import UIKit
import FirebaseAuth

class LandingViewController: WIHViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: WIHButton!
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
        
        //FIXME: For now
        gotoReminders()
        
        if (emailTextField.text?.isEmpty)! {
            emailTextField.shake()
            return
        }
        
        if (passwordTextField.text?.isEmpty)! {
            passwordTextField.shake()
            return
        }
        
        loginButton.isEnabled = false
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            
            if error == nil {
                self.onboardCurrentUser(user!)
                self.gotoReminders()
            } else {
                print("Error: \(error.debugDescription)")
                let errorCode = FIRAuthErrorCode(rawValue: (error?._code)!)
                
                switch errorCode! {
                
                    case .errorCodeWrongPassword:
                        self.passwordTextField.shake()
                    
                    case .errorCodeInvalidEmail:
                        self.emailTextField.shake()
                    
                    default:
                        print("Other Error? \(error.debugDescription)")
                }
            }
            
            self.loginButton.isEnabled = true
        })
    }
    
    func tappedSignupButton(sender: UIButton) {
        
        let signup = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        navigationController?.pushViewController(signup, animated: true)
    }
    
    func onboardCurrentUser(_ user: FIRUser) {
        
        CurrentUser.shared.uid = user.uid
        CurrentUser.shared.email = user.email!
    }
    
    func gotoReminders() {
        
        let remindersVC = RemindersViewController(nibName: "RemindersViewController", bundle: nil)
        navigationController?.pushViewController(remindersVC, animated: true)
    }
}
