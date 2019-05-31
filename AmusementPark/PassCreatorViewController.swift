//  PassCreatorViewController.swift
//  AmusementPark
//  Created by Andrea Salazar Santos on 5/11/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.

import UIKit
class PassCreatorViewController: UITableViewController {
    //vars passed from original ViewController
    var entrantName: String = "Default Name"
    var nameOfPassType: String = "Default pass"
    var birthDate: String?
    var pass: Pass = DefaultPass()
    var entrant = Entrant(entrantType: .defaultEntrant)
    let kiosk = Kiosk()
    var discountToCheck = "Default"
    //Label Outlets for current viewController
    @IBOutlet weak var entrantNameLabel: UILabel!
    @IBOutlet weak var passTypeLabel: UILabel!
    @IBOutlet weak var passSummaryLabel: UILabel!
    @IBOutlet weak var testResultLabel: UILabel!
    //Button outlets
    @IBOutlet var discountButtons: [UIButton]!
    @IBOutlet weak var discountAccessButton: UIButton!
    @IBOutlet var rideAccessButtons: [UIButton]!
    @IBOutlet var areaAccessButtons: [UIButton]!
    //stack Outlets
    @IBOutlet weak var rideAccessStack: UIStackView!
    @IBOutlet weak var areaAccessStack: UIStackView!
    @IBOutlet weak var discountAccessStack: UIStackView!
    @IBOutlet weak var discountOptionsStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideStacks()
        entrantNameLabel.text = entrantName
        passTypeLabel.text = nameOfPassType
//        getEntrantsInfo()
    }
    
//    func getEntrantsInfo(){
        //from previous viewController
//        entrantNameLabel.text = entrantName
//        passTypeLabel.text = nameOfPassType
        //setting the correct pass for testing perposes.
//        switch nameOfPassType {
//        case "Classic": pass = ClassicPass()
//        case "VIP": pass = VipPass()
//        case "Child": pass = ChildPass()
//        case "Season Pass": pass = SeasonPass()
//        case "Senior" : pass = SeniorPass()
//        case "Food Services" : pass = FoodServicesPass()
//        case "Ride Service" : pass = RideServicesPass()
//        case "Maintenance" : pass = MaintenancePass()
//        case "Manager" : pass = ManagerPass()
//        case "Contractor": pass = ContractorPass()
//        case "Vendor": pass = VendorPass()
//        default: print("could not create pass type")
//}}
//    func checkBirthDate(dateString: String){
//        do {
//            let birthDate = Date.dateFromString(value: dateString)
//            _ = try ChildGuest(dateOfBirth: birthDate)
//        } catch let error {
//            print(error.localizedDescription)
//        }
//    }

    @IBAction func areaAccess(_ sender: UIButton) {
        hideStacks()
        areaAccessStack.isHidden = false
        switch sender.currentTitle {
        case "Amusment Park": testResultLabel.text =  kiosk.validateAccess(pass: entrant.pass, at: .amusementPark)
        case "Kitchen": testResultLabel.text =  kiosk.validateAccess(pass: entrant.pass, at: .kitchen)
        case "Ride Control": testResultLabel.text =  kiosk.validateAccess(pass: entrant.pass, at: .rideControl)
        case "Maintenance": testResultLabel.text =  kiosk.validateAccess(pass: entrant.pass, at: .maintenance)
        case "Office": testResultLabel.text =  kiosk.validateAccess(pass: entrant.pass, at: .office)
        default: print(sender.currentTitle)
        }
  
    }
    
    @IBAction func rideAccess(_ sender: UIButton) {
        hideStacks()
        rideAccessStack.isHidden = false
        switch sender.currentTitle {
        case "All Rides": testResultLabel.text = kiosk.validateAccess(pass: entrant.pass, at: .allRides)
        case "Skip Lines": testResultLabel.text = kiosk.validateAccess(pass: entrant.pass, at: .skipTheLines)
        default: print("There are only two selections...yet \(sender.currentTitle) was selected. Check")
        }
    }
    
    func hideStacks(){
        areaAccessStack.isHidden = true
        discountAccessStack.isHidden = true
        rideAccessStack.isHidden = true
        discountOptionsStack.isHidden = true
        discountAccessStack.isHidden = true
    }
    
    
    
    @IBAction func discountButton(_ sender: UIButton) {
        hideStacks()
        discountOptionsStack.isHidden = false
    }
    @IBAction func FoodDiscount(_ sender: UIButton) {
        hideStacks()
        discountAccessStack.isHidden = false
        discountToCheck = "Food Discount"
    }
    
    @IBAction func MerchandiseDiscount(_ sender: UIButton) {
        hideStacks()
        discountAccessStack.isHidden = false
        discountToCheck = "Merchandise Discount"
    }
    
    @IBAction func discountAccess(_ sender: UIButton) {
        switch sender.currentTitle {
        case "0":
            testResultLabel.text = kiosk.validateAccess(discountToCheck: discountToCheck, pass: entrant.pass, discount: 0)
        case "10":
            testResultLabel.text = kiosk.validateAccess(discountToCheck: discountToCheck, pass: entrant.pass, discount: 10)
        case "15":
            testResultLabel.text = kiosk.validateAccess(discountToCheck: discountToCheck, pass: entrant.pass, discount: 15)
        case "20":
            testResultLabel.text = kiosk.validateAccess(discountToCheck: discountToCheck, pass: entrant.pass, discount: 20)
        case "25":
            testResultLabel.text = kiosk.validateAccess(discountToCheck: discountToCheck, pass: entrant.pass, discount: 25)
        default: testResultLabel.text = "Select A Discount"
        }
    }
    
    @IBAction func dismissVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
