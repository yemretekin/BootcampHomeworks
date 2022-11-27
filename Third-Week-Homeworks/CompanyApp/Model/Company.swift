//
//  Company.swift
//  CompanyApp
//
//  Created by Emre Tekin on 19.11.2022.
//

import Foundation

class Company {
    var companyName: String
    var budget: Int
    var foundationDate: Int
    var employees: [Employee]
    var totalSalary: Int {
            return getTotalSalary()
        }
    
    init(companyName name: String, companyBudget budget: Int, foundationDate year: Int, employees: [Employee]? = nil) {
        self.companyName = name
        self.budget = budget
        self.foundationDate = year
        self.employees = []
}
    func hireEmployee(emp:Employee){
        employees.append(emp)
    }
    
    func fireEmployee(){
        employees.removeLast()
    }
    
    func addIncome(amount: Int) {
            var previousBudget = budget
            budget += amount
            print("Gelir eklendi. Önceki bütçe: \(previousBudget)₺, Yeni bütçe: \(budget)₺")
        }
        
    func addExpense(amount: Int) {
            if budget >= amount {
                var previousBudget  = budget
                budget             -= amount
                print("Masraf eklendi. Önceki bütçe:\(previousBudget)₺, Yeni bütçe: \(budget)₺")
            } else {
                print("Masraf ödemek için yeterli para yok. Lütfen bütçeye gelir ekleyin.")
            }
        }
    func getTotalSalary() -> Int {
        var total = 0
        for employee in employees {
                total += employee.salary
            }
        return total
        }
    func paySalaries(){
        if totalSalary < budget {
            budget -= totalSalary
            print("Kalan bütçe \(budget)")
        } else {
            print("Bütçe yetersiz.")
            }
        }




}
