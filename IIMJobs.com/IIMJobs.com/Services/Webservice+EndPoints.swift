//
//  Webservice+EndPoints.swift
//  MyDemoFree
//
//  Created by mradulatray on 21/02/23.
//

import Foundation


enum AppUrls: String {
    
    case hiristBaseUrlWithoutV11 = "https://jobseeker-api.iimjobs.com/"
    case hiristBaseUrl = "https://jobseeker-api.iimjobs.com/v2/v11/"
    case oldGetBaseUrl = "https://angel.iimjobs.com/api10/"
    case oldPostBaseUrl = "https://bidder.iimjobs.com/api10/"
    case hiristCompaniesBaseUrl = "https://company-api.iimjobs.com/v2/"
    case hiristCoursesBaseUrl = "https://learnngrow-api.iimjobs.com/v2/"
    case hiristAdsUrl = "https://billboard.iimjobs.com/api/v1/bills/slot/"
    case hiristJobUserBaseUrl = "https://user-api.iimjobs.com/v2/user/"
    case assessmentBaseUrl = "https://assessmentapi.iimjobs.com/v1/"
    case hiristInterviewBaseUrl = "https://angel.iimjobs.com/calendar/v1/interviews/"
    case hiristCalendarPostUrl = "https://bidder.iimjobs.com/calendar/v1/"
    case hiristCalendarGetUrl = "https://angel.iimjobs.com/calendar/v1/"
    case hiristInterviewWrapperUrl = "https://angel.iimjobs.com/calendar/v1/wrapper/calid-"
    case serviceBaseUrl = "https://service.iimjobs.com/jobseeker/v2/"
    case fetchShowcaseDetailsBaseUrl = "https://learngrowapi.iimjobs.com/showCase/v10/companyPage/"
    case fetchCourseDetailUrl = "https://learngrowapi.iimjobs.com/learnGrow/v10/course/"
    case charlesUrl = "https://charles.iimjobs.com/video/"
    case faqBlogUrl = "https://blog.iimjobs.com/site-features/the-iimjobs-com-pro-membership-plan-detailed-faqs"
    case breakingMythsBlogUrl = "https://blog.iimjobs.com/site-features/breaking-a-few-myths-about-the-pro-membership-plan/"
        case appStoreUrl = "https://itunes.apple.com/in/app/iimjobs/id538258273"
    case jobfeed = "jobfeed/"
    case verifyEmailChange = "verifyemailchange/"
    case stories = "stories"
    case employersList = "employers/"
    case search = "search"
    case coursesList = "course/"
    case jobs = "/jobs?"
    case similarJobs = "/similarjobs?"
    case saveJobs = "savejob/"
    case unsaveJobs = "unsavejob/"
    case recruiter = "/recruiter/"
    case updateInvidualSettings = "updateindividualsetting/"
    case fetchCoverLetter = "coverletter/"
    case withDrawCoverLetter = "withdrawcoverletter/"
    case updateCoverLetter = "updatecoverletter/"
    case fetchQuestionnaire = "questionnaire?invocation=1&associationPublished="
    case v6ApplyJob = "v6applyjob/"
    case login = "login/"
    case apn = "apn/"
    case forgotPassword = "forgot/"
    case personalize = "v9/personalize/"
    case notifications = "notifilist/app"
    case notificationRead = "notifiread/app/"
    case sendOTP = "sendotp/"
    case sendVerificationLink = "sendverificationlink/"
    case job = "job/"
    case detail = "detail/"
    case unpublishdetail = "unpublishdetail/"
    case categoryJobs = "cat/"
    case subCategoryLogos = "https://staticlogo.iimjobs.com/"
    case savedJobs = "allsavedjobs"
    case appliedJobs = "appliedJobs"
    case followUpAction = "followupaction/"
    case interviewSlots = "/slots"
    case emailChange = "emailchangelink/en_cookie-"
    case deactivate = "deactivate"
    case insights = "insights/"
    case showcase = "/showcase/"
    case calendar = "calendar/"
    case slot = "/slot/"
    case seeker = "/seeker/"
    case seekercalendarinfo = "/seekercalendarinfo"
    case courseSimilarJobs = "/course/similarjobs"
    case magicrank = "/magicrank/"
    case user = "user/"
    case personalizedTags = "/personalizedTags"
    case userFollowedTags = "/userFollowedTags"
    case emailVerification = "emailverification/"
    case appRating = "apprating/"
    case updateApprating = "updateapprating"
    case deeplinkingauth = "deeplinkingauth"
    case roundZeroInfo = "roundzeroinfo/?en_cookie="
    case dynamicRoundZeroPopUp = "dynamicscreens"
    case otpAuth = "otpauth"
    case verifyOTPAuth = "verifyotpauth"
    case resetpasswordv2 = "resetpasswordv2/"
    case skipRoundZero = "skiproundzero"
    case rzrequests = "/rzrequests"
    case nonbooked = "nonbooked"
    case sendTwoFAOtp = "mfa"
    case verifyTwoFAOtp = "mfaverify"
    case mfaDetail = "mfadetail/"
    case mfaupdphone = "mfaupdphone"
    case mfaenableVerify = "mfaenable/verify"
    case mfaenableWithPhone = "mfaenable"
    case mfadisable = "mfadisable"
    case mfaskip = "mfaskip/"
    case mfaskipcnt = "mfaskipcnt"
    case updatejobcount = "/updatejobcount"
    case booked = "booked"
}

enum AppScheme {
    case development
    case staging
    case production
}

let buildType: AppScheme = .production

var baseUrl: String {
    switch buildType {
    case .development:
        return ""
    case .staging:
        return ""
    case .production:
        return "https://angel.iimjobs.com/api10/"
    }
}


////let baseUrl = "https://brdseyedevadmin.appskeeper.com/api/v1/"
//let baseUrl = "https://brdseyestgadmin.appskeeper.com/api/v1/"
////let baseUrl = "https://api.flybrdseye.com/api/v1/"

let skyscannerURL = "http://partners.api.skyscanner.net/apiservices/"

extension WebServices {
    
    enum EndPoint : String {
        // MARK: ONBOARDING
        // ================
        case signup = "register"
        case login = "login"
        case airportsResource = "airports/resource"
        case flightOffer = "browse-min-price-dates"
        case airportsPricing = "airports/price"
        case airportDetails = "airports/details"
        case countryCoordinates = "country-coordinates"
        case airportDetailsFilter = "airports/details/filter"
        case nearestAirports = "airports/nearest"
        case defaultAirportData = "default-airports"
        case flags = "flags/resource"
        case bookingSequence = "airports/details/flight"
        case bookingBuffering = "popular-airports"
        case notificationAirPort = "list-airports"
        case logout = "logout"
        case refresh
        case socialRegister = "social-register"
        case countries = "countries"
        case createNotification = "my-notifications"
        case updateNotification = "my-notifications/"
        case toggleWorldNotification = "custom-notification-toggle"
        case heartNotification = "heart-notifications"
        case getCountryFlag = "airport-country-flag"
        case getAirportForMode = "list-minute-hot-deal"
        case forgotPassword = "forgot-password"
        case resetPassword = "reset-password"
        case flightDetailForMode = "matching-flight-list"
        case removeSocialId = "remove-social-id"
        case offersCount = "offers-count"
        
        //MARK:- AIRPORT LAYER
        //====================
        case airportLayer = "airport-layers"
        
        //MARK:- NOTIFICATION URL
        //======================
        case getProfileUrl = "image-upload"
        case updateProfile = "update-profile"
        case getProfileDetail = "profile-details"
        case deleteProfilePhoto = "delete-profile-photo"
        case customNotificationDelete = "custom-notification-delete"
        case likeBadgevalue = "heart-notifications-count"
        
        // MARK: SKYSCANNER ENDPOINTS
        // ==========================
        case token = "token/v2/gettoken"
        case browseDates = "browsedates/v1.0/"
        case currencies = "reference/v1.0/currencies"
        case geo = "geo/v1.0"
        
        //MARK:- MANAGE NOTIFICATION
        //==========================
        case manageNotification = "notification-status"
        case toggleManageNotification = "manage-notification-toggle"
        case favouriteAirportToggle = "favourite-airport-toggle"
        case favouriteAirportSave = "favourite-airport-save"
        case favouriteAirportChange = "favourite-airport-change"
        
        var path : String {
            let url = baseUrl
            return url + self.rawValue
        }
        
        var skyscannerPath : String {
            let url = skyscannerURL
            return url + self.rawValue
        }
    }
}

