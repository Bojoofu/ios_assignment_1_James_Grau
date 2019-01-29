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
    @IBOutlet var txtName : UITextField!
    @IBOutlet var txtAddress : UITextField!
    @IBOutlet var txtPhoneNumber : UITextField!
    @IBOutlet var txtEmailAddress : UITextField!
    @IBOutlet var sldAge : UISlider!
    @IBOutlet var swtGender : UISwitch!
    @IBOutlet var datBirthday : UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
