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
    //Text Field Outlet
    var status: Bool = false
    var firstName: String = "Entrant"
    var lastName: String = ""
    var passName: String = "Default"
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
    
    func disableStack(_ stackName: UIStackView){
        stackName.isUserInteractionEnabled = false
        stackName.alpha = 0.3
    }
    
    func enableStack(_ stackName: UIStackView){
        stackName.isUserInteractionEnabled = true
        stackName.alpha = 1
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        if status {
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler:{ action in
                self.performSegue(withIdentifier: "CreatePassSegue", sender: nil)
            }))
        } else {
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        }
        self.present(alert, animated: true)
    }
    
    func checkEntrantDOB() {
        //if the dob string is not empty do this...
        if let dob = dateOfBirthTextField.text, !dob.isEmpty {
        let birthDate = Date.dateFromString(value: dob)
        //Check Entrants DOB to see if its their birthday
        //entrant is a bool for if it was a birthday or not
        if let dob = birthDate {
            status = true //even if its their bday or not the entrant can proceed (except child - check)
            let entrant = Guest(entrantType: .defaultEntrant).birthDayCheck(dateOfBirth: dob)
            if entrant { // it is their birthday display a message.... Alert
                showAlert(title: "Happy Birthday", message:"Happy Birthday \(firstName)! Have a wonderful visit today!")
                }
            //Then check if its a child - Does DOB qualify for a free child pass?
            if passName == "Child"{
                do {
                    _ = try ChildGuest(dateOfBirth: birthDate)
                    status = true
                } catch let error {
                    showAlert(title: "Could Not Create Pass", message: error.localizedDescription)
                    print(error.localizedDescription)
                    status = false
                }
            }}} else {
            //if date of birth was not given.... (And not required)... continue with segue
            status = true
        }
    }
    func checkReqInfo(){
        
    }
    
    
    
    @IBAction func entrantOptionButtons(_ sender: UIButton) {
        guard let pass = sender.currentTitle else {return}
        passName = pass
        guestMenueStack.isHidden = true
        employeeMenueStack.isHidden = true
        switch sender.tag {
        case 0: guestMenueStack.isHidden = false
        case 1: employeeMenueStack.isHidden = false
        default:
            print("Invalid Button")
        }
    }
    
    @IBAction func adjustInputOptions(_ sender: UIButton) {
        //save the selected option as the pass's name
        guard let pass = sender.currentTitle else {return}
        passName = pass
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //check that the correct segue is being preformed.
        guard let destinationVC = segue.destination as? PassCreatorViewController else {return}
        //if so then pass all the needed variables.
        destinationVC.entrantName = "\(firstName) \(lastName)"
        destinationVC.nameOfPassType = passName
    }
    
    @IBAction func generatePass(_ sender: UIButton) {
        //assign vars now that the user is ready to create a pass
        if let first = nameTextField[0].text, let last = nameTextField[1].text {
            firstName = first
            lastName = last
        } else { firstName = "New Entrant" }
        //check the Entrants Date of birth - Alert if its their birthday
        checkEntrantDOB()
        //If all requirements are met continue creating the pass.
        if status {
            performSegue(withIdentifier: "CreatePassSegue", sender: nil)
        }
    }
    
    @IBAction func populateData(_ sender: UIButton) {
        if nameStack.isUserInteractionEnabled {
            nameTextField[0].text = "frank"
            nameTextField[1].text = "asdfasdf"
        }
        if addressStack.isUserInteractionEnabled {
            addressTextField[0].text = streetAddress
            addressTextField[1].text = city
            addressTextField[2].text = state
            addressTextField[3].text = zipCode
        }
    }
}





/*
 
 case "Senior":
 do {
 let _ = try SeniorGuest(firstName: firstName, lastName: lastName, dateOfBirth: birthDate)
 } catch let error {
 print(error.localizedDescription)
 }
 case "Vendor":
 do {
 
 guard let companyName = vendorCompanyTextField[1].text, let serviceDateString = vendorCompanyTextField[2].text else {return}
 let serviceDate = Date.dateFromString(value: serviceDateString)
 let _ = try Vendor(firstName: firstName, lastName: lastName, dateOfBirth: birthDate, companyName: companyName, dateOfVisit: serviceDate)
 } catch let error {
 print(error.localizedDescription)
 }
 
 */
