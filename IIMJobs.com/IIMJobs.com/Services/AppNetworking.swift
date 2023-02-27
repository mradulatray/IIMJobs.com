//
//  AppNetworking.swift
//  MyDemoFree
//
//  Created by mradulatray on 15/02/23.
//

import Foundation
import SwiftyJSON

// MARK: - Typealias
// =================
typealias HTTPHeaders = [String:String]
typealias JSONWithCode = (JSON,Int) -> Void
typealias JSONDictionary = [String : Any]
typealias SuccessResponse = (_ json : JSON) -> ()
typealias FailureResponse = (Error) -> (Void)

enum AppNetworking {
    
    // MARK: - PROPERTIES
    // ==================
    static var timeOutInterval = TimeInterval(120)
    static var timeOutIntervalForResource = TimeInterval(120)
    //    static var sessionDelegate : URLSessionDelegate = APIHandling()
    
    private static func executeRequest(_ request: NSMutableURLRequest, _ success: @escaping JSONWithCode, _ failure: @escaping (Error) -> Void) {
        let session = URLSession.shared
        session.configuration.timeoutIntervalForRequest = timeOutInterval
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            if (error == nil) {
                
                do {
                    if let jsonData = data {
                        
                        if let jsonDataDict  = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any] {
                            
                            print(jsonDataDict)
                            DispatchQueue.main.async(execute: { () -> Void in
                                if let code = response as? HTTPURLResponse {
                                    success(JSON(jsonDataDict), code.statusCode)
                                }
                            })
                        }
                        else {
                            if let data = data, let _ = String(data: data, encoding: .utf8) {
                                if let code = response as? HTTPURLResponse {
                                    success(JSON(), code.statusCode)
                                }
                            }
                        }
                    }else{
                        let error = NSError.init(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey:"No data found"])
                        failure(error)
                    }
                } catch let err as NSError {
                    let responseString = String(data: data!, encoding: .utf8)
                    print("responseString = \(responseString ?? "")")
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        failure(err)
                    })
                }
            } else {
                if let httpResponse = response as? HTTPURLResponse {
                    print(httpResponse)
                }
                if let err = error {
                    DispatchQueue.main.async(execute: { () -> Void in
                        failure(err)
                    })
                }else{
                    let error = NSError.init(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey:"Something went wrong"])
                    failure(error)
                }
            }
        })
        dataTask.resume()
    }
    
    private static func REQUEST(withUrl url : URL?,method : String,postData : Data?,header : [String:String],loader : Bool, success : @escaping JSONWithCode, failure : @escaping (Error) -> Void) {
        guard let url = url else {
            let error = NSError.init(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey:"Url or parameters not valid"])
            failure(error)
            return
        }
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: timeOutInterval)
        request.httpMethod = method
        request.allHTTPHeaderFields = header
        request.httpBody = postData
        if loader { CommonFunctions.showActivityLoader() }
        checkRefereshTokenAndExecute(request, loader, success, failure)
    }
    
    fileprivate static func checkRefereshTokenAndExecute(_ request: NSMutableURLRequest, _ loader: Bool, _ success: @escaping JSONWithCode, _ failure: @escaping (Error) -> Void) {
        executeRequest(request, { (json,code)  in
            if loader {
                CommonFunctions.hideActivityLoader()
            }
            success(json, code)
        }) { (err) in
            if loader { CommonFunctions.hideActivityLoader() }
            failure(err)
        }
    }
    
    // MARK: - COMMON GET API
    // ======================
    static func GET(endPoint : String,
                    parameters : [String : Any] = [:],
                    headers : HTTPHeaders = [:],
                    loader : Bool = true,
                    success : @escaping JSONWithCode,
                    failure : @escaping (Error) -> Void) {
        print("============ \n Parameters are =======> \n\n \(parameters) \n =================")
        guard let urlString = (endPoint + /*"?"*/  encodeParamaters(params: parameters)).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else{
            return
        }
        var updatedHeaders = headers
        updatedHeaders["Content-Type"] = "application/json"
        
        let uri = URL(string: urlString)
        REQUEST(withUrl: uri,
                method: "GET",
                postData : nil,
                header: updatedHeaders,
                loader: loader,
                success: success,
                failure: failure)
    }
    
    // MARK: - COMMON POST API
    // =======================
    static func POST(endPoint : String,
                     parameters : [String : Any] = [:],
                     headers : HTTPHeaders = [:],
                     loader : Bool = true,
                     success : @escaping JSONWithCode,
                     failure : @escaping (Error) -> Void) {
        print("============ \n Parameters are =======> \n\n \(parameters) \n =================")
        let uri = URL(string: endPoint)
        guard let postData = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return
        }
        var updatedHeaders = headers
        updatedHeaders["Content-Type"] = "application/json"
        REQUEST(withUrl: uri,
                method: "POST",
                postData : postData,
                header: updatedHeaders,
                loader: loader,
                success: success,
                failure: failure)
    }
    
    static func POSTWithImage(endPoint : String,
                              parameters : [String : Any] = [:],
                              image : [String : UIImage] = [:],
                              headers : HTTPHeaders = [:],
                              loader : Bool = true,
                              success : @escaping JSONWithCode,
                              failure : @escaping (Error) -> Void) {
        print("============ \n Parameters are =======> \n\n \(parameters) \n =================")
        let uri = URL(string: endPoint)
        let boundary = generateBoundary()
        let postData = createDataBody(withParameters: parameters, media: image, boundary: boundary)
        //        guard let postData = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
        //            return
        //        }
        var updatedHeader = headers
        updatedHeader["Content-Type"] = "multipart/form-data; boundary=\(boundary)"
        REQUEST(withUrl: uri,
                method: "POST",
                postData : postData,
                header: updatedHeader,
                loader: loader,
                success: success,
                failure: failure)
    }
    
    static func PUT(endPoint : String,
                    parameters : [String : Any] = [:],
                    headers : HTTPHeaders = [:],
                    loader : Bool = true,
                    success : @escaping JSONWithCode,
                    failure : @escaping (Error) -> Void) {
        
        print("============ \n Parameters are =======> \n\n \(parameters) \n =================")
        
        let uri = URL(string: endPoint)
        
//        let postData = encodeParamaters(params: parameters).data(using: String.Encoding.utf8)
        var updatedHeaders = headers
        updatedHeaders["Content-Type"] = "application/json"
        guard let postData = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
                   return
               }
        
        REQUEST(withUrl: uri,
                method: "PUT",
                postData : postData,
                header: updatedHeaders,
                loader: loader,
                success: success,
                failure: failure)
        
    }
    
    
    static private func encodeParamaters(params : [String : Any]) -> String {
        var result = ""
        for key in params.keys {
            result.append(key+"=\(params[key] ?? "")&")
        }
        if !result.isEmpty {
            result.remove(at: result.index(before: result.endIndex))
        }
        return result
    }
    
    static func createDataBody(withParameters params: [String:Any]?, media: [String:UIImage]?, boundary: String) -> Data {
        let lineBreak = "\r\n"
        var body = Data()
        if let parameters = params {
            for (key, value) in parameters {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
                body.append("\(value)\(lineBreak)")
            }
        }
        if let media = media {
            for photo in media.keys {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(photo)\"; filename=\" image.jpg\"\(lineBreak)")
                body.append("Content-Type: image/jpeg\(lineBreak + lineBreak)")
                let data = media[photo]!.jpegData(compressionQuality:0.4) ?? Data()
                body.append(data)
                body.append(lineBreak)
            }
        }
        body.append("--\(boundary)--\(lineBreak)")
        return body
    }
    
    static func generateBoundary() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
}

extension Data {
    
    /// Append string to NSMutableData
    /// Rather than littering my code with calls to `dataUsingEncoding` to convert strings to NSData, and then add that data to the NSMutableData, this wraps it in a nice convenient little extension to NSMutableData. This converts using UTF-8.
    /// - parameter string:       The string to be added to the `NSMutableData`.
    
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
