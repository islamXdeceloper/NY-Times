//
//  TopNavigation.swift
//  NY Times
//
//  Created by Islam Ahmed on 27/04/2023.


import Foundation
import UIKit
typealias handlerAction = (() -> Void)
enum NavType {
    case home
}
class TopNavigation : UIView {
    //MARK:- Layout
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var lbChange: UILabel!
    @IBOutlet weak var servicesBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    //MARK:- variable:-
    var centerButtonAction: handlerAction?
    var leftButtonAction: handlerAction?
    var rightButtonAction: handlerAction?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let _ =   self.instanceFromNib(nibName: NibNameIdentifier.topNavigation)
    }
    //Mark:- Button Tapped With tag
    @IBAction func LeftTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1001:
            self.leftButtonAction?()
        case 1002:
            self.rightButtonAction?()
        case 1003:
            self.centerButtonAction?()
        default:
            break
        }
    }
}
extension TopNavigation {
    //MARK:- Setup Navigation Bar
    func initNavigation(for type:NavType) {
        switch type {
        case .home:
            self.lbChange.isHidden = false
            self.backGroundView.addShadowOffset(color: .gray)
            self.leftBtn.isHidden = false
            self.lbChange.isHidden = false
            self.rightBtn.isHidden = false
            self.servicesBtn.isHidden = false
            self.rightBtn.setImage(UIImage(named: "search"), for: .normal)
            self.rightBtn.setImageTintColor(Colors.white.color)
            self.servicesBtn.setImage(UIImage(named: "details"), for: .normal)
            self.servicesBtn.setImageTintColor(Colors.white.color)
            self.lbChange.textColor = Colors.white.color
            self.leftBtn.setImage(UIImage(named: "menu"), for: .normal)
            self.leftBtn.setImageTintColor(Colors.white.color)
            backGroundView.addBorder(.top, color: .blue, thickness: 1.0)
        }
    }
    //MARK:- Setup Actions Button
    func action(leftAction : handlerAction?,label: String?,rightAction:handlerAction?,searchAction:handlerAction?) {
        self.leftButtonAction = leftAction
        self.rightButtonAction = rightAction
        self.centerButtonAction = searchAction
        self.lbChange.text = label
    }
}
