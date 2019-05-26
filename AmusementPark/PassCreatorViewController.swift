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
    @IBOutlet weak var passSummaryLabel: UILabel!
    @IBOutlet weak var testResultLabel: UILabel!
    @IBOutlet var accessButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    
    @IBAction func rideAccess(_ sender: UIButton) {
    }
    
    @IBAction func discountAccess(_ sender: UIButton) {
    }
    
//    @IBAction func createNewPass(_ sender: UIButton) {
//        dismiss(animated: true, completion: nil)
//        performSegue(withIdentifier: "", sender: self)
//    }
}
