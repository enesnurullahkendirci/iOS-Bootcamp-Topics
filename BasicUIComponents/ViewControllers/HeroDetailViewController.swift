//
//  heroDetailViewController.swift
//  BasicUIComponents
//
//  Created by Enes N KENDİRCİ on 21.09.2021.
//

import UIKit
import Hero

class HeroDetailViewController: UIViewController {
    
    @IBOutlet weak var blueView: UIView!
    
    @IBOutlet weak var fibNumber: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    var fibArray: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.hero.isEnabled = true
        fibNumber.heroID = "fibNumber"
        blueView.heroID = "resultView"
        calculateButton.heroID = "calculate"
        
    }
    
    @IBAction func calculateClicked(_ sender: UIButton) {
        let number = fibNumber.text ?? "0"
        calculateFib(fibNumber: Int(number) ?? 0)
        self.performSegue(withIdentifier: "secondHero", sender: self)
    }
    
    func calculateFib(fibNumber n: Int) {
        
        switch n {
        case 0:
            fibArray = []
        case 1:
            fibArray = [1]
        case 92...:
            fibNumber.text = "overflow"
        default:
            fibArray = [1, 1]
            (2...n).forEach { i in
                fibArray.append(fibArray[i - 1] + fibArray[i - 2])
            }
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "secondHero",
           let destinationVC = segue.destination as? HeroDetailSecondViewController {
            destinationVC.number = fibNumber.text ?? "0"
            destinationVC.fibArray = fibArray
        }
        
    }
    
    
}
