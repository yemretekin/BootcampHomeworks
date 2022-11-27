//
//  ListTableViewCell.swift
//  CompanyApp
//
//  Created by Emre Tekin on 19.11.2022.
//

import UIKit

final class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var cellNameLabel: UILabel!
    @IBOutlet weak var cellAgeLabel: UILabel!
    
    
    func configureCell(employee: Employee) {
        cellNameLabel.text = employee.name
            cellAgeLabel.text = String(employee.age)
        }
    
}
