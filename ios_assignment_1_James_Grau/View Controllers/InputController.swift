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

// This class is used to control the input view page
class InputController: UIViewController, UITextFieldDelegate {
    // Initialize the items on the form
    @IBOutlet var lblAge : UILabel!
    @IBOutlet var lblGender : UILabel!
    @IBOutlet var txtName : UITextField!
    @IBOutlet var txtAddress : UITextField!
    @IBOutlet var txtPhoneNumber : UITextField!
    @IBOutlet var txtEmailAddress : UITextField!
    @IBOutlet var sldAge : UISlider!
    @IBOutlet var swtGender : UISwitch!
    @IBOutlet var dtpBirthday : UIDatePicker!

    // This function is used to perform the setup of the page
    override func viewDidLoad() {
        // Call the super class and perform the needed operations
        super.viewDidLoad()
        
        // Always keep the max date for the birthday date picker to the date of the app run time and the minumum to the current date - 100 years
        dtpBirthday.maximumDate = Date()
        dtpBirthday.minimumDate = getNewBirthdayYear(yearsToSubtract: 100)
        
        // Update the birthday year based on the slider
        updateBirthdayYearDate()
    }
    
    // This fucntion is used to update the date picker year based off of the slider age Math: ([CurrentYear] - [SliderValue - 'AGE'])
    func updateBirthdayYearDate() {
        // Set the birthday date picker to the adjusted date
        let age = Int(sldAge.value) // Grad the current users age as an int
        let updatedDate = getNewBirthdayYear(yearsToSubtract: age) // Based on the age, grab the udpated date
        dtpBirthday.setDate(updatedDate, animated: true)
    }
    
    // This function is designed to calculate the year based on the current year minus the yearsToSubtract
    func getNewBirthdayYear(yearsToSubtract: Int) -> Date {
        // Create the needed variables
        var dateComponent = DateComponents()
        
        // Subtract the amount of years from the date component
        dateComponent.year = -(yearsToSubtract)
        
        // Take how old the user is and then programatically adust the date picker to match the years old
        let birthdayYear = Calendar.current.date(byAdding: dateComponent, to: Date())
        
        // Return the modified year
        return birthdayYear!;
    }
    
    // Add an action function so that when the age slider value is changed, the label reflects
    @IBAction func ageSliderUpdate(sender : UISlider) {
        // Change the age slider text to represent the current slider value
        lblAge.text = String(format : "%0.f", sender.value)
        
        // Also update the birthday picker year
        updateBirthdayYearDate()
    }
    
    // Add an action function so that when the gender is toggled it switches the gender label to reflect the correct gender
    @IBAction func toggleGender(sender : UISwitch) {
        // Switch based on the switch state
        switch sender.isOn {
            // Perform the case for when the switch is on
            case true:
                // Set the gender label to display for Male
                lblGender.text = "Male"
            break
            
            // Perform the case for when the switch is off
            case false:
                // Set the gender label to display for Female
                lblGender.text = "Female"
            break
        }
    }
    
    // This action is used to display a thank you message to the user thanking for their time
    @IBAction func submitInfo(sender : UIButton) {
        // Create the needed variables
        let name = txtName.text
        let email = txtEmailAddress.text
        var alertTitle = "Oops... Theres an Issue."
        var alertMessage = ""
        var alertButtonTitle = "I'll Try Again"
        
        // Check to make sure the user enterd the name and email adderss
        if((name?.count)! > 0 && (email?.count)! > 0) {
            // Check to make sure the email is a valid email address
            if((email?.isValidEmail())!) {
                // Set the alert items
                alertTitle = "Thank you for your Time!"
                alertMessage = "Thank you " + name! + " of " + email! + " for your time!"
                alertButtonTitle = "No Problem!"
            }else{
                // Set the alert message
                alertMessage = "Looks like that is not a valid email address.  Please correct it and try again."
            }
        }else{
            // Set the alert message
            alertMessage = "Looks like you haven't entered your name and/or email address.  Those items are required and need to be entered before submitting."
        }
        
        // Initialize the alert
        let alert = UIAlertController(title : alertTitle, message : alertMessage, preferredStyle: .alert)
        let alertButton = UIAlertAction(title: alertButtonTitle, style: .default, handler: nil)
        
        // Add the action button the the alert
        alert.addAction(alertButton)
        
        // Present the alert message to the user.
        present(alert, animated: true)
    }
    
    // This function is used to close the keyboard after the user is done with it
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Return that the user should be done with the keyboard
        return textField.resignFirstResponder()
    }
}

// Add an extension to the string class that allows for a string to be checked if it is a valid email address or not
// Adapted from https://stackoverflow.com/a/26503188
extension String {
    // Create the function that will take the string and evaluate if it is a proper email address and return the Boolean result
    func isValidEmail() -> Bool {
        // Create the regular expression that matches a proper email address
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        
        // Run the regular expression against the string and return the Boolean result
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
