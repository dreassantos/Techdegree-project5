//  Test.swift
//  AmusementPark
//
//  Created by Andrea on 3/17/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.
//

import Foundation

class Test {
    
    
    
    static func guestTest(){
        print("---------------Creating Guest Passes---------------")
        // Testing classic guest entry
       // _ = ClassicGuest()
        
        //Testing vip guest entry
        _ = VipGuest()
        
        //Testing child guest entry
        
        //no date of birth
        do {
            _ = try ChildGuest(dateOfBirth: nil)
        } catch let error {
            print(error.localizedDescription)
        }
        
        //free child
        do {
            let birthDate = Date.dateFromString(value: "06/26/2018")
            _ = try ChildGuest(dateOfBirth: birthDate)
        } catch let error {
            print(error.localizedDescription)
        }
            
        //child is too old
        do {
            let birthDate = Date.dateFromString(value: "08/23/1990")
            _ = try ChildGuest(dateOfBirth: birthDate)
        } catch let error {
            print(error.localizedDescription)
        }
        
        // Happy Birthday Guest! (Child)
        do {
            _ = try ChildGuest(dateOfBirth: Date())
        } catch let error {
            print(error.localizedDescription)
        }
        
        //Testing senior
        do {
            let birthDate = Date.dateFromString(value: "07/20/1945")
            let seniorGuest = try SeniorGuest(firstName: "jan", lastName: "jan", dateOfBirth: birthDate)
        } catch let error {
            print(error.localizedDescription)
        }
        
        //Senior Guest - birthday may need to change date for testing purpose
        do {
            let birthDate = Date.dateFromString(value: "03/31/1955")
            let seniorGuest = try  SeniorGuest(firstName: "Carlos", lastName: "Santiago", dateOfBirth: birthDate)
        } catch let error {
            print(error.localizedDescription)
        }
    }

    static func employeeTest() {
        print("---------------Creating Employee Passes---------------")
        
        do{//Nothing missing
            let foodServiece = try FoodServicesEmployee(firstname: "frank", lastName: "Smith", streetAddress: "123 Street", city: "SM", state: "CA ", zipCode: "12345")
        } catch let error {
            print(error.localizedDescription)
        }
        
        do{//missing firstName
        let rideServices = try RideServicesEmployee(firstname: " ", lastName: "Kale", streetAddress: "123 Street", city: "SM", state: "CA", zipCode: "12345")
        } catch let error {
            print(error.localizedDescription)
        }
        
        do{//missing city
        let manager = try Manager(firstname: "Diana", lastName: "Cruz ", streetAddress: "123 Street", city: " ", state: "CA", zipCode: "12345")
        } catch let error {
            print(error.localizedDescription)
        }
        
//        do{//missing state
//        let contractor = try Contractor(firstname: "Dave", lastName: "Sprite", streetAddress: "123 Street", city: "SM ", state: " ", zipCode: "12345")
//        } catch let error {
//            print(error.localizedDescription)
//        }
    }
    
    static func swipeTest() {
        //using just the kiosk
        let kiosk = Kiosk()
        //sqipe at a area
        print("---------------Kiosk Test---------------")
        kiosk.validateAccess(pass: ClassicPass(), at: .amusementPark)
        kiosk.validateAccess(pass: ClassicPass(), at: .maintenance)
        kiosk.validateAccess(pass: VipPass(), at: .amusementPark)
        kiosk.validateAccess(pass: VipPass(), at: .maintenance)
        kiosk.validateAccess(pass: ChildPass(), at: .amusementPark)
        kiosk.validateAccess(pass: ChildPass(), at: .rideControl)
        //swipe ride access
        kiosk.validateAccess(pass: ClassicPass(), at: .allRides)
        kiosk.validateAccess(pass: VipPass(), at: .allRides)
        kiosk.validateAccess(pass: ChildPass(), at: .allRides)
        //Swipe at register
//        kiosk.validateAccess(pass: ClassicPass(), foodDiscount: 30, merchandiseDiscount: 20)
//        kiosk.validateAccess(pass: ClassicPass(), foodDiscount: 0, merchandiseDiscount: 0)
//        kiosk.validateAccess(pass: VipPass(), foodDiscount: 10, merchandiseDiscount: 10)
//        kiosk.validateAccess(pass: VipPass(), foodDiscount: 10, merchandiseDiscount: 20)
//        kiosk.validateAccess(pass: ManagerPass(), foodDiscount: 10, merchandiseDiscount: 10)
//        kiosk.validateAccess(pass: ManagerPass(), foodDiscount: 25, merchandiseDiscount: 25)
        
        //using the kiosk from the entrant class (pass is created first)
//        do{
//            let birthDate = Date.dateFromString(value: "03/30/1960")
//            let seniorGuest1 = try SeniorGuest(firstName: "frances", lastName: "Smith", dateOfBirth: birthDate)
//            try seniorGuest1.swipeAtGate(gate: .amusementPark)
//              //Testing double swiping at gate
//            try seniorGuest1.swipeAtRide(ride: .allRides)
//            try seniorGuest1.swipeAtRide(ride: .allRides)
//        } catch let error {
//            print(error.localizedDescription)
//        }
    }
}





