//
//  Kiosk.swift
//  AmusementPark
//
//  Created by Andrea on 3/17/19.
//  Copyright © 2019 SantosAndrea. All rights reserved.
//

import Foundation
import UIKit

enum KioskError{
    case doubleSwipe
}

extension KioskError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .doubleSwipe: return "Your pass was already swiped"
        }
    }
}

class Kiosk {
    func doubleSwipeCheck(lastSwipe: Date) throws {
        let passedTime = Calendar.current.dateComponents([.second], from: lastSwipe, to: Date())
        if let second = passedTime.second {
            if second < 5 {
                throw KioskError.doubleSwipe
            }
        }
    }
    
    func validateAccess(pass: Pass, at area: AreaAccess) -> String {
        if pass.areaAccess.contains(area){
            return ("\(pass.passName) pass - You have access to the \(area) area\n")
        }else {
            return ("\(pass.passName) pass - Access Denied: You do not have access to the \(area) area\n")
        }
    }
    
    func validateAccess(pass: Pass, areaAccessArray: [AreaAccess], at area: AreaAccess) -> String {
        print(pass.passName)
        print(areaAccessArray)
        if areaAccessArray.contains(area){

            return ("\(pass.passName) pass - You have access to the \(area) area\n")
        }else {
            return ("\(pass.passName) pass - Access Denied: You do not have access to the \(area) area\n")
        }
    }
    
    func validateAccess(pass: Pass, at ride: RideAccess) -> String {
        if pass.rideAccess.contains(.noAccess) || !(pass.rideAccess.contains(ride)){
            return ("\(pass.passName) pass - Access Denied: You do not have access to the rides\n")
        }
        else {
            return ("\(pass.passName) pass - Access Granted: You have access to all rides \n")
        }
    }
    
    func validateAccess(discountToCheck: String?, pass: Pass, discount: Int) -> String {
        if let discountToCheck = discountToCheck {
        switch discountToCheck {
        case "Food Discount":
            if pass.discountAccessFor.food == discount {
                        return ("\(pass.passName) pass - Access Granted: You qualify for a food discount of \(discount)%\n")
                        }else {
                            return ("\(pass.passName) pass - Access Denied: You do not qualify for a food discount of \(discount)%\n")
                        }
        case "Merchandise Discount":
                        if pass.discountAccessFor.merchandise == discount {
                            return ("\(pass.passName) pass - Access Granted: You qualify for a merchandise discount of \(discount)%\n")
                        }else {
                            return ("\(pass.passName) pass - Access Denied: You do not qualify for a merchandise discount of \(discount)%\n")
                        }
        default: return "Discount does not exist"
        }
        }
        return ""
    }
}
    
//        if discountToCheck == "food" {
//            if pass.discountAccessFor.food == discount {
//                return ("\(pass.passName) pass - Access Granted: You qualify for a food discount of \(foodDiscount)%\n")
//            }else {
//                return ("\(pass.passName) pass - Access Denied: You do not qualify for a food discount of \(foodDiscount)%\n")
//            }
//        }
//         if discountToCheck == "merch" {
//
//
//        if pass.discountAccessFor.merchandise == merchandiseDiscount{
//            print("\(pass.passName) pass - Access Granted: You qualify for a merchandise discount of \(merchandiseDiscount)%\n")
//        }else {
//            print("\(pass.passName) pass - Access Denied: You do not qualify for a merchandise discount of \(merchandiseDiscount)%\n")
//        }
//    }
//}

//let alert = UIAlertController(title: "Access Granted", message: "\(pass.passName) pass - You have access to the \(area) area\n", preferredStyle: UIAlertController.Style.alert)
