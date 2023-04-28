//
//  EnvironmentConfigurations.swift
//  RasanClient
//
//  Created by Islam Ahmed on 27/04/2023.
//

import Foundation
import UIKit
class EnvironmentConfigurations {
    class var baseUrl: String {
        return Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as! String
    }
    static let api_key = "qGV9cOkBdGYsXEd2b7oA9q9RzSsqkhDr"
}
