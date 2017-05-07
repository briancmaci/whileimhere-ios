//
//  WIHViewController.swift
//  whileimhere-ios
//
//  Created by Chelsea Power on 4/27/17.
//  Copyright © 2017 Brian Maci. All rights reserved.
//

import UIKit

class WIHViewController: UIViewController {

    private var navigationLogoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = K.Color.MainBackground
        setupLogoView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationTitle()
        setBackButtonAttributes()
    }
    
    func setupLogoView() {
        
        navigationLogoView = UIView(frame: .zero)
        
        let logoView = UIImageView(image: UIImage(named: "WIHLogoNavigationBar"))
        logoView.contentMode = .scaleAspectFit
        logoView.center = .zero
        
        navigationLogoView.addSubview(logoView)
    }
    
    func setNavigationTitle(_ title: String = K.String.NoTitle ) {
        
        if title == K.String.NoTitle {
            navigationItem.titleView = navigationLogoView
        } else {
            navigationItem.title = title
            navigationItem.titleView = nil
        }
    }
    
    func setBackButtonAttributes() {
        
        //let backIconView = UIImageView(image: UIImage(named: K.Icon.Header.Back))
        
        //navigationController?.navigationBar.backIndicatorImage = backIcon
        //navigationController?.navigationBar.backItem?.title = ""
        
        let buttonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(UIImage(named: K.Icon.Header.Back), for: .normal, barMetrics: .default)
        //let buttonItem = UIBarButtonItem(customView: backIconView)
        //buttonItem.title = ""
        navigationItem.backBarButtonItem = buttonItem
    }
}
