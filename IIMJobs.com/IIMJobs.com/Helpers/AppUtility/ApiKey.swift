//
//  ApiKey.swift
//  IIMJobs.com
//
//  Created by mradulatray on 24/02/23.
//

import Foundation

//MARK:- Api Keys
//=======================
enum ApiKey {
    
    static var status: String { return "status" }
    static var code: String { return "CODE" }
    static var codeKey: String { return "code" }
    static var result: String { return "RESULT" }
    static var message: String { return "message" }
    static var Authorization: String { return "Authorization" }
    static var contentType: String { return "Content-Type" }
    static var data: String { return "data" }
    static var query: String { return "query" }
    static var accessToken: String { return "accessToken"}
    static var user_id: String { return "user_id" }
    static var name: String { return "name" }
    static var username: String { return "username" }
    static var firstName: String { return "fname" }
    static var firstname: String { return "first_name" }
    static var lastname: String { return "last_name" }
    static var picture: String { return "picture" }
    static var cover: String { return "cover"}
    static var source: String { return "source"}
    static var fields: String { return "fields"}
    static var lastName: String { return "lname" }
    static var email: String { return "email" }
    static var emailPhone: String { return "email_phone" }
    static var password: String { return "password" }
    static var confirmPassword: String { return "confirmPassword" }
    static var gender: String { return "gender" }
    static var phone: String { return "phone" }
    static var dob: String { return "dob" }
    static var address: String { return "address" }
    static var default_layer_order: String { return "default_layer_order" }
    static var user_lat: String { return "user_lat" }
    static var user_long: String { return "user_long" }
    static var countryCode: String { return "country_code" }
    static var country_id: String { return "country_id" }
    static var state_id: String { return "state_id" }
    static var city_id: String { return "city_id" }
    static var device_id: String { return "device_id" }
    static var device_token: String { return "device_token" }
    static var deviceDetails: String { return "device_details" }
    static var platform: String { return "platform" }
    static var type: String { return "type" }
    static var otp: String { return "otp" }
    static var smallResult: String { return "result" }
    static var offerCount: String { return "offer_count" }
    static var scaleValues: String { return "scale_values" }
    static var maxDiscount: String { return "max_discount" }
    static var maxPriceKey: String { return "max_price" }
    static var minDiscount: String { return "min_discount" }
    static var minPriceKey: String { return "min_price" }

    static var token: String { return "token" }
    static var fbtoken: String { return "fb_token" }
    static var passwordAccessToken: String { return "accesstoken" }
    static var refreshToken: String { return "refresh_token" }
    static var resetSuccess: String { return "resetSuccess" }
    static var oldpassword: String { return "old_password" }
    static var newPassword: String { return "new_password" }
    static var note: String { return "note" }
    static var loginStatus: String {return "login_status"}
    static var index: String {return "index"}
    static var isGreen: String {return "isGreen"}
    static var isSeletedColor: String {return "isSeletedColor"}
    
    //    MARK: Main User model
    //    =====================
    static var shift: String { return "shift" }
    static var devices: String { return "devices" }
    static var locations: String { return "locations" }
    static var onSiteLocations: String { return "onsite_locations" }
    static var offSiteLocations: String { return "offsite_locations" }
    static var user: String { return "user" }
    static var userData: String{ return "userData"}
    static var url: String{ return "url"}
    
    //    MARK: User model
    //    =================
    static var empId: String { return "emp_id" }
    static var userId : String { return "userId" }
    static var userSpaceId : String { return "user_id" }
    static var phoneCode: String { return "phone_code" }
    static var mobile: String { return "mobile" }
    static var roleId: String { return "roleId" }
    static var isHr: String { return "is_hr" }
    static var emailVerified: String { return "email_verified" }
    static var mobileVerified: String { return "mobile_verified" }
    static var role: String { return "role" }
    static var companyName: String { return "company_name" }
    static var companyId : String { return "company_id" }
    
    //    MARK: Device model
    //    =================
    static var isOnSite: String { return "is_onsite" }
    static var deviceType: String { return "device_type" }
    static var deviceId: String { return "device_id" }
    static var lat: String { return "lat" }
    static var long: String { return "long" }
    static var lng: String { return "lng" }
    static var locationId: String { return "location_id" }
    static var description: String { return "description" }
    
    //    MARK: Location model
    //    ====================
    static var minRadius: String { return "min_radius" }
    
    //    MARK: Filter model
    //    =====================
    static var price: String { return "price" }
    static var offerPrice: String { return "Price" }
    static var duration: String { return "duration" }
    static var stops: String { return "stops" }
    static var stopage: String { return "stopage" }
    static var sortType: String { return "sortType" }
    static var sortOrder: String { return "sortOrder" }
    static var includeCarriers: String { return "includeCarriers" }
    static var excludeCarriers: String { return "excludeCarriers" }
    static var includeLayoverCities: String { return "includeLayoverCities" }
    static var excludeLayoverCities: String { return "excludeLayoverCities" }
    static var citiesNotAllowed: String { return "citiesNotAllowed" }
    static var takeOffTime: String { return "takeOffTime" }
    static var airlineList: String { return "airlineList" }
    static var numberOfFlights: String { return "numberOfFlights" }
    static var layoverCityList: String { return "layoverCityList" }
    
    //MARK:- BUFFERING MODEL
    //======================
    static var countryFlag: String { return "country_flag" }
    static var image: String { return "image" }
    static var countryname: String { return "country_name" }
    static var instagramName: String { return "insta_name" }

    //    MARK: Skyscanner model
    //    ======================
    static var apiKey: String { return "apiKey" }
    
    //    MARK: Currencies model
    //    ======================
    static var smallCode: String { return "code" }
    static var currencyCode: String { return "Code" }
    static var currencyCodeKey: String { return "currency_code" }
    static var spaceBetweenAmtAndSymbol: String { return "SpaceBetweenAmountAndSymbol" }
    static var symbol: String { return "Symbol" }
    static var symbolNative: String { return "symbol_native" }
    static var symbolOnLeft: String { return "SymbolOnLeft" }
    static var currencies: String { return "Currencies" }
    static var namePlural: String { return "name_plural" }
    
    //    MARK: Airport resource model
    //    ============================
    static var instaName: String { return "instaName" }
    static var instaId: String { return "instaId" }
    static var flagImage: String { return "flagImage" }
    static var airportCode: String { return "airportCode" }
    
    //    MARK: Nearest Airport model
    //    ===========================
    static var numberOfAirport: String { return "numberOfAirport" }
    static var location: String { return "location" }
    static var nearestLat: String { return "0" }
    static var nearestLng: String { return "1" }
    
    //    MARK: Airport details model
    //    ===========================
    static var sessionKey: String { return "sessionKey" }
    static var airport: String { return "airport" }
    static var destinationId: String { return "destinationId" }
    static var cityName: String { return "cityName" }
    static var countryName: String { return "countryName" }
    static var regionName: String { return "regionName" }
    static var cityId: String { return "cityId" }
    static var countryId: String { return "countryId" }
    static var latitude: String { return "latitude" }
    static var longitude: String { return "longitude" }
    static var layers:String {return "layers"}
    static var search: String { return "search" }
    static var searchType : String { return "search_type"}
    static var minPrice: String { return "minPrice" }
    static var maxPrice: String { return "maxPrice" }
    static var min: String { return "min" }
    static var max: String { return "max" }
    static var maxDuration: String { return "maxDuration" }
    static var minDuration: String { return "minDuration" }
    static var airportDetail: String { return "airportDetail" }
    static var country: String { return "country" }
    static var currency: String { return "currency" }
    static var locale: String { return "locale" }
    static var originPlace: String { return "originPlace" }
    static var destinationPlace: String { return "destinationPlace" }
    static var outboundPartialDate: String { return "outboundPartialDate" }
    static var inboundPartialDate: String { return "inboundPartialDate" }
    static var partialDate: String { return "PartialDate" }
    static var regionData: String { return "regionData" }
    
    //MARK:- Airport Density model
    //============================
    //    static var status: String { return "inboundPartialDate" }
    static var layer_name: String { return "layer_name" }
    static var created_at: String { return "created_at" }
    static var order_sequence: String { return "order_sequence" }
    static var orderSequence: String { return "order_sequence" }
    static var updated_at: String { return "updated_at" }
    static var id: String { return "id" }
    static var distance: String { return "distance"}
    
    //    MARK: Flight Card model
    //    =======================
    static var outbound: String { return "outbound" }
    static var inbound: String { return "inbound" }
    static var originStation: String { return "originStation" }
    static var originCity: String { return "origin_city" }
    static var destinationStation: String { return "destinationStation" }
    static var departure: String { return "departure" }
    static var arrival: String { return "arrival" }
    static var carriers: String { return "carriers" }
    static var flightCities: String { return "flightCities" }
    static var itinerariesData: String { return "itinerariesData" }
    static var skyscannerStatus: String { return "skyscannerStatus" }
    static var priceHistory: String { return "priceHistory" }
    static var outboundData: String { return "outboundData" }
    static var outDate : String { return "outDate"}
    static var returnDate : String { return "returnDate"}
    static var inboundData: String { return "inboundData" }
    static var deeplinkUrl: String { return "deeplinkUrl" }
    static var outboundLegId: String { return "outboundLegId" }
    static var inboundLegId: String { return "inboundLegId" }
    static var destinationStationName: String { return "destinationStationName" }
    static var originStationName: String { return "originStationName" }
    
    //    MARK: Carrier model
    //    ===================
    static var imageURL: String { return "imageUrl" }
    static var carrierId: String { return "Id" }
    
    //    MARK: Flight Card query keys
    //    ============================
    static var cabinClass: String { return "cabinClass" }
    static var locationSchema: String { return "locationSchema" }
    static var outboundDate: String { return "outboundDate" }
    static var outboundDateValue: String { return "OutboundDate" }
    static var inboundDate: String { return "inboundDate" }
    static var inboundDateValue: String { return "InboundDate" }
    static var adults: String { return "adults" }
    static var children: String { return "children" }
    static var infants: String { return "infants" }
    static var outboundDepartStartTime: String { return "outboundDepartStartTime" }
    static var outboundDepartEndTime: String { return "outboundDepartEndTime" }
    static var inboundDepartStartTime: String { return "inboundDepartStartTime" }
    static var inboundDepartEndTime: String { return "inboundDepartEndTime" }
    static var isToday: String { return "is_today"}
    
    //    MARK: BookingSequence query keys
    //    ============================
    static var flightPrice: String { return "flightPrice" }
    static var flightImageUrl: String { return "flightImageUrl" }
    static var flighName: String { return "flighName" }
    
    //    MARK: Booking Model Keys
    //    ============================
    static var originStationDetails: String { return "originStationDetails" }
    static var destinationStationDetails: String { return "destinationStationDetails" }
    static var flightNumber: String { return "flightNumber" }
    static var originCountryName:String {return "originCountryName"}
    static var destinationCountryName:String {return "destinationCountryName"}
    static var flightCode:String {return "flightCode"}
    static var departureDaysDiff: String { return "departureDaysDiff" }
    static var arrivalDaysDiff: String { return "arrivalDaysDiff" }
    static var arrivalDateTime: String { return "arrivalDateTime" }
    static var departureDateTime: String { return "departureDateTime" }
    static var carrier: String { return "carrier" }
    static var totalDuration: String { return "totalDuration" }
    static var stopCount: String { return "stopCount" }
    static var segments: String { return "segments" }
    static var bookingDetails: String { return "bookingDetails" }
    static var deeplink: String { return "deeplink" }
    static var agent_image: String {return "agent_image"}
    static var agentId: String { return "agentId" }
    
    //MARK:- LAYER INDEX
    //==================
    static var layerIndex: String {return "layerIndex"}
    
    //MARK:- CUSTOM NOTIFICATION
    //==========================
    static var fromDetail: String {return "fromDetail"}
    static var toDetail: String {return "toDetail"}
    static var budget: String { return "budget"}
    static var dateSelectedType: String { return "date_selected_type"}
    static var count: String {return "count"}
    
    //MARK:- UserModel
    //==================
    static var appleId: String {return "apple_id"}
    static var createdAt: String {return "created_at"}
    static var emailVerifiedAt: String { return "email_verified_at"}
    static var facebookId: String {return "facebook_id"}
    static var googleId: String {return "google_id"}
    static var profileImage: String { return "profile_image"}
    static var imageFullUrl : String { return "image_full_url"}
    static var signupType: String {return "signupType"}
    static var updatedAt: String { return "updatedAt"}
    static var countryFlagImage: String { return "flag_image_full_path"}
    
    //MARK:- SOCIAL LOGIN
    //===================
    static var socialType: String { return "social_type"}
    static var socialId: String { return "social_id"}
    static var deviceToken: String { return "device_token"}
    static var socialID: String { return "socialId"}
    static var uId: String { return "_id"}
    static var socialTYpe: String { return "socialType"}
    static var device: String { return "device" }
    
    //MARK:- CREATE CUSTOM NOTIFICATION
    //==============================
    static var sourceAirport       : String { "source_airport" }
    static var sourceAptDetails    : String { "source_airport_details"}
    static var destinationType     : String { "destination_type" }
    static var destinationAirport  : String { "destination_airport" }
    static var destinationCountry  : String { "destination_country" }
    static var desCounDetails      : String { "destination_country_details"}
    static var destiAirportDetail  : String { "destination_airport_details" }
    static var dateType            : String { "date_type" }
    static var dates               : String { "dates" }
    static var startDate           : String { "start_date" }
    static var endDate             : String { "end_date" }
    static var discountPercentage  : String { "discount_percentage" }
    static var notificationType    : String { "notification_type" }
    static var notificationStatus  : String { "notification_status" }
    static var page                : String { "page" }
    static var currentPage         : String { "current_page" }
    static var lastPage            : String { "last_page" }
    static var total               : String { "total" }
    static var useStatus           : String { "use_status" }
    static var cityCode            : String { "city_code" }
    static var getCountries        : String { "get_countries"}
    static var listType            : String { "list_type"}
    static var notificationId      : String { "notification_id" }
    static var fromLocation        : String { "from_location" }
    static var toLocation          : String { "to_location" }
    static var localPrice          : String { "local_price" }
    static var outboundDepartureDt : String { "outbound_departure_dt" }
    static var inboundDepartureDt  : String { "inbound_departure_dt" }
    static var localCcy            : String { "local_ccy" }
    static var userCcy             : String { "user_ccy" }
    static var localMedian         : String { "local_median" }
    static var differenceFromMedian: String { "difference_from_median" }
    static var priceTrackedUrl     : String { "price_tracked_url" }
    static var oriCountryDetails   : String { "origin_country_details" }
    static var countryDetails      : String { "countryDetails" }
    static var oriAirportDetails   : String { "origin_airport_details" }
    static var destiAirportDetails : String { "destination_airport_details" }
    static var destiCountryDetails : String { "destination_country_details" }
    static var airportCodeKey      : String { "airport_code" }
    static var discount            : String { "discount" }
    static var mode                : String { "mode" }
    static var confirmationPassword: String { "password_confirmation" }

    //MARK:- HD/LM MODE
    //=================
    static var legsOutBound        : String { "legs_outbound" }
    static var legsInBound         : String { "legs_inbound" }
    static var greenModeFilter     : String { "green_mode_filter" }
    
    //MARK:- NOTIFICATION MANAGER
    //============================
    static var dailyRemainder        : String { "daily_remainder" }
    static var lastMinute            : String { "last_minute" }
    static var hotDeal               : String { "hot_deal" }
    static var favouriteAirports     : String { "favourite_airports" }
    static var airportsCode          : String { "airport_code" }
    static var airportsDetails       : String { "airport_details" }
    
    //MARK:- PUSH NOTIFICATION
    //========================
    static var aps            : String { "aps" }
}

//MARK:- Api Code
//=======================
enum ApiCode {
    static var success: Int { return 200 } // Success
    static var tokenExpired: Int { return 401 } // Token expired refresh token needed to be generated
    static var internalError: Int { return 700 } // Internal error
    
    
//    static var unauthorizedRequest: Int { return 206 } // Unauthorized request
//    static var headerMissing: Int { return 207 } // Header is missing
//    static var phoneNumberAlreadyExist: Int { return 208 } // Phone number alredy exists
//    static var requiredParametersMissing: Int { return 418 } // Required Parameter Missing or Invalid
//    static var duplicateData: Int { return 400 } // Duplicacy in parameters
//    static var fileUploadFailed: Int { return 421 } // File Upload Failed
//    static var pleaseTryAgain: Int { return 500 } // Please try again
//    static var skyscannerSessionExpire: Int { return 410 } // Token expired refresh token needed to be generated
//    static var logoutSuccess: Int { return 403 }
}
