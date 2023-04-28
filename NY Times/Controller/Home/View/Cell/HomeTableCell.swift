//
//  HomeTableCell.swift
//  NY Times
//
//  Created by Islam Ahmed on 27/04/2023.
//

import UIKit

class HomeTableCell: UITableViewCell {
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var dateLb: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.leftView.layer.cornerRadius = self.leftView.frame.height/2
        self.leftView.clipsToBounds = true
    }
}
