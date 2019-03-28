//  Test.swift
//  AmusementPark
//
//  Created by Andrea on 3/17/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.
//

import Foundation

class Test {
    //testing Guests----------------------
    let classicGuest = ClassicGuest()
    let vipGuest = VipGuest()
    let childGuest = ChildGuest()
    
    //testing Employees--------------------
    let foodServiece = FoodServicesEmployee(firstname: " ", lastName: " ", streetAddress: " ", city: " ", state: " ", zipCode: 09876)
    
    let rideServices = RideServicesEmployee(firstname: " ", lastName: " ", streetAddress: " ", city: " ", state: " ", zipCode: 09876)
    
    let manager = Manager(firstname: " ", lastName: " ", streetAddress: " ", city: " ", state: " ", zipCode: 09876)
    
    let contractor = Contractor(firstname: " ", lastName: " ", streetAddress: " ", city: " ", state: " ", zipCode: 09876)


//testing access
   // let vipAreaAccess = vipGuest.swipeAtGate(at: .maintenance)
    let vipGuest2 = VipGuest().swipeAtGate(at: .amusementPark)
    let vipGuest3 = VipGuest().swipeAtRide(at: .allRides)
    let vipGuest4 = VipGuest().swipeAtRegister(foodDiscount: 10, merchandiseDiscount: 40)
}



