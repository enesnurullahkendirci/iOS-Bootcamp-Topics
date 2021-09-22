//
//  popupViewController.swift
//  BasicUIComponents
//
//  Created by Enes N KENDİRCİ on 22.09.2021.
//

import UIKit

class popupViewController: UIViewController {
    
    
    @IBAction func settingsClicked(_ sender: UIButton) {
        
        if UIApplication.shared.canOpenURL(URL(string: UIApplication.openSettingsURLString)!){
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
        }
        
        

//        if let url = URL(string: UIApplication.openSettingsURLString) {
//            if UIApplication.shared.canOpenURL(url) {
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//            }
//        }
    }
    
    @IBAction func cancelClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
