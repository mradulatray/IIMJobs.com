//
//  WebServices.swift
//  MyDemoFree
//
//  Created by mradulatray on 21/02/23.
//

import Foundation
import SwiftyJSON
import UIKit

protocol Initializable {
    init(_ json: JSON)
}


enum WebServices { }

extension NSError {
    
    convenience init(localizedDescription : String) {
        self.init(domain: "AppNetworkingError", code: 0, userInfo: [NSLocalizedDescriptionKey : localizedDescription])
    }
    
    convenience init(code : Int, localizedDescription : String) {
        self.init(domain: "AppNetworkingError", code: code, userInfo: [NSLocalizedDescriptionKey : localizedDescription])
    }
}

extension WebServices {
    
    static let authHeader : HTTPHeaders = [ApiKey.Authorization : AppConstants.authToken]
    
    // MARK:- Common POST API
    //=======================
    static func commonPostAPI(parameters: JSONDictionary,
                              endPoint: String,
                              headers: HTTPHeaders = [:],
                              loader: Bool = false,
                              success : @escaping SuccessResponse,
                              failure : @escaping FailureResponse,
                              sessionExpire : @escaping FailureResponse) {
        
        AppNetworking.POST(endPoint: endPoint, parameters: parameters, headers: headers, loader: loader, success: { (json,code)  in
            let msg = json[ApiKey.message].stringValue
            switch code {
            case ApiCode.success: success(json)
//            case ApiCode.skyscannerSessionExpire : sessionExpire(NSError(code: code, localizedDescription: msg))
            default:
                let code = json[ApiKey.codeKey].intValue
                switch code {
                case 401:
                    // TODO: - code for refresh the token
                    // ==================================
                    
                    failure(NSError(code: code, localizedDescription: msg))
                default:
                    failure(NSError(code: code, localizedDescription: msg))
                }
            }
        }) { (error) in
            failure(error)
        }
    }
    
    //MARK:- Form Data Post Api
    //=========================
    static func formDataPostAPI(parameter: JSONDictionary,
                                endPoint: String,
                                headers: HTTPHeaders = [:],
                                loader: Bool = false,
                                success : @escaping SuccessResponse,
                                failure : @escaping FailureResponse,
                                sessionExpire : @escaping FailureResponse){
        
    }
    
    
    // MARK:- Common PUT API
    //=======================
    static func commonPutAPI(parameters: JSONDictionary,
                             endPoint: String,
                             headers: HTTPHeaders = [:],
                             loader: Bool = false,
                             success : @escaping SuccessResponse,
                             failure : @escaping FailureResponse) {
        AppNetworking.PUT(endPoint: endPoint, parameters: parameters, headers: headers, loader: loader, success: { (json,code)   in
            let msg = json[ApiKey.message].stringValue
            switch code {
            case ApiCode.success: success(json)
            case ApiCode.tokenExpired :
                print("Token expired")
//                showSystemAlert(title: LocalizedString.error.localized, msg: LocalizedString.userLoggedOut.localized, {
//                    AppRouter.goToHome()
//                })
            default:
                let code = json[ApiKey.codeKey].intValue
                switch code {
                case 401:
//                    AppRouter.logout()
                    failure(NSError(code: code, localizedDescription: msg))
                default:
                    failure(NSError(code: code, localizedDescription: msg))
                }
            }
        }) { (error) in
            failure(error)
        }
    }
    
    // MARK:- Common GET API
    //=======================
    static func commonGetAPI<T: Initializable>(parameters: JSONDictionary = [:],
                             headers: HTTPHeaders = [:],
                             endPoint: String,
                             loader: Bool = false,
                             dataType: T.Type,
                             success: @escaping (T)->Void,
                             failure : @escaping FailureResponse){
        
        AppNetworking.GET(endPoint: endPoint, parameters: parameters, headers: headers, loader: loader, success: { (json,code)  in
            let msg = json[ApiKey.message].stringValue
            switch code {
            case ApiCode.success:
                print(json)
                let data = dataType.init(json)
                success(data)
            default:
                let code = json[ApiKey.codeKey].intValue
                switch code {
                case 401:
//                    AppRouter.logout()
                    failure(NSError(code: code, localizedDescription: msg))
                default:
                    failure(NSError(code: code, localizedDescription: msg))
                }
            }
        }) { (error) in
            failure(error)
        }
    }
    // MARK:- Refresh Token
    //=====================
        static func refreshToken(success: @escaping SuccessResponse,
                                  failure: @escaping FailureResponse) {
//            let param: [String: Any] = [ApiKey.refreshToken:]
//            
//    
//            let params : [String:Any] = [ApiKey.refreshToken:UserModel.main.refreshToken,
//                                         ApiKey.name:UserModel.main.firstName]
//            self.commonPostAPI(parameters: params, endPoint: .refresh, success: { (json) in
////                let token = json["token"].stringValue
////                let refreshToken = json["refresh_token"].stringValue
////                UserModel.main.token = token
////                UserModel.main.refreshToken = refreshToken
////                UserModel.main.saveToUserDefaults()
//                success(json)
//            }, failure: failure)
        }
    
    
    // MARK: - GET MAGIC RANK
    // ======================
    static func getMagicRankg(dataType: DataResponse.Type, completion: @escaping (DataResponse)->Void) {
        commonGetAPI(parameters: [:], headers: authHeader, endPoint: "https://angel.iimjobs.com/api10/job/1223439/magicrank/", dataType: dataType) { data in
            completion(data)
            print(data)
        } failure: { error in
            print(error)
        }
    }
    
    //    //MARK:- GET MODE FLIGHT DETAILS
    //    //==============================
    //    static func getModeFlightDetails(params: JSONDictionary,
    //                                     success: @escaping NotificationDiscountDataSuccess,
    //                                     failure: @escaping FailureResponse){
    //        commonGetAPI(parameters: params, headers: authHeader, endPoint: EndPoint.flightDetailForMode.path, loader: true, success: { (json) in
    //            let model = json[ApiKey.smallResult].arrayValue.map({NotificationDiscountModel($0)})
    //            success(model)
    //        }) { (error) -> (Void) in
    //            failure(error)
    //        }
    //    }
    
    
//    // MARK:- AIRPORT DETAILS
//    // =========================
//    static func getAirportDetails(params: JSONDictionary,count:Int,
//                                  success: @escaping AirportDetailsWithCarrierSuccess,
//                                  failure: @escaping FailureResponse,
//                                  sessionExpire: @escaping FailureResponse) {
//        commonPostAPI(parameters: params, endPoint: EndPoint.airportDetails.path, headers: authHeader, loader: false, success: { (json) in
//            AppUserDefaults.save(value: json[ApiKey.data][ApiKey.skyscannerStatus].stringValue, forKey: .updatesStatus)
//            AppGlobals.minPrice = Int(ceil(json[ApiKey.data][ApiKey.minPrice].doubleValue))
//            AppGlobals.maxPrice = json[ApiKey.data][ApiKey.maxPrice].intValue
//            FilterModel.main.price = AppGlobals.maxPrice
//            AppGlobals.maxDuration = json[ApiKey.data][ApiKey.duration][ApiKey.maxDuration].intValue
//            AppGlobals.minDuration = json[ApiKey.data][ApiKey.duration][ApiKey.minDuration].intValue
//            FilterModel.main.duration = AppGlobals.maxDuration
//            let modelList = json[ApiKey.data][ApiKey.itinerariesData].arrayValue.map { (json) -> FlightCardModel in
//                return FlightCardModel(json)
//            }
//            var airlineModel = json[ApiKey.data][ApiKey.carriers].arrayValue.map { (json) -> AirlineModel in
//                return AirlineModel(json)
//            }
//            let newAirlineModel = airlineModel.filter({$0.airlineCode != AppConstants.emptyString})
//            airlineModel = newAirlineModel
//            let layoverModel = json[ApiKey.data][ApiKey.flightCities].arrayValue.map { (json) -> LayoverCitiesModel in
//                return LayoverCitiesModel(json)
//            }
//            //Check for wrong data should not populate
//            if let flightModel = modelList.first?.outboundFlight{
//                if  flightModel.originStation == AppGlobals.getSourceCode && flightModel.destinationStation == AppGlobals.getDestinationCode && AppGlobals.getOutboundDate == json[ApiKey.data][ApiKey.query][ApiKey.outboundDateValue].stringValue{
//                    if Journey.currentStatus == .twoWay && AppGlobals.getInboundDate != json[ApiKey.data][ApiKey.query][ApiKey.inboundDateValue].stringValue{
//                        print("Wrong api response")
//                        return
//                    }
//                    AppUserDefaults.save(value: json[ApiKey.data][ApiKey.sessionKey].stringValue, forKey: .querySessionKey)
//                }else{
//                    print("Wrong api response")
//                    return
//                }
//            }else{
//                AppUserDefaults.save(value: json[ApiKey.data][ApiKey.sessionKey].stringValue, forKey: .querySessionKey)
//            }
//
//            success(modelList, airlineModel, layoverModel)
//        }, failure: { (error) -> (Void) in
//            failure(error)
//        }) { (error) -> (Void) in
//            sessionExpire(error)
//        }
//    }
//
//    //MARK:- GET MODE FLIGHT DETAILS
//    //==============================
//    static func getModeFlightDetails(params: JSONDictionary,
//                                     success: @escaping NotificationDiscountDataSuccess,
//                                     failure: @escaping FailureResponse){
//        commonGetAPI(parameters: params, headers: authHeader, endPoint: EndPoint.flightDetailForMode.path, loader: true, success: { (json) in
//            let model = json[ApiKey.smallResult].arrayValue.map({NotificationDiscountModel($0)})
//            success(model)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    // MARK:- APPLY FILTER ON AIRPORT DETAILS
//    // ======================================
//    static func applyFilterOnAirportDetails(params: JSONDictionary,
//                                            success: @escaping AirportDetailsSuccess,
//                                            failure: @escaping FailureResponse,
//                                            sessionExpire: @escaping FailureResponse) {
//        commonPostAPI(parameters: params, endPoint: EndPoint.airportDetailsFilter.path, headers: authHeader, loader: true, success: { (json) in
//            AppUserDefaults.save(value: json[ApiKey.data][ApiKey.skyscannerStatus].stringValue, forKey: .updatesStatus)
//            AppUserDefaults.save(value: json[ApiKey.data][ApiKey.sessionKey].stringValue, forKey: .querySessionKey)
//            let modelList = json[ApiKey.data][ApiKey.itinerariesData].arrayValue.map { (json) -> FlightCardModel in
//                return FlightCardModel(json)
//            }
//            success(modelList)
//        }, failure: { (error) -> (Void) in
//            failure(error)
//        }) { (error) -> (Void) in
//            sessionExpire(error)
//        }
//    }
//
//    //MARK:- CREATE CUSTOM NOTIFICATION
//    //=================================
//    static func createCustomNotification(accessToken: String, params: JSONDictionary, success: @escaping CustomNotifiCreateSuccess,
//                                         failure: @escaping FailureResponse,
//                                         sessionExpire: @escaping FailureResponse){
//        let header = [ApiKey.Authorization: "Bearer \(accessToken)"]
//
//        commonPostAPI(parameters: params, endPoint: EndPoint.createNotification.path, headers: header, loader: true, success: { (json) in
//            success()
//        }, failure: { (error) -> (Void) in
//            failure(error)
//        }) { (error) -> (Void) in
//            sessionExpire(error)
//        }
//    }
//
//    //MARK:- UPDATE THE NOTIFICATION
//    //==============================
//    static func updateCustomNotification(accessToken: String, params: JSONDictionary,
//                                         id: String,
//                                         success: @escaping SuccessResponse,
//                                         failure: @escaping FailureResponse){
//        let header = [ApiKey.Authorization: "Bearer \(accessToken)"]
//        commonPutAPI(parameters: params, endPoint: EndPoint.updateNotification.path + id, headers: header, loader: true, success: { (json) in
//            success(json)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    //MARK:- GET NOTIFICATION WORLD DATA
//    //==================================
//    static func getNotificationWorldData(params:JSONDictionary, success: @escaping NotificationWordDataSuccess, failure: @escaping FailureResponse){
//        commonGetAPI(parameters: params, headers: authHeader, endPoint: EndPoint.createNotification.path, loader: true, success: { (json) in
//            //            success(model)
//            print(json)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    //MARK:- GET NOTIFICATION LIST
//    //============================
//    static func getNotificationEventLIst(accessToken: String, params: JSONDictionary,
//                                         success: @escaping NotificationEventDataSuccess,
//                                         failure: @escaping FailureResponse) {
//        let header = [ApiKey.Authorization:"Bearer \(accessToken)"]
//        commonGetAPI(parameters: params, headers: header, endPoint: EndPoint.createNotification.path, loader: false, success: { (json) in
//            let model = json[ApiKey.smallResult][ApiKey.data].arrayValue.map({NotificationEventModel($0)})
//            let currentPage = json[ApiKey.smallResult][ApiKey.currentPage].intValue
//            let lastPage = json[ApiKey.smallResult][ApiKey.lastPage].intValue
//            success(model,currentPage, lastPage)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    //MARK:- GET MANAGE NOTIFICATION LIST
//    //=====================================
//    static func getManageNotification(accessToken: String,
//                                      success: @escaping ManagenotificationSuccess,
//                                      failure: @escaping FailureResponse) {
//        let header = [ApiKey.Authorization:"Bearer \(accessToken)"]
//        commonGetAPI(headers: header, endPoint: EndPoint.manageNotification.path, loader: false, success: { (json) in
//            let model = ManageNotificationModel(json)
//            success(model)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    //MARK:- GET NOTIFICATIONWORLDLIST
//    //================================
//    static func getNotificationWorldList(accessToken: String, params: JSONDictionary,
//                                         succes: @escaping NotificationWorldDataSuccess,
//                                         failure: @escaping FailureResponse){
//        let header = [ApiKey.Authorization:"Bearer \(accessToken)"]
//        commonGetAPI(parameters: params, headers: header, endPoint: EndPoint.createNotification.path, loader: true, success: { (json) in
//            let model = json[ApiKey.smallResult][ApiKey.data].arrayValue.map({NotificationEventModel($0)})
//            let currentPage = json[ApiKey.smallResult][ApiKey.currentPage].intValue
//            let lastPage = json[ApiKey.smallResult][ApiKey.lastPage].intValue
//            succes(model, currentPage, lastPage)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    //MARK:- GET NOTIFICATION DISCOUNT
//    //================================
//    static func getNotificationDiscountData(accessToken: String, params:JSONDictionary,
//                                            success: @escaping NotificationDiscountDataSuccessWithStatus,
//                                            failure: @escaping FailureResponse){
//        let header = [ApiKey.Authorization:"Bearer \(accessToken)"]
//        commonGetAPI(parameters: params, headers: header, endPoint: EndPoint.heartNotification.path, loader: true, success: { (json) in
//            let model = json[ApiKey.smallResult].arrayValue.map({NotificationDiscountModel($0)})
//            let status = json[ApiKey.notificationStatus].intValue == 2 ? true : false
//            success(model,status)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    //MARK:- TOGGLE WORLD NOTIFICATION
//    //================================
//    static func toggleWorldNotification(accessToken: String, params: JSONDictionary,
//                                        success: @escaping SuccessResponse,
//                                        failure: @escaping FailureResponse){
//        let header = [ApiKey.Authorization:"Bearer \(accessToken)"]
//        commonPutAPI(parameters: params, endPoint: EndPoint.toggleWorldNotification.path, headers: header, loader: true, success: { (json) in
//            success(json)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    //MARK:- TOGGLE MANAGER NOTIFICATION
//    static func toggleManagerNotification(accessToken: String, params: JSONDictionary,
//                                          success: @escaping SuccessResponse,
//                                          failure: @escaping FailureResponse){
//        let header = [ApiKey.Authorization:"Bearer \(accessToken)"]
//        commonPutAPI(parameters: params, endPoint: EndPoint.toggleManageNotification.path, headers: header, loader: true, success: { (json) in
//            success(json)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    //MARK:- TOGGLE MANAGER NOTIFICATION
//    static func toggleSingleManagerNotification(accessToken: String, params: JSONDictionary,
//                                                success: @escaping SuccessResponse,
//                                                failure: @escaping FailureResponse){
//        let header = [ApiKey.Authorization:"Bearer \(accessToken)"]
//        commonPutAPI(parameters: params, endPoint: EndPoint.favouriteAirportToggle.path, headers: header, loader: true, success: { (json) in
//            success(json)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//
//    //MARK:- SAVE NOTIFICATIONS FAVOURITE AIRPORT
//    //===========================================
//    static func savefavouriteAirport(accessToken: String,
//                                     params: JSONDictionary,
//                                     success: @escaping SuccessResponse,
//                                     failure: @escaping FailureResponse,
//                                     sessionExpire: @escaping FailureResponse){
//        let header = [ApiKey.Authorization:"Bearer \(accessToken)"]
//        commonPostAPI(parameters: params, endPoint: EndPoint.favouriteAirportSave.path, headers: header, loader: true, success: { (json) in
//            success(json)
//        }, failure: { (error) -> (Void) in
//            failure(error)
//        }) { (error) -> (Void) in
//            sessionExpire(error)
//        }
//
//    }
//
//    //MARK:- UPDATE THE NOTIFICATIONS FAVOURITE AIRPORT
//    //=================================================
//    static func updateFavouriteAirport(accessToken: String,
//                                       params: JSONDictionary,
//                                       success: @escaping SuccessResponse,
//                                       failure: @escaping FailureResponse){
//        let header = [ApiKey.Authorization:"Bearer \(accessToken)"]
//        commonPutAPI(parameters: params, endPoint: EndPoint.favouriteAirportChange.path, headers: header, loader: true, success: { (json) in
//            success(json)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//
//    }
//
//
//
//    //MARK:- TO DELETE THE NOTIFICATION
//    //=================================
//    static func deleteNotification(accessToken: String, params: JSONDictionary,
//                                   success: @escaping SuccessResponse,
//                                   failure: @escaping FailureResponse){
//        let header = [ApiKey.Authorization:"Bearer \(accessToken)"]
//        AppNetworking.DELETE(endPoint: EndPoint.customNotificationDelete.path, parameters: params, headers: header, loader: true, success: { (json, code) in
//            success(json)
//        }) { (error) in
//            failure(error)
//        }
//    }
//
//    //MARK:- GET COUNTRY FLAG FOR FAVOURITE AIRPORT
//    //=============================================
//    static func getcountryFlag(params: JSONDictionary,
//                               success: @escaping SuccessResponse,
//                               failure: @escaping FailureResponse){
//        commonGetAPI(parameters: params, headers: authHeader, endPoint: EndPoint.getCountryFlag.path, loader: true, success: { (json) in
//            success(json)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    // MARK:- GET NOTIFICATION HEART DATA
//    //===================================
//    static func getNotificationHeartData(params:JSONDictionary, success: @escaping NotificationWordDataSuccess, failure: @escaping FailureResponse){
//        commonGetAPI(parameters: params, headers: authHeader, endPoint: EndPoint.airportDetailsFilter.path, loader: true, success: { (json) in
//            //            success(model)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    // MARK:- GET AIRPORT IMAGES
//    // =========================
//    static func getAirportImgData(params: JSONDictionary,
//                                  success: @escaping AirportResourceSuccess,
//                                  failure: @escaping FailureResponse) {
//        commonGetAPI(parameters: params, headers: authHeader, endPoint: EndPoint.airportsResource.path, loader: false, success: { (json) in
//            let model = AirportResourceModel(json[ApiKey.data])
//            success(model)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    //MARK:- GET OFFER IN AIRCARD
//    //===========================
//    static func getOfferData(params: JSONDictionary,
//                                  success: @escaping offerSuccess,
//                                  failure: @escaping FailureResponse) {
//        commonGetAPI(parameters: params, headers: authHeader, endPoint: EndPoint.flightOffer.path, loader: false, success: { (json) in
//            let offerArray = json[ApiKey.data][ApiKey.dates].arrayValue.map({FlightOffer($0)})
//            let minPrice = json[ApiKey.data][ApiKey.price][ApiKey.min].intValue
//            let maxPrice = json[ApiKey.data][ApiKey.price][ApiKey.max].intValue
//            success(offerArray, minPrice, maxPrice)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//
//    // MARK:- GET FLAG IMAGES
//    // ======================
//    static func getImagesForRegions(success: @escaping SuccessResponse,
//                                    failure: @escaping FailureResponse) {
//        commonGetAPI(parameters: [:], headers: authHeader, endPoint: EndPoint.flags.path, loader: false, success: { (json) in
//            success(json[ApiKey.data])
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    // MARK:- GET Booking Sequence API
//    // ==================================
//    static func getBookingSquence(params: JSONDictionary,
//                                  loader: Bool = false,
//                                  success: @escaping BookingSequenceSuccess,
//                                  failure: @escaping FailureResponse) {
//        commonGetAPI(parameters: params, headers: authHeader, endPoint: EndPoint.bookingSequence.path, loader: true, success: { (json) in
//            let model = json[ApiKey.data].arrayValue.map({BookingSequenceModel($0)})
//            success(model)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    //MARK:-  GET BUFFERING DATA
//    //==========================
//    static func getBufferingData(params: JSONDictionary,
//                                 success: @escaping BufferingModelSuccess,
//                                 failure: @escaping FailureResponse) {
//        commonGetAPI(parameters: params, headers: authHeader, endPoint: EndPoint.bookingBuffering.path, loader: true, success: { (json) in
//            let model = json[ApiKey.data].arrayValue.map({BufferingModel($0)})
//            success(model)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    // MARK:- GET AIRPORT PRICES
//    // =========================
//    static func getAirportPricing(params: JSONDictionary,
//                                  loader: Bool = false,
//                                  success: @escaping AirportPricingSuccess,
//                                  failure: @escaping FailureResponse) {
//        commonGetAPI(parameters: params, headers: authHeader, endPoint: EndPoint.airportsPricing.path, loader: loader, success: { (json) in
//            let model = json[ApiKey.data][ApiKey.airport].arrayValue.map { AirportPricingModel($0) }
//            success(model)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    // MARK:- GET NEAREST AIRPORT
//    // ==========================
//    static func getNearestAirports(params: JSONDictionary,
//                                   loader: Bool = false,isSearchType:Bool = false,
//                                   success: @escaping NearestAirportSuccess,
//                                   failure: @escaping FailureResponse) {
//        commonGetAPI(parameters: params, headers: authHeader, endPoint: EndPoint.nearestAirports.path, loader: loader, success: { (json) in
//            let model = json[ApiKey.data].arrayValue.map { AirportModel($0) }
//            if(!isSearchType){
//                DensityModel.selectedLayerArray = json[ApiKey.layers].arrayValue.map{$0.intValue}
//                if DensityModel.selectedLayerArray.isEmpty{
//                    DensityModel.selectedLayerArray = [1]
//                }
//            }
//            success(model)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    //MARK:- GET COUNTRY DATA
//    //=======================
//    static func getCountryData(params: JSONDictionary,
//                               success: @escaping CountryCoordinateSuccess,
//                               failure: @escaping FailureResponse){
//        commonGetAPI(parameters: params, headers: authHeader, endPoint: EndPoint.countryCoordinates.path, loader: false) { (json) in
//            let countryArray = json[ApiKey.smallResult].arrayValue.map({CountryCoordinate($0)})
//            success(countryArray)
//        } failure: { (error) -> (Void) in
//            failure(error)
//        }
//
//
//    }
//
//    //MARK:- GET DEFAULT AIRPORT DATA
//    //===============================
//    static func getDefaultAirports(params: JSONDictionary,
//                                   loader: Bool = false,isSearchType:Bool = false,
//                                   success: @escaping NearestAirportSuccess,
//                                   failure: @escaping FailureResponse) {
//        commonGetAPI(parameters: params, headers: authHeader, endPoint: EndPoint.defaultAirportData.path, loader: loader, success: { (json) in
//            let model = json[ApiKey.smallResult].arrayValue.map { AirportModel($0) }
//            success(model)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    //MARK:- GET AIRPORT LIST
//    //=======================
//    static func getAirportLIist(params: JSONDictionary,
//                                success: @escaping AirportLIstSuccess,
//                                failure: @escaping FailureResponse){
//        commonGetAPI(parameters: params, headers: authHeader, endPoint: EndPoint.notificationAirPort.path, loader: true, success: { (json) in
//            let list = json[ApiKey.smallResult].arrayValue.map{SearchAirportModel($0)}
//            success(list)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    //MARK:- GET AIRPORT LIST IN RED/GREEN MODE
//    //=========================================
//    static func getModeAirportList(params: JSONDictionary,
//                                   success: @escaping NotificationDiscountDataSuccessWithMinMaxValue,
//                                   failure: @escaping FailureResponse){
//        commonGetAPI(parameters: params, headers: authHeader, endPoint: EndPoint.getAirportForMode.path, loader: true, success: { (json) in
//            let model = json[ApiKey.smallResult].arrayValue.map{NotificationDiscountModel($0)}
//            let minDiscount  = json[ApiKey.scaleValues][ApiKey.minDiscount].doubleValue
//            let maxDiscount  = json[ApiKey.scaleValues][ApiKey.maxDiscount].doubleValue
//            let minPrice     = json[ApiKey.scaleValues][ApiKey.minPriceKey].doubleValue
//            let maxPrice     = json[ApiKey.scaleValues][ApiKey.maxPriceKey].doubleValue
//            success(model,minDiscount,maxDiscount,minPrice,maxPrice)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    //MARK:- GET LIKE BUTTON BADGE VALUE COUNT
//    //========================================
//    static func getOfferCount(params: JSONDictionary,
//                              accessToken: String,
//                              success: @escaping SuccessResponse,
//                              failure: @escaping FailureResponse){
//        let header = [ApiKey.Authorization:"Bearer \(accessToken)"]
//        commonGetAPI(parameters: params, headers: header, endPoint: EndPoint.likeBadgevalue.path, loader: true) { (json) in
//            success(json)
//        } failure: { (error) -> (Void) in
//            failure(error)
//        }
//
//
//    }
//
//
//    //MARK:- GET AIRPORT LAYER
//    //========================
//    static func getAirPortLayer(success: @escaping AirportLayerSuccess,
//                                failure: @escaping FailureResponse ){
//        commonGetAPI(parameters: [:], headers: authHeader, endPoint: EndPoint.airportLayer.path, loader: true, success: { (json) in
//            let model = json[ApiKey.data].arrayValue.map {
//                DensityModel($0)
//            }
//            success(model)
//        }, failure: { (error) -> (Void) in
//            failure(error)
//        })
//    }
//
//    // MARK:- GET TOKEN
//    // ================
//    static func getToken(apiKey: String,
//                         success: @escaping SuccessResponse,
//                         failure: @escaping FailureResponse) {
//        let params : JSONDictionary  = [ApiKey.apiKey : apiKey]
//        commonGetAPI(parameters: params, headers: [:], endPoint: EndPoint.token.skyscannerPath, loader: true, success: { (json) in
//            success(json)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    // MARK:- GET CURRENCIES
//    // =====================
//    static func getCurrencies(apiKey: String,
//                              success: @escaping SuccessResponse,
//                              failure: @escaping FailureResponse) {
//        let params : JSONDictionary  = [ApiKey.apiKey : apiKey]
//        commonGetAPI(parameters: params, headers: [:], endPoint: EndPoint.currencies.skyscannerPath, loader: true, success: { (json) in
//            success(json[ApiKey.currencies])
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    // MARK:- GET AIRPORTS LISTING
//    // ===========================
//    static func getAirports(apiKey: String,
//                            success: @escaping SuccessResponse,
//                            failure: @escaping FailureResponse) {
//        let params : JSONDictionary  = [ApiKey.apiKey : apiKey]
//        commonGetAPI(parameters: params, headers: [:], endPoint: EndPoint.geo.skyscannerPath, loader: true, success: { (json) in
//            success(json)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    // MARK:- Logout User
//    //===================
//    static func logout(accessToken: String,
//                       success: @escaping LogoutSuccess,
//                       failure: @escaping FailureResponse) {
//        var param:JSONDictionary = [:]
//        if let id = UIDevice.current.identifierForVendor?.uuidString{
//            param =  [ApiKey.device_id: id]
//        }
//
//
//        AppNetworking.GET(endPoint: EndPoint.logout.path, parameters: param, headers: [ApiKey.Authorization:"Bearer \(accessToken)"], loader: true, success: { (json,code)  in
//
//            let code = json[ApiKey.codeKey].intValue
//            let msg = json[ApiKey.message].stringValue
//            switch code {
//            case ApiCode.success: success(msg)
//            default: failure(NSError(code: code, localizedDescription: msg))
//            }
//        }) { (error) in
//            failure(error)
//        }
//    }
//
//    // MARK:- Add notification data
//    //=============================
//    static func addNotificationData(accessToken: String,
//                                    parameters: JSONDictionary,
//                                    imageParameters: [String: UIImage],
//                                    success: @escaping ResponseMessage,
//                                    failure: @escaping FailureResponse){
//        let header = [ApiKey.passwordAccessToken: accessToken]
//        AppNetworking.POSTWithImage(endPoint: EndPoint.refresh.path, parameters: parameters, image: imageParameters, headers: header, loader: true, success: { (json,code)  in
//            let code = json[ApiKey.status].intValue
//            let msg = json[ApiKey.message].stringValue
//            switch code {
//            case ApiCode.success:
//                success(msg)
//            case ApiCode.tokenExpired :
//                showSystemAlert(title: LocalizedString.error.localized, msg: LocalizedString.userLoggedOut.localized, {
//                    AppRouter.goToHome()
//                })
//            default: failure(NSError(code: code, localizedDescription: msg))
//            }
//        }) { (error) in
//            failure(error)
//        }
//    }
//
//    // MARK:- Sign up
//    //=============================
//    static func signup(params: JSONDictionary,
//                       loader: Bool = false,
//                       success: @escaping SuccessResponse,
//                       failure: @escaping FailureResponse,
//                       sessionExpire: @escaping FailureResponse){
//        commonPostAPI(parameters: params, endPoint: EndPoint.signup.path,headers: authHeader, success: { json in
//            success(json)
//        }, failure: { error in
//            failure(error)
//        }, sessionExpire: { error in
//            sessionExpire(error)
//        })
//    }
//
//    // MARK:- Social Login
//    //=============================
//    static func socialLogin(parameters: JSONDictionary,
//                            success: @escaping SuccessResponse,
//                            failure: @escaping FailureResponse
//                            ,sessionExpire: @escaping FailureResponse) {
//
//        self.commonPostAPI(parameters: parameters, endPoint: EndPoint.socialRegister.path,headers: authHeader, success: { (json) in
//            let code = json[ApiKey.codeKey].intValue
//            let msg = json[ApiKey.message].stringValue
//            switch code{
//            case ApiCode.success:
//                success(json)
//            default:
//                let error = NSError(localizedDescription: msg)
//                failure(error)
//            }
//        }, failure: { (error) -> (Void) in
//            failure(error)
//        }, sessionExpire: { (error) -> (Void) in
//            sessionExpire(error)
//        })
//    }
//
//    //MARK:- GET DISCOUNT OFFER
//    //=========================
//    static func getDiscountedTripCount(success: @escaping SuccessResponse,
//                                       failure: @escaping FailureResponse) {
//        commonGetAPI(parameters: [:], headers:  authHeader, endPoint: EndPoint.offersCount.path, loader: true, success: { (json) in
//            success(json)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    // MARK:- Sign up
//    //===============
//    static func login(params: JSONDictionary,
//                      loader: Bool = false,
//                      success: @escaping SuccessResponse,
//                      failure: @escaping FailureResponse,
//                      sessionExpire: @escaping FailureResponse){
//        commonPostAPI(parameters: params, endPoint: EndPoint.login.path,headers: authHeader, success: { json in
//            let code = json[ApiKey.codeKey].intValue
//            let msg = json[ApiKey.message].stringValue
//            switch code{
//            case ApiCode.success:
//
//                success(json)
//            default:
//                let error = NSError(localizedDescription: msg)
//                failure(error)
//            }
//        }, failure: { error in
//            failure(error)
//        }, sessionExpire: { error in
//            sessionExpire(error)
//        })
//    }
//
//    // MARK:- Forgot Password
//    //===============
//    static func forgotPassword(params: JSONDictionary,
//                               loader: Bool = false,
//                               success: @escaping SuccessResponse,
//                               failure: @escaping FailureResponse,
//                               sessionExpire: @escaping FailureResponse){
//        commonPostAPI(parameters: params, endPoint: EndPoint.forgotPassword.path, headers: authHeader, success: { json in
//            let code = json[ApiKey.codeKey].intValue
//            let msg = json[ApiKey.message].stringValue
//            switch code{
//            case ApiCode.success:
//                success(json)
//            default:
//                let error = NSError(localizedDescription: msg)
//                failure(error)
//            }
//        }, failure: { error in
//            failure(error)
//        }, sessionExpire: { error in
//            sessionExpire(error)
//        })
//    }
//
//    // MARK:- Reset Password
//    //===============
//    static func resetPassword(params: JSONDictionary,
//                              loader: Bool = false,
//                              success: @escaping SuccessResponse,
//                              failure: @escaping FailureResponse,
//                              sessionExpire: @escaping FailureResponse){
//        commonPostAPI(parameters: params, endPoint: EndPoint.resetPassword.path, headers: authHeader, success: { json in
//            let code = json[ApiKey.codeKey].intValue
//            let msg = json[ApiKey.message].stringValue
//            switch code{
//            case ApiCode.success:
//                success(json)
//            default:
//                let error = NSError(localizedDescription: msg)
//                failure(error)
//            }
//        }, failure: { error in
//            failure(error)
//        }, sessionExpire: { error in
//            sessionExpire(error)
//        })
//    }
//
//    // MARK:- Social Sign up
//    //=======================
//    static func socialRegisterAPI(parameters: JSONDictionary,
//                                  success: @escaping SuccessResponse,
//                                  failure: @escaping FailureResponse,
//                                  sessionExpire: @escaping FailureResponse) {
//        commonPostAPI(parameters: parameters, endPoint: EndPoint.socialRegister.path,headers: authHeader, success: { json in
//            let code = json[ApiKey.codeKey].intValue
//            let msg = json[ApiKey.message].stringValue
//            switch code{
//            case ApiCode.success:
//                success(json)
//            default:
//                let error = NSError(localizedDescription: msg)
//                failure(error)
//            }
//        }, failure: { error in
//            failure(error)
//        }, sessionExpire: { error in
//            sessionExpire(error)
//        })
//    }
//
//    //MARK:- GET PROFILE URL
//    //======================
//    static func getProfileURl(parameters: JSONDictionary,
//                              profile: UIImage,
//                              success: @escaping ProfileURLSuccess,
//                              failure: @escaping FailureResponse){
//        let imageParameter = [ApiKey.image: profile]
//        AppNetworking.POSTWithImage(endPoint: EndPoint.getProfileUrl.path, parameters: [:], image: imageParameter, headers: authHeader, loader: true, success: { (json, code) in
//            let model = ProfileModel(json[ApiKey.smallResult])
//            success(model)
//        }) { (error) in
//            failure(error)
//        }
//    }
//
//    //MARK:- UPDATE THE PROFILE
//    //=========================
//    static func updateProfile(accessToken: String, parameters: JSONDictionary,
//                              success: @escaping SuccessResponse,
//                              failure: @escaping FailureResponse){
//        let header = [ApiKey.Authorization:"Bearer \(accessToken)"]
//        commonPostAPI(parameters: parameters, endPoint: EndPoint.updateProfile.path, headers: header, loader: true, success: { (json) in
//            success(json)
//        }, failure: { (error) -> (Void) in
//            failure(error)
//        }) { (error) -> (Void) in
//
//        }
//    }
//
//    //MARK:- REMOVE THE PROFILE PHOTO
//    //===============================
//    static func removeProfilePhoto(accessToken:String,
//                                   success: @escaping SuccessResponse,
//                                   failure: @escaping FailureResponse){
//        let header = [ApiKey.Authorization:"Bearer \(accessToken)"]
//        AppNetworking.DELETE(endPoint: EndPoint.deleteProfilePhoto.path, parameters: [:], headers: header, loader: true, success: { (json, code) in
//            success(json)
//        }) { (error) in
//            failure(error)
//        }
//
//    }
//
//    //MARK:- GET PROFILE DETAIL
//    //=========================
//    static func getProfileDetail(accessToken: String,
//                                 success: @escaping ProfileDetailSuccess,
//                                 failure: @escaping FailureResponse){
//        let header = [ApiKey.Authorization:"Bearer \(accessToken)"]
//        commonGetAPI(parameters: [:], headers: header, endPoint: EndPoint.getProfileDetail.path, loader: true, success: { (json) in
//            let model = ProfileDetailModel(json[ApiKey.smallResult])
//            success(model)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
//
//    //MARK:- REMOVE SOCIALID
//    //======================
//    static func removeSocialId(accessToken:String,
//                               params: JSONDictionary,
//                               success: @escaping SuccessResponse,
//                               failure: @escaping FailureResponse){
//        let header = [ApiKey.Authorization:"Bearer \(accessToken)"]
//        AppNetworking.DELETE(endPoint: EndPoint.removeSocialId.path, parameters: params, headers: header, loader: true, success: { (json, code) in
//            success(json)
//        }) { (error) in
//            failure(error)
//        }
//
//    }
//
//    // MARK:- GET CURRENCIES
//    // =====================
//    static func gerCountryWithFlag(parameters: JSONDictionary,
//                                   success: @escaping SuccessResponse,
//                                   failure: @escaping FailureResponse) {
//        commonGetAPI(parameters: parameters, headers: authHeader, endPoint: EndPoint.countries.path, loader: true, success: { (json) in
//            success(json)
//        }) { (error) -> (Void) in
//            failure(error)
//        }
//    }
}

//MARK: COMMON ALERT FUNCTION
//===========================
extension WebServices {
    
    private static func showSystemAlert( title : String = "", msg : String,_ completion : (()->())? = nil) {
//        let titleFont = [NSAttributedString.Key.font: AppFonts.AvenirMedium.withSize(16)]
//        let messageFont = [NSAttributedString.Key.font: AppFonts.AvenirMedium.withSize(14)]
//
//        let titleAttrString = NSMutableAttributedString(string: title, attributes: titleFont)
//        let messageAttrString = NSMutableAttributedString(string: msg, attributes: messageFont)
//
//        let alertViewController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
//        alertViewController.setValue(titleAttrString, forKey: LocalizedString.attributeTitle.localized)
//        alertViewController.setValue(messageAttrString, forKey: LocalizedString.attributedMessage.localized)
//        let okAction = UIAlertAction(title: LocalizedString.ok.localized, style: UIAlertAction.Style.default) { (action : UIAlertAction) -> Void in
//            alertViewController.dismiss(animated: true, completion: nil)
//            completion?()
//        }
//        okAction.setValue(UIColor.black, forKey: LocalizedString.titleTextColor.localized)
//        alertViewController.addAction(okAction)
//        AppDelegate.shared.window?.rootViewController?.present(alertViewController, animated: true, completion: nil)
    }
}

