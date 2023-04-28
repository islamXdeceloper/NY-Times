//
//  NYURL.swift
//  NY Times
//
//  Created by Islam Ahmed on 27/04/2023.
//

import Foundation
import UIKit
struct NYURL {
    //MARK:-static let NY Times = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/"
    //MARK:- Base URL For NY Times Company Server URL
    static let baseUrl = EnvironmentConfigurations.baseUrl
    
    //MARK:- baseUrl + "7.json?api-key=qGV9cOkBdGYsXEd2b7oA9q9RzSsqkhDr" GET {api-key}
    static let mostPopular = baseUrl + "1.json?api-key=\(EnvironmentConfigurations.api_key)"
}
