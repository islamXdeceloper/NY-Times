//
//  APi.swift
//  NY Times
//
//  Created by Islam Ahmed on 27/04/2023.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkServices {
    // Singletone
    static let shareInstance = NetworkServices()
    //MARK:- Generics Codable to make time easy
    //MARK:- T Type from generic - E Type from generic Error
    func GetUserData<T: Codable, E:Codable>(method : HTTPMethod,
    parameter  : [String : Any] ,url: String,
    header : HTTPHeaders? = [
       "Content-Type" : "application/json"],
    encoding : ParameterEncoding = URLEncoding.default,
        completion: @escaping (T?,E? ,Error?)-> Void) {
        print("parameter = \(parameter) , ==========> url ==========> \(url)")
        Alamofire.request(url,method: method,parameters: parameter ,encoding: encoding  ,headers: header).validate(statusCode: 200..<300).responseJSON { (response) in
            guard let data = response.data else {return}
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
                do {let get =  try JSONDecoder().decode(T?.self, from: data)
                    completion(get,nil,nil)
                } catch let jsonError { print(jsonError) }
            case .failure(let error):
                let statusCode = response.response?.statusCode ?? 0
                if statusCode > 300 {
                    do {
            guard let data = response.data else {return}
            let responseError = try JSONDecoder().decode(E?.self, from: data)
                completion(nil,responseError,nil)
                    } catch let jsonError {
                        print(jsonError)
                    }
                } else {
                    completion(nil,nil,error)
                }
            }
        }
    }
}
