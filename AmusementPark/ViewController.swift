//
//  ViewController.swift
//  AmusementPark
//
//  Created by Andrea on 3/2/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    //button outlets
    @IBOutlet var entrantOptionButtons: [UIButton]!
    //Text Field Outlets
    var passName = ""
    //Name fields
    @IBOutlet var nameTextField: [UITextField]!
    @IBOutlet var addressTextField: [UITextField]!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet var vendorCompanyTextField: [UITextField]!
    //Stacks
    @IBOutlet weak var employeeMenueStack: UIStackView!
    @IBOutlet weak var guestMenueStack: UIStackView!
    @IBOutlet weak var companyServiceDate: UIStackView!
    @IBOutlet weak var addressStack: UIStackView!
    @IBOutlet weak var companyStack: UIStackView!
    @IBOutlet weak var nameStack: UIStackView!
    @IBOutlet weak var ssnStack: UIStackView!
    @IBOutlet weak var projectNumberStack: UIStackView!
    @IBOutlet weak var dobStack: UIStackView!
    @IBOutlet weak var entrantInfoStack: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guestMenueStack.isHidden = true
        employeeMenueStack.isHidden = true
        companyServiceDate.isHidden = true
        //cant fill out fields until you make a selection
        disableStack(nameStack)
        disableStack(dobStack)
        disableStack(companyStack)
        disableStack(addressStack)
        disableStack(projectNumberStack)
        disableStack(ssnStack)
        //        _ = Test.guestTest()
        //        _ = Test.employeeTest()
        //        _ = Test.swipeTest()

    }
    
    @IBAction func entrantOptionButtons(_ sender: UIButton) {
        guestMenueStack.isHidden = true
        employeeMenueStack.isHidden = true
        switch sender.tag {
        case 0: guestMenueStack.isHidden = false
        case 1: employeeMenueStack.isHidden = false
        default:
            print("Invalid Button")
        }
    }
    
    func disableStack(_ stackName: UIStackView){
        stackName.isUserInteractionEnabled = false
        stackName.alpha = 0.3
    }
    
    func enableStack(_ stackName: UIStackView){
        stackName.isUserInteractionEnabled = true
        stackName.alpha = 1
    }
    
    @IBAction func adjustInputOptions(_ sender: UIButton) {
        //Reset all stacks
        disableStack(nameStack)
        disableStack(companyStack)
        disableStack(addressStack)
        disableStack(projectNumberStack)
        disableStack(ssnStack)
        companyServiceDate.isHidden = true
        //anyone can submit a date of birth
        enableStack(dobStack)
        switch sender.tag {
        case 9:
        enableStack(nameStack)
        case 2,3,8,10,11,12:
        enableStack(nameStack)
        enableStack(addressStack)
        case 4:
        enableStack(nameStack)
        enableStack(companyStack)
        companyServiceDate.isHidden = false
        default:
            print("Could not generate pass")
        }
    }
    
    //This is ran before the segue is actioned
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        guard let destinationVC = segue.destination as? PassCreatorViewController else {return}
        if let first = nameTextField[0].text, let last = nameTextField[1].text {
            destinationVC.entrantName = "\(first) \(last)"
        } else {
            destinationVC.entrantName = " "
        }
        destinationVC.nameOfPassType = passName
        destinationVC.birthDate = dateOfBirthTextField.text
    }
    
    
    @IBAction func generatePass(_ sender: UIButton) {
    }

    @IBAction func populateData(_ sender: UIButton) {
        if nameStack.isUserInteractionEnabled {
            nameTextField[0].text = firstName.randomElement()
            nameTextField[1].text = lastName.randomElement()
        }
        if addressStack.isUserInteractionEnabled {
            addressTextField[0].text = streetAddress
            addressTextField[1].text = city
            addressTextField[2].text = state
            addressTextField[3].text = zipCode
        }
    }
}

/*TODO:
 remove text from field when switching
 remove that date of service on switch
 populate data for company name
 populat data fix address
 randomly populate date of birth 
*/
