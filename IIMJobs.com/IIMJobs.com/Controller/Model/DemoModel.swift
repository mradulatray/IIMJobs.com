//
//  DemoModel.swift
//  MyDemoFree
//
//  Created by mradulatray on 21/02/23.
//
import Foundation
import SwiftyJSON

// MARK: - Welcome
struct DataResponse: Initializable {
    var magicRank: MagicRank
    var applications: String
    var success, status: Int
    var message: String?
    var error: Int
    var errorMsg: String
    var notify: String?
    var logout, promemberPrice: String

    enum CodingKeys: String, CodingKey {
        case magicRank, applications, success, status, message, error
        case errorMsg = "error_msg"
        case notify, logout
        case promemberPrice = "promember_price"
    }
    
    internal init(_ json: JSON) {
        self.magicRank = MagicRank(json["magicRank"])
        self.applications = json["applications"].stringValue
        self.success = json["success"].intValue
        self.status = json["status"].intValue
        self.message = json["message"].stringValue
        self.error = json["error"].intValue
        self.errorMsg = json["errorMsg"].stringValue
        self.notify = json["notify"].stringValue
        self.logout = json["logout"].stringValue
        self.promemberPrice = json["promemberPrice"].stringValue
    }
}

// MARK: - MagicRank
struct MagicRank {
    var rank: Int
    var percentile: String
    var upgradeRankFlag, upgradeRank: Int
    var upgradePercentile, upgradeRankText: String
    
    internal init(_ json: JSON) {
        self.rank = json["rank"].intValue
        self.percentile = json["percentile"].stringValue
        self.upgradeRankFlag = json["upgradeRankFlag"].intValue
        self.upgradeRank = json["upgradeRank"].intValue
        self.upgradePercentile = json["upgradePercentile"].stringValue
        self.upgradeRankText = json["upgradeRankText"].stringValue
    }
}

