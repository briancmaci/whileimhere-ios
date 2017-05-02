//
//  WIHViewController.swift
//  whileimhere-ios
//
//  Created by Chelsea Power on 4/27/17.
//  Copyright © 2017 Brian Maci. All rights reserved.
//

import UIKit

class WIHViewController: UIViewController {

    private var logoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = K.Color.MainBackground
        
        setupLogoView()
        setupLogoTitle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLogoView() {
        
        logoView = UIImageView(image: UIImage(named: "WIHLogoNavigationBar"))
        logoView.contentMode = .scaleAspectFit

    }
    func setupLogoTitle() {
        
        let logoContainer = UIView(frame: CGRect(origin: .zero, size: .zero))
        logoView.center = .zero
        logoContainer.addSubview(logoView)
        navigationItem.titleView = logoContainer
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
