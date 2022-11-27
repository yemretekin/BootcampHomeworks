//
//  ListEmployeeViewController.swift
//  CompanyApp
//
//  Created by Emre Tekin on 19.11.2022.
//

import UIKit

class ListEmployeeViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var ListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()

    }
    
    func configureTableView(){
        ListTableView.dataSource = self
        ListTableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }

}
    

