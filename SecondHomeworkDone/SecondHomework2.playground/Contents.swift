import Foundation

protocol AnimalSitterProtocol {
    var id: Int { get }
    var name: String { get }
    var age: Int { get }
    var animals: [Animals] { get set }
    var salary: Int { get }
}

class AnimalSitter:AnimalSitterProtocol{
    var id: Int
    var name: String
    var age: Int
    var animals: [Animals]
    var salary: Int {
        return animals.count * age * 100
    }
    
    init(id: Int, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
        self.animals = []
    }
    func addNewAnimal(_ newAnimal: Animals){
        self.animals.append(newAnimal)
    }
    
    
}

protocol Animals {
    var id: Int { get }
    var name: String { get }
    var waterConsumption: Int { get }
    var animalSitter : AnimalSitterProtocol? { get set }
    var makeSound: String { get }
    
}
extension Animals {
    func drinkWater() {
            print("\(self.makeSound) - \(self.waterConsumption)")
        }
        mutating func setAnimalSitter(animalSitter:AnimalSitter) {
            self.animalSitter = animalSitter
        }
}

class Cat: Animals{
    
    var id: Int
    var name: String
    var waterConsumption: Int
    var animalSitter: AnimalSitterProtocol?
    var makeSound: String {
         return "miyav"
    }
    
    init(id: Int, name: String, waterConsumption: Int) {
        self.id = id
        self.name = name
        self.waterConsumption = waterConsumption
    }
    
}

class Dog: Animals {
    
    var id: Int
    var name: String
    var waterConsumption: Int
    var animalSitter: AnimalSitterProtocol?
    var makeSound : String{
        return "hav"
    }
    
    init(id: Int, name: String, waterConsumption: Int) {
        self.id = id
        self.name = name
        self.waterConsumption = waterConsumption
        
    }
}
struct Zoo {
    var animals: [Animals] = []
    var animalSitter: [AnimalSitter] = []
    var waterLimit: Int
    var dailyWaterNeed: Int {
        var waterNeed = 0
        for i in self.animals {
            waterNeed += i.waterConsumption
        }
        return waterNeed
    }
    var budget: Int?
    var totalSalary: Int {
        var salary = 0
        for i in self.animalSitter{
            salary += i.salary
        }
        return salary
    }
    init(waterLimit: Int, budget: Int){
        self.waterLimit = waterLimit
        self.budget = budget
    }
    mutating func addMoneyToBudget(_ money: Int) {
            if money > 0 {
                self.budget = money + (self.budget ?? 0)
                print("Money added, new budget value => \(self.budget ?? 0)")
            } else {
                print("Money couldn't be added, money should be bigger than 0")
            }
        }
    mutating func getMoneyFromBudget(_ money: Int) {
            if money > 0 {
                if let budgetMoney = self.budget {
                    if budgetMoney - money >= 0 {
                        self.budget = budgetMoney - money
                        print("Money was taken, new budget value => \(self.budget ?? 0)")
                    } else {
                        print("Budget is not enough")
                    }
                }
            } else {
                print("Failed. Money should be bigger than 0")
            }
        }
        mutating func addWater(_ water: Int) {
            if water > 0 {
                self.waterLimit = water + (self.waterLimit)
                print("Water added, new water value => \(self.waterLimit)")
            } else {
                print("Water couldn't be added, Water value should be bigger than 0")
            }
        }
        mutating func serveWater() {
            if self.waterLimit - self.dailyWaterNeed >= 0 {
                for var i in self.animals {
                    i.drinkWater()
                }
                self.waterLimit -= self.dailyWaterNeed
            } else {
                print("Water is not enough")
            }
        }
        mutating func paySalary() {
            if self.totalSalary > 0 {
                if let budgetMoney = self.budget {
                    if budgetMoney - self.totalSalary >= 0 {
                        self.budget = budgetMoney - self.totalSalary
                        print(
                            "Payment Successful, Paid money => \(self.totalSalary), New budget value => \(self.budget ?? 0)"
                        )
                    } else {
                        print("Budget isn't enough")
                    }
                } else {
                    print("Payment Failed")
                }
            } else {
                print("No salary to be paid")
            }
            
        }
        mutating func addAnimalSitter(_ newAnimalSitter: AnimalSitter) {
            if self.animalSitter.filter({ $0.id == newAnimalSitter.id }).count > 0 {
                print("The id is used \(newAnimalSitter.id)")
            } else {
                self.animalSitter.append(newAnimalSitter)
            }
            
        }
        mutating func addAnimal(_ newAnimal: Animals) {
            
            if self.animalSitter.count > 0 {
                if self.animals.filter({ $0.id == newAnimal.id }).count > 0 {
                    print("The id is used \(newAnimal.id)")
                } else {
                    var animal = newAnimal
                    var index = Int.random(in: 0..<animalSitter.count)
                    animal.setAnimalSitter(animalSitter: self.animalSitter[index])
                    self.animalSitter[index].addNewAnimal(newAnimal)
                    self.animals.append(animal)
                }
            } else {
                print("Failed, There are not zookeeper")
            }
        }
}

var animal1 = Cat(id: 1, name: "Havuc", waterConsumption: 50)
var animal2 = Cat(id: 2, name: "Sutlac", waterConsumption: 10)
var animal3 = Dog(id: 3, name: "Tarcin", waterConsumption: 60)
var animal4 = Dog(id: 4, name: "Zeytin", waterConsumption: 90)

var sitter1 = AnimalSitter(id: 1, name: "Emre", age: 26)
var sitter2 = AnimalSitter(id: 2, name: "Yunus", age: 32)
var sitter3 = AnimalSitter(id: 3, name: "Tekin", age: 29)

var exampleZoo = Zoo(waterLimit: 500, budget: 500_000)
exampleZoo.addAnimalSitter(sitter1)
exampleZoo.addAnimalSitter(sitter2)
exampleZoo.addAnimalSitter(sitter3)

exampleZoo.addAnimal(animal1)
exampleZoo.addAnimal(animal2)
exampleZoo.addAnimal(animal3)
exampleZoo.addAnimal(animal4)

exampleZoo.serveWater()

exampleZoo.paySalary()




