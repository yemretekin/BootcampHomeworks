//
//  ViewController.swift
//  CompanyApp
//
//  Created by Emre Tekin on 19.11.2022.
//

import UIKit

class CompanyViewController: UIViewController {

    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyBudget: UILabel!
    @IBOutlet weak var companyFoundationDate: UILabel!
    @IBOutlet weak var companyTotalSalary: UILabel!
    @IBOutlet weak var employeeAddButton: UIButton!
    
    @IBOutlet weak var expenseTextField: UITextField!
    @IBOutlet weak var incomeTextField: UITextField!
    
    @IBOutlet weak var employeeListButton: UIButton!
    let company = Company(companyName: "Tekins Technology", companyBudget: 1_000_000, foundationDate: 1996)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employeeAddButton.setTitle("Add Employee", for: .normal)
        employeeListButton.setTitle("List Employee", for: .normal)
        companyName.text = "Company Name: \(company.companyName)"
        companyBudget.text = "Company Budget: \(company.budget) Turkish Liras"
        companyFoundationDate.text = "Foundation Date: \(company.foundationDate)"
        companyTotalSalary.text = "Total Salary: \(company.totalSalary)"
    
        
    }
    

    @IBAction func employeeAddButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toAddVc", sender: nil)
    }
    
    @IBAction func employeeListButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toListVC", sender: nil)
    }
    @IBAction func addIncomePressed(_ sender: Any) {
        var amount = Int(self.incomeTextField.text ?? "0")
        company.addIncome(amount: amount!)
    }
    @IBAction func addExpensePressed(_ sender: Any) {
        var amount = Int(self.expenseTextField.text ?? "0")
        company.addExpense(amount: amount!)
        
    }
    

}

