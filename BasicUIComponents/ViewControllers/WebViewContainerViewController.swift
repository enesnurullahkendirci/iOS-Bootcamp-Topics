//
//  WebViewContainerViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 18.09.2021.
//

import UIKit
import WebKit

class WebViewContainerViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var toolBar: UIToolbar!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad() // html content gosterelim font ve font buyuklugunu css ile degistirelim

        // Do any additional setup after loading the view.
        
//        let preferences = WKPreferences()
//        preferences.javaScriptEnabled = true
//
//        let configuration = WKWebViewConfiguration()
//        configuration.preferences = preferences
        
        activityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicatorView.color = .red
        activityIndicatorView.startAnimating()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: activityIndicatorView)
        
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url,
                                    cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                    timeoutInterval: TimeInterval(8))
        
        webView.allowsBackForwardNavigationGestures = true
        webView.load(urlRequest)
        webView.addObserver(self,
                            forKeyPath: #keyPath(WKWebView.isLoading),
                            options: .new,
                            context: nil)
        
        webView.uiDelegate = self
        webView.navigationDelegate = self
        
        webView.scrollView.delegate = self // To use the scrollview delegate methods.
    }
    
    private var activityIndicatorView: UIActivityIndicatorView!
    
    var urlString: String!
    
//    override class func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "loading" {
//            if webView.isLoading {
//
//            }
//        }
//    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading" {
            if webView.isLoading {
                activityIndicatorView.startAnimating()
            } else {
                activityIndicatorView.stopAnimating()
            }
            
            activityIndicatorView.isHidden = !webView.isLoading
        }
        
        // when it isn't avaible, buttons are NOT enable
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
        
    }
    
    //Method of toolbar buttons
    @IBAction func toolbarButtonsTapped(_ sender: UIBarButtonItem) {
        
        switch sender.title {
        case "back":
            webView.goBack()
        case "forward":
            webView.goForward()
        case "refresh":
            webView.reload()
        case "safari":
            openWithSafari()
        default:
            return
        }
    }
    
    func openWithSafari() {
        if let url = self.webView.url { //get current URL
            UIApplication.shared.open(url) //open url with safari
        }
    }
}

extension WebViewContainerViewController: WKUIDelegate {
    
}

extension WebViewContainerViewController: WKNavigationDelegate {
    
}

extension WebViewContainerViewController: UIScrollViewDelegate{
    
    //
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let needHide = velocity.y >= 0 ? true : false // detect way of drag
        
        //hide bars
        toolBar.isHidden = needHide
        navigationController?.setNavigationBarHidden(needHide, animated: true)
    }
    
}
