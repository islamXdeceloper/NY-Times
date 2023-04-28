//
//  ErrorModel.swift
//  NY Times
//
//  Created by Islam Ahmed on 27/04/2023.
//

import Foundation
struct ErrorModel : Codable {
    var fault : Fault?
}
struct Fault : Codable {
    var faultstring : String?
    var detail : Detail?
}
struct Detail : Codable {
    var errorcode : String?
}
