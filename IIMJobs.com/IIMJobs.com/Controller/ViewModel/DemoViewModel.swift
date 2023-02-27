//
//  DemoViewModel.swift
//  MyDemoFree
//
//  Created by mradulatray on 21/02/23.
//

import Foundation

protocol DemoViewModelFunctionsProtocol {
    func getRank()
}

protocol DemoViewModelProtocol {
    
}


class DemoViewModel: DemoViewModelFunctionsProtocol {
    
    func getRank() {
        WebServices.getMagicRankg(dataType: DataResponse.self) { user in
            print(user)
        }
    }
}
