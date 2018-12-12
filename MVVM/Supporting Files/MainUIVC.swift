//
//  MainUIVC.swift
//  MVVM
//
//  Created by Ahsan Ali on 10/12/2018.
//  Copyright © 2018 Ahsan Ali. All rights reserved.
//

import Foundation
import UIKit

class MainUIVC: UIViewController {
    
    let activityIndicator = ActivityVC()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startActivityIndicator()
    {
        activityIndicator.view.frame = self.view.frame
        self.view.addSubview(activityIndicator.view)
    }
    
    func stopActivityIndicator()
    {
        self.activityIndicator.view.removeFromSuperview()
    }
    
    func ShowAlertMessage(msg:String){
        let alert = UIAlertController(title: "Application Name", message: msg, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            (result : UIAlertAction) -> Void in
            //self.navigationController?.popToRootViewController(animated: true)
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}
