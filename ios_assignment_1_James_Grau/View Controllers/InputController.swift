//
//  InputController.swift
//  ios_assignment_1_James_Grau
//
//  Created by Xcode User on 2019-01-28.
//  Copyright © 2019 James Grau. All rights reserved.
//

import UIKit

class InputController: UIViewController {
    
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
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Always keep the max date for the birthday date picker to the date of the app run time and the minumum to the current date - 100 years
        dtpBirthday.maximumDate = Date()
        dtpBirthday.minimumDate = getNewBirthdayYear(yearsToSubtract: 100)
        
        // Update the birthday year based on the slider
        updateBirthdayYearDate()
    }
    
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
            
            // Perform the default case for the gender switch
            default:
                // Set the gender label to dissplay for female
                lblGender.text = "Female"
            break
        }
    }
}
