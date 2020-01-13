//
//  ViewController.swift
//  tabview-button-fel
//
//  Created by Huy on 1/13/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var mainView : UITableView = {
    let mainView = UITableView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    var infor : [room]?
    override func viewDidLoad() {
        super.viewDidLoad()
        data()
        setupLayout()
        configtable()
        // Do any additional setup after loading the view.
    }
    func setupLayout(){
        view.addSubview(mainView)
        mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }
    func configtable(){
        mainView.dataSource = self
        mainView.delegate = self
    }
    func data(){
        infor = [
        room (imageRoom: UIImage(named: "khachsan1")!, textRoom : "The Oriental Jade Hotel", price: "$100"),
        room (imageRoom: UIImage(named: "khachsan1")!, textRoom : "The Oriental Jade Hotel", price: "$100"),
        room (imageRoom: UIImage(named: "khachsan1")!, textRoom : "The Oriental Jade Hotel", price: "$100"),
        room (imageRoom: UIImage(named: "khachsan1")!, textRoom : "The Oriental Jade Hotel", price: "$100")
        ]
        
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource  {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infor!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellRoom()
        cell.information = infor![indexPath.row]
        return cell
    }
}

