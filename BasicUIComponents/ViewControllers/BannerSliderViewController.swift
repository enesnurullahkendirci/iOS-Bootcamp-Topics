//
//  BannerSliderViewController.swift
//  BasicUIComponents
//
//  Created by Enes N KENDİRCİ on 17.09.2021.
//

import UIKit

class BannerSliderViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let imageArray: [UIImage] = [UIImage(named: "butters")!, UIImage(named: "eric")!, UIImage(named: "kenny")!, UIImage(named: "token")!, UIImage(named: "zikirmatik")!]
    
    let labelArray: [String] = ["butters", "eric", "kenny", "token", "zikirmatik"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        pageControl.numberOfPages = labelArray.count
        pageControl.addTarget(self, action: #selector(pageControlDidChange), for: .valueChanged)
        
        configureScrollView()
        scrollView.contentSize.height = 1.0

    }
    
    @IBAction func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
        
    }
    
    private func configureScrollView(){
        
        scrollView.contentSize = CGSize(width: view.frame.size.width * CGFloat(imageArray.count), height: view.frame.size.height)
        
        scrollView.isPagingEnabled = true
        
        for index in 0..<imageArray.count{
            let page = UIView(frame: CGRect(x: CGFloat(index) * view.frame.size.width, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height))
            scrollView.addSubview(page)
            let image = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height))
            image.image = imageArray[index]
            image.contentMode = .scaleAspectFit
            page.addSubview(image)
            let label = UILabel(frame: CGRect( x: 50, y: 50, width: 100, height: 100))
            label.text = labelArray[index]
            label.textAlignment = .center
            page.addSubview(label)

        }
    }
    
    
    var currentPage: Double = 0.0
}

extension BannerSliderViewController: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentPage = Double(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(currentPage)
    }
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        
        
        if currentPage <= 0.0 && velocity.x < 0 {
//            scrollView.setContentOffset(CGPoint(x: CGFloat(2) * view.frame.size.width, y: 0), animated: true)
            targetContentOffset[0].x = CGFloat(4) * view.frame.size.width
            
        }
        if currentPage >= 4.0 && velocity.x > 0{
//            scrollView.setContentOffset(CGPoint(x: CGFloat(0) * view.frame.size.width, y: 0), animated: true)
            targetContentOffset[0].x = CGFloat(0) * view.frame.size.width
        }
        
        
    }
}
