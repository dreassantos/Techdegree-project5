//  PassCreatorViewController.swift
//  AmusementPark
//
//  Created by Andrea Salazar Santos on 5/11/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.
//

import UIKit
class PassCreatorViewController: UITableViewController {
    
    var entrantName: String = "Default Name"
    var nameOfPassType: String = "default pass"
    var birthDate: String?
     var passtype = PassType.basic
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
        case "child": passtype = .basic
        case "Classic": passtype = .classic
        case "VIP": passtype = .vip
        case "Season Pass": passtype = .seasonPassholder
        case "Senior" : passtype = .Senior
        case "food Service" : passtype = .foodService
        case "rideService" : passtype = .rideService
        case "maintenance" : passtype = .maintenance
        case "manager" : passtype = .manager
        case "contractor": passtype = .contractor
        case "vendor": passtype = .vendor
        default: print("could not create pass type")
        }
    }

    @IBAction func areaAccess(_ sender: UIButton) {
        rideAccessStack.isHidden = true
        areaAccessStack.isHidden = false
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



//    @IBAction func createNewPass(_ sender: UIButton) {
//        dismiss(animated: true, completion: nil)
//        performSegue(withIdentifier: "ViewController", sender: self)
//    }

