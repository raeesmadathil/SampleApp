//
//  SANetworkManager.swift
//  Sample App
//
//  Created by Raees  on 04/05/2023.
//  Copyright © 2023 Sample. All rights reserved.
//

import UIKit
import Alamofire


/// This class is to handle all network related functions
class SANetworkManager: NSObject {

    typealias CompletionHandler<T> = (Result<T, AFError>)->Void
    
    /// To fetch data from server
    /// - Parameters:
    ///   - type: `Decodable` type to decode from network request response
    ///   - url: network requesting URL
    ///   - parameters: parameters need'ed for network request
    ///   - completion: completion handler
    class func get<T:Decodable>(of type: T.Type = T.self,url:String,parameters:[String:Any], completion:CompletionHandler<T>?) {
        AF.request(url,parameters: parameters,encoding: URLEncoding.queryString).responseDecodable(of:type) { response in
                switch response.result {
                case .success(let response):
                    completion?(.success(response))
                case .failure(let error):
                    completion?(.failure(error))
                }
        }
    }
}
