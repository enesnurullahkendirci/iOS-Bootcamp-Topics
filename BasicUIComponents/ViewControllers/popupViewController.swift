//
//  popupViewController.swift
//  BasicUIComponents
//
//  Created by Enes N KENDİRCİ on 22.09.2021.
//

import UIKit

class popupViewController: UIViewController {
    
    @IBAction func settingsClicked(_ sender: UIButton) { //go settings button method
        //get settings URL and can it be opened control.
        if UIApplication.shared.canOpenURL(URL(string: UIApplication.openSettingsURLString)!){
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func cancelClicked(_ sender: UIButton) { // cancel button method
        dismiss(animated: true, completion: nil) //return mapVC
    }
    
}
