//
//  FourthAssignmentViewController.swift
//  BasicUIComponents
//
//  Created by Enes N KENDİRCİ on 24.09.2021.
//

import UIKit

class FourthAssignmentViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var colorArray: [UIColor] = [] //this array is content of cells.
    var n = 2 // to set the width of the cell.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCells(count: 10) //create colletionviewcells content
        setUpCollectionView()
    }
    
    private func setUpCells(count number: Int){ //create colletionviewcells content
        for _ in 0...number {
            colorArray.append(UIColor.random)
        }
        
    }
    
    private func setUpCollectionView() {

        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell") //no custom cell class
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout() //setup colloectionview layout
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 4
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    @IBAction func barButtonClicked(_ sender: UIBarButtonItem) { // change UI
        n = (n == 2) ? 1 : 2
        collectionView.reloadData()
    }
}

extension FourthAssignmentViewController:  UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorArray.count // return number of content
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) //create cell
        cell.backgroundColor = colorArray[indexPath.row] //setup cell with our content
        return cell
    }
}
extension FourthAssignmentViewController: UICollectionViewDelegateFlowLayout { //setup layout
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / CGFloat(n) - lay.minimumInteritemSpacing  //change n value when barbutton item clicked. In this way, change the size of the cell.
        
        return CGSize(width: widthPerItem - 8, height: 250)
    }
}
