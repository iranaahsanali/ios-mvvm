//
//  ActivityVC.swift
//  MVVM
//
//  Created by Ahsan Ali on 06/12/2018.
//  Copyright © 2018 Ahsan Ali. All rights reserved.
//

import UIKit

class ActivityVC: UIViewController {

    let activity = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.7)

        view.addSubview(activity)
        activity.center = self.view.center
        activity.style = .whiteLarge
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        activity.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        activity.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activity.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activity.startAnimating()
    }
}
