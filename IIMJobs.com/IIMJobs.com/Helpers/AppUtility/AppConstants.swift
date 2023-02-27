//
//  AppConstants.swift
//  IIMJobs.com
//
//  Created by mradulatray on 24/02/23.
//

import Foundation

enum AppConstants {
    static var appName              = "WoCo"
    static var appDefaultFbToken    = "dsfdsafsdafdsafyudstuyftsadcfsyadcfuyadsucf"
    static var format               = "SELF MATCHES %@"
    static let emailRegex           = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    static var mobileRegex          = "^[0-9]{7,15}$"
    //    static var passwordRegex        = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{6,32}$"
    static var passwordRegex        = "^[a-zA-Z0-9!@#$%&*]{6,16}"
    static var defaultDate          = "0000-00-00"
    static var emptyString          = ""
    static var whiteSpace           = " "
    static var zero                 = "0"
    static let locationSchema       = "iata"
    
    //MARK:- LOCATION
    static let defaultLat           = 36.7167
    static let defaultLng           = -4.4260
    
    //MARK:- KEYS AND TOKENS
    static let skyscannerAPIKey     = "fl237657248814561097143788346941"
    static let authToken            = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb21haW4iOiJpaW1qb2JzLmNvbSIsImlkIjoiNTQxMzUzIiwic3RhdHVzIjoxLCJ0eXBlIjoyLCJleHBpcmUiOjE2Nzk1NTU4MzV9.LoVxhUQDF_UHykRo7gfC3VclBIZI2zs85EpP46wz7Qk"//"Basic UGlmZG55WUdkc2lpJCVuZHNqNWdAI2hkc2Y4NGhrZGZZVEM6SERodWRzaipeZHM0ZUhUcjU2NzUjaGRkaA=="
    
    static let googleId = "279942585993-mgnr5m3i69cd51lirpi8inm7akdv2ufa.apps.googleusercontent.com"//testing
    
    static var awss3PoolId          =  "us-east-1:b1f250f2-66a7-4d07-96e9-01817149a439"
}

//extension AppConstants {
//
//    //MARK:- REGION CONSTANTS
//    static let eurpeanRegs = CommonFunctions.convertToSemicolonSeparatedArray(arr: CommonFunctions.getRegionListing().filter({$0.regionName == "Europe"}).map { $0.countryName })
//    static let regionsToInc         = CommonFunctions.convertToSemicolonSeparatedArray(arr: CommonFunctions.getRegionListing().map { $0.countryName })
//    static var regionExcludedByUser = CommonFunctions.convertBackToStringSet(arr: AppUserDefaults.value(forKey: .excludedRegions).stringValue){
//        didSet {
//            let val = CommonFunctions.convertToSemicolonSeparatedArray(arr: AppConstants.regionExcludedByUser)
//            AppUserDefaults.save(value: val, forKey: .excludedRegions)
//        }
//    }
//    static var includedWorldRegions = CommonFunctions.convertBackToStringSet(arr: AppUserDefaults.value(forKey: .includedWorldRegions).stringValue) {
//        didSet {
//            let val = CommonFunctions.convertToSemicolonSeparatedArray(arr: AppConstants.includedWorldRegions)
//            AppUserDefaults.save(value: val, forKey: .includedWorldRegions)
//        }
//    }
//    static var regionsToInclude     = AppUserDefaults.value(forKey: .includedRegions).stringValue {
//        didSet {
//            AppUserDefaults.save(value: AppConstants.regionsToInclude, forKey: .includedRegions)
//        }
//    }
//
//    static var myRegion:String = "Nothing"
//
//    static let regions              = ["Europe", "North America ", "South America", "Central America", "Oceania", "East Asia", "Central Asia", "South Asia", "Asia Pacific", "Middle East & Northern Africa", "Sub-Saharan Africa"]
//}


