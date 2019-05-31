//  PassCreatorViewController.swift
//  AmusementPark
//
//  Created by Andrea Salazar Santos on 5/11/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.
//

import UIKit
class PassCreatorViewController: UITableViewController {
    
    var entrantName: String = "Default Name"
    var nameOfPassType: String = "Default pass"
    var birthDate: String?
    var pass: Pass = DefaultPass()
    @IBOutlet weak var entrantNameLabel: UILabel!
    @IBOutlet weak var passTypeLabel: UILabel!
    @IBOutlet weak var discountAccess: UIButton!
    @IBOutlet weak var passSummaryLabel: UILabel!
    @IBOutlet weak var testResultLabel: UILabel!
    @IBOutlet var rideAccessButtons: [UIButton]!
    @IBOutlet weak var rideAccessStack: UIStackView!
    @IBOutlet weak var areaAccessStack: UIStackView!
    @IBOutlet var areaAccessButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        areaAccessStack.isHidden = true
        rideAccessStack.isHidden = true
        getEntrantsInfo()
    }
    
    func getEntrantsInfo(){
        entrantNameLabel.text = entrantName
        
        passTypeLabel.text = nameOfPassType
        switch nameOfPassType {
        case "Classic": pass = ClassicPass()
        case "VIP": pass = VipPass()
        case "Child": pass = ChildPass()
        case "Season Pass": pass = SeasonPass()
        case "Senior" : pass = SeniorPass()
        case "Food Services" : pass = FoodServicesPass()
        case "Ride Service" : pass = RideServicesPass()
        case "Maintenance" : pass = MaintenancePass()
        case "Manager" : pass = ManagerPass()
        case "Contractor": pass = ContractorPass()
        case "Vendor": pass = VendorPass()
        default: print("could not create pass type")
        }
    }
    
    func checkBirthDate(dateString: String){
        do {
            let birthDate = Date.dateFromString(value: dateString)
            _ = try ChildGuest(dateOfBirth: birthDate)
        } catch let error {
            print(error.localizedDescription)
        }
    }

    @IBAction func areaAccess(_ sender: UIButton) {
        rideAccessStack.isHidden = true
        areaAccessStack.isHidden = false
              let kiosk = Kiosk()
        switch sender.currentTitle {
        case "Amusment Park": testResultLabel.text =  kiosk.validateAccess(pass: pass, at: .amusementPark)
        case "Kitchen": testResultLabel.text =  kiosk.validateAccess(pass: pass, at: .kitchen)
        case "Ride Control": testResultLabel.text =  kiosk.validateAccess(pass: pass, at: .rideControl)
        case "Maintenance": testResultLabel.text =  kiosk.validateAccess(pass: pass, at: .maintenance)
        case "Office": testResultLabel.text =  kiosk.validateAccess(pass: pass, at: .office)

        default: print(sender.currentTitle)
        }
  
    }
    
    @IBAction func rideAccess(_ sender: UIButton) {
        areaAccessStack.isHidden = true
        rideAccessStack.isHidden = false
    }
    
    @IBAction func discountAccess(_ sender: UIButton) {
        //check if there is a discount using kiosk....
    }
    
    @IBAction func dismissVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
