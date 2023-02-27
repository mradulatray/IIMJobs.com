//
//  ViewController.swift
//  IIMJobs.com
//
//  Created by mradulatray on 23/02/23.
//

import UIKit
import SwiftyJSON



struct User: Initializable {
    
    let name: String
    let email: String
    let address: String
    
    init(_ json: JSON) {
        self.name = json["name"].stringValue
        self.email = json["email"].stringValue
        self.address = json["address"].stringValue
    }
}

struct Creater: Initializable {
    
    let name: String
    let email: String
//    let address: String
    
    init(_ json: JSON) {
        self.name = json["name"].stringValue
        self.email = json["email"].stringValue
//        self.address = json["address"].stringValue
    }
}

//class Networkings {
//
//    static func getData<T: Initializable>(dataType: T.Type, completion: @escaping (T)->Void ) {
//        let jsonData = JSON(["name": "Mradul", "email": "mradul@yopmail.com", "address": "Delhi"])
//        let data = dataType.init(jsonData)
//        completion(data)
//    }
//}

class ViewController: UIViewController {
    
    // MARK: - Variables
    // ====================
    let viewModel = DemoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        demoApiCall()
       
//        Networkings.getData(dataType: User.self) { data in
//            print(data)
//            print(data.name)
//            print(data.email)
//            print(data.address)
//        }
//
//        Networkings.getData(dataType: Creater.self) { data in
//            print(data)
//            print(data.name)
//            print(data.email)
////            print(data.address)
//        }
        
//#if Paid
//        print("app in paid mode")
//#else
//        print("app in fre mode")
//#endif
    }
    
    
    func demoApiCall() {
        self.viewModel.getRank()
    }
}


