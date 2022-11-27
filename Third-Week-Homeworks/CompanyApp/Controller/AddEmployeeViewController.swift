//
//  AddEmployeeViewController.swift
//  CompanyApp
//
//  Created by Emre Tekin on 19.11.2022.
//

import UIKit

class AddEmployeeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let marital = ["Single","Married","Divorced"]
    let empTitle = ["Junior","MidLevel","Senior"]
    
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var maritalTextStatus: UITextField!
    @IBOutlet weak var salaryLabel: UILabel!
    
    let picker = UIPickerView()
    let employee1 = Employee(name: "", age:0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.text = employee1.name
        ageTextField.text = String(employee1.age)
        picker.dataSource = self
        picker.delegate = self
        maritalTextStatus.inputView = picker
        
        
        
        
        

    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        marital.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        marital[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        maritalTextStatus.text = marital[row]
    }
    
    

    @IBAction func addButtonPressed(_ sender: Any) {
        //company.hireEmployee(emp: employee1)
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
}
