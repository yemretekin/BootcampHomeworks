import UIKit

enum EmployeeType{
    case junior
    case midLevel
    case senior
}

protocol EmployeeProtocol {
    var name: String { get set }
    var age: Int { get set }
    var maritalStatus: Bool { get set }
    var salary: Int { get }
}

class Employee: EmployeeProtocol {
    var name : String
    var age : Int
    var id : Int
    var maritalStatus: Bool
    var title: EmployeeType
    var salary: Int {
        switch title {
        case .junior:
            return age * 2 * 1000
        case .midLevel:
            return age * 3 * 1000
        case .senior:
            return age * 4 * 1000
        }
    }
    
    init(name: String, age: Int, maritalStatus: Bool, title: EmployeeType, id: Int){
        self.name = name
        self.age = age
        self.maritalStatus = maritalStatus
        self.title = title
        self.id = id
    }
}

protocol CompanyProtocol {
    
}


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

let employee1 = Employee(name:"Emre", age: 26, maritalStatus: false, title: .junior, id: 1)
let employee2 = Employee(name: "Yunus", age: 29, maritalStatus: true, title: .midLevel, id: 2)
let employee3 = Employee(name: "Tekin", age: 32, maritalStatus: true, title: .senior, id: 3)


let company1 = Company(companyName: "Tekinler Technology", companyBudget: 1_000_000, foundationDate: 1996)

company1.hireEmployee(emp: employee1)
company1.hireEmployee(emp: employee2)
company1.hireEmployee(emp: employee3)
company1.fireEmployee()
company1.getTotalSalary()
company1.paySalaries()

company1.employees.count
company1.budget
