/**
 *
 * Student Name: James Grau
 * Student ID: 991443203
 * Due Date : February 3, 2019 @ 11:30 PM
 * Description: Assignment 1
 *
**/

// Import the needed packages
import UIKit
import WebKit

// This class is used to control the Web page operations
class WebController: UIViewController, WKNavigationDelegate {
    // Create the needed objects
    @IBOutlet var webPage : WKWebView!
    @IBOutlet var activity : UIActivityIndicatorView!

    // This is the main method used to perform operations after the page has loaded
    override func viewDidLoad() {
        // Call the super class and perform the needed operations
        super.viewDidLoad()

        // Set and initialize the web view to my linked in Profile
        let urlAddress = URL(string: "https://www.linkedin.com/in/jamesgrau")
        let url = URLRequest(url : urlAddress!)
        webPage.load(url)
        webPage.navigationDelegate = self
    }
    
    // This function is used start the activity spinner animation once the page is loading
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        // Display the activity spinner and start its animation
        activity.isHidden = false
        activity.startAnimating()
    }
    
    // This function is used to hide and stop animation the activity spinner once the web page has loaded
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // Hide the activity spinner and stops its animation
        activity.isHidden = true
        activity.stopAnimating()
    }
}
