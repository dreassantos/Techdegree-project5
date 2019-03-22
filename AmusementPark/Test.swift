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
    
    let childGuest = ChildGuest(dateOfBirth: 6)
    
    let seniorGuest = SeniorGuest(firstName: " ", lastName: " ", dateOfBirth: 65)
    
    let seasonPassHolder = SeasonPassHolder(firstName: " ", lastName: " ", streetAddress: " ", city: " ", state: " ", zipCode: 09876)
    
    //testing Employees--------------------
    let foodServiece = FoodServicesEmployee(firstname: " ", lastName: " ", streetAddress: " ", city: " ", state: " ", zipCode: 09876)
    
    let rideServices = RideServicesEmployee(firstname: " ", lastName: " ", streetAddress: " ", city: " ", state: " ", zipCode: 09876)
    
    let manager = Manager(firstname: " ", lastName: " ", streetAddress: " ", city: " ", state: " ", zipCode: 09876)
    
    let contractor = Contractor(firstname: " ", lastName: " ", streetAddress: " ", city: " ", state: " ", zipCode: 09876)
    
    let vendor = Vendor(firstName: " ", lastName: " ", dateOfBirth: 23, companyName: " ", dateOfVisit: 9000)
}




