//
//  UITableCell+Extensions.swift
//  NQAL Client
//
//  Created by Islam Ahmed on 27/04/2023.
//

import UIKit

protocol IdentifiableCell: AnyObject {
    static var cellIdentifier: String { get }
}

extension UITableViewCell: IdentifiableCell {
    static var cellIdentifier: String {
        "\(self)"
    }
}

extension UITableViewCell {
    var tableView: UITableView? {
        self.next(of: UITableView.self)
    }
    
    var indexpath: IndexPath? {
        self.tableView?.indexPath(for: self)
    }
}
