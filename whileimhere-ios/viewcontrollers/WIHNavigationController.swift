//
//  WIHNavigationControllerViewController.swift
//  whileimhere-ios
//
//  Created by Chelsea Power on 4/30/17.
//  Copyright © 2017 Brian Maci. All rights reserved.
//

import UIKit

class WIHNavigationController: UINavigationController {

    let kTitleWidth: CGFloat = 136
    let kTitleHeight: CGFloat = 35
    private var logoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupLogoView()
        setupLogoTitle()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLogoView() {
        
        logoView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: kTitleWidth, height: kTitleHeight)))
        logoView.image = UIImage(named: "WIHLogo")
        logoView.contentMode = .scaleAspectFit
        logoView.backgroundColor = .black
    }
    func setupLogoTitle() {
        
        navigationItem.titleView = logoView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
