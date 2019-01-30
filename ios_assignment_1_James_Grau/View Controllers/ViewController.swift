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

// This is the class which holds the main view controller for the application
class ViewController: UIViewController {
    // Create an action that will be used to allow other pages to close displaying the main page of the application
    @IBAction func unwindToHomeVC (sender : UIStoryboardSegue) {}

    // This function is used to perform operation on the page after loading
    override func viewDidLoad() {
        // Call the super class and perform the needed operation
        super.viewDidLoad()
    }
}
