//
//  WebController.swift
//  ios_assignment_1_James_Grau
//
//  Created by Xcode User on 2019-01-29.
//  Copyright © 2019 James Grau. All rights reserved.
//

import UIKit
import WebKit

class WebController: UIViewController, WKNavigationDelegate {
    
    // Create the needed objects
    @IBOutlet var webPage : WKWebView!
    @IBOutlet var activity : UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Set and initialize the web view to my linked in Profile
        let urlAddress = URL(string: "https://www.linkedin.com/in/jamesgrau")
        let url = URLRequest(url : urlAddress!)
        webPage.load(url)
        webPage.navigationDelegate = self
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.isHidden = false
        activity.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.isHidden = true
        activity.stopAnimating()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
