//
//  ViewController.swift
//  NY Times
//
//  Created by Islam Ahmed on 27/04/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var noArticleLb: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topNavigation: TopNavigation!
    //MARK:- variable:-
     var model = MostPopularModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeButton()
        addNavigationTapped()
        setupTableView()
        getAllMostPopular()
    }
    //MARK:- Function for get the date from Server:-
    func getAllMostPopular() {
        NetworkServices.shareInstance.GetUserData(method: .get, parameter: [:], url: NYURL.mostPopular) { (list:MostPopularModel?, errorModel:ErrorModel?, error) in
            if let err = error {
                print("Error\(err)")
            }
            else if let errorModel = errorModel  {
                print("Error\(errorModel)")
                if errorModel.fault?.faultstring == "Invalid ApiKey" {
                    self.tableView.isHidden = true
                    self.noArticleLb.isHidden = false
                }
            } else {
                guard let list = list else {return}
                self.model = list
                self.tableView.isHidden = false
                self.noArticleLb.isHidden = true
                self.tableView.reloadData()
            }
        }
    }
}
extension ViewController {
    //MARK:- initialize the navigation from top take type { .home }:-
    func initializeButton() {
        topNavigation.initNavigation(for: .home)
    }
    //MARK:- initialize the navigation from top take type { .home }:-
    fileprivate func addNavigationTapped(){
        topNavigation.action(leftAction: {  [weak self] in
            self?.topNavigation.backGroundView.backgroundColor = Colors.main.color
        }, label: "NY Times Most Pupular",rightAction: {[weak self]in
            guard self != nil else {return}
            print(": make some actions here details Tapped")
        },searchAction: {[weak self] in
            guard self != nil else {return}
            print(": make some actions here Search Tapped")
           }
        )
    }
}
//MARK:- TableView Deleagte & DataSource:-
extension ViewController : UITableViewDelegate , UITableViewDataSource {
    //MARK:- setup tableView and register:-
    func setupTableView(){
        self.tableView.register(cell: HomeTableCell.self)
        self.tableView.tableFooterView = UIView()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.results?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as HomeTableCell
        cell.title.text = model.results?[indexPath.row].title
        cell.dateLb.text = model.results?[indexPath.row].published_date
        cell.content.text = model.results?[indexPath.row].byline
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return self.view.bounds.size.height / 5
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.dismiss(animated: true)
    }
}

