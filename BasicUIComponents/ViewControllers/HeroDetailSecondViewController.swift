//
//  HeroDetailSecondViewController.swift
//
//
//  Created by Enes N KENDİRCİ on 23.09.2021.
//

import UIKit
import Hero

class HeroDetailSecondViewController: UIViewController {
    
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var fibNumber: UITextField!
    @IBOutlet weak var calculate: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var number: String = "" //for get input from firstVC
    var fibArray: [Int] = [] //for get calculated fibonacci numbers from firstVC
    var randomColors: [UIColor] = [] //contents of cells
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hero.isEnabled = true //turned on Hero
        
        //added heroId's
        fibNumber.heroID = "fibNumber"
        calculate.heroID = "calculate"
        resultView.heroID = "resultView"
        
        fibNumber.text = number //set input from firstVC
        randomColorAppendToArray(Int(number) ?? 0) //contents created
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell") //cell was registered
        collectionView.hero.modifiers = [.cascade] //animation added
        
        if fibArray.count >= 1 { //Change result when get correct input
            resultLabel.text = String(fibArray[fibArray.count - 1])
        }
    }
    
    func randomColorAppendToArray(_ number: Int) -> Void {
        
        switch number{ //create contents when input bigger than 0
        case 0 :
            break
        default:
            for _ in 1...number {
                let color = UIColor.random
                randomColors.append(color)
            }
        }
    }
    
    @IBAction func recalculateClicked(_ sender: UIButton) { //recalculate button method
        hero.dismissViewController(completion: nil) //return to firstVC
    }
}

extension HeroDetailSecondViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomColors.count //created as many cells as the number of content.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell //create resuablecell
        cell.backgroundColor = randomColors[indexPath.row] // added content
        cell.hero.modifiers = [.fade, .scale(0.5)] // hero animation
        cell.addLabelToCell(String(fibArray[indexPath.row])) // added content
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.height / 2.5, height: 120) //layout set
    }
    
    
}
