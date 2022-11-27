//
//  Employee.swift
//  CompanyApp
//
//  Created by Emre Tekin on 19.11.2022.
//

import Foundation


enum MaritalType: String {
    case single = "Single"
    case married = "Married"
    case divorced = "Divorced"
}

enum EmployeeType{
    case junior
    case midLevel
    case senior
}

protocol EmployeeProtocol {
    var name: String { get set }
    var age: Int { get set }
    var salary: Int { get }
    
}

struct Employee: EmployeeProtocol {
    
    var name : String = ""
    var age : Int = 0
    var maritalStatus: MaritalType?
    var title: EmployeeType?
    var salary: Int {
        switch title {
        case .junior:
            return age * 2 * 1000
        case .midLevel:
            return age * 3 * 1000
        case .senior:
            return age * 4 * 1000
        case .none:
            return 1
        }
    }
    
//    init(name: String, age: Int, maritalStatus: Bool, title: EmployeeType){
//        self.name = name
//        self.age = age
//        self.maritalStatus = maritalStatus
//        self.title = title
//    }
}

