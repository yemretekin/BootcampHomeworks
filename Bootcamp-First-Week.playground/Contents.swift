import Foundation

//1.Soru

func isPalindrome(_ myStr: String) -> Bool {
    let lowercasedInput = myStr.lowercased()
    
    return lowercasedInput.reversed() == Array(lowercasedInput)
}

isPalindrome("2223222")
isPalindrome("HANNAH")

//2.Soru

func solve(myArray:[AnyHashable]) -> [AnyHashable:Int] {
var counts: [AnyHashable : Int] = [:]

for item in myArray {
    counts[item] = (counts[item] ?? 0) + 1
}

    return counts
    
}
solve(myArray:["Emre",3,"Emre",3,"Emre"])


//3.Soru

func makePyramid(_ n:Int){
for i in  1...n{

    for _ in 1...i{
        print("*",terminator: "")
    }
    print("")
}
}
makePyramid(4)

//4.Soru

func makeMiddlePyramid(_ n: Int){
    for i in 1...n
    {
        for _ in stride(from: n, to: i, by: -1)
        {
            print(terminator : " ")
        }

        for _ in 1...i
        {
            print("*",terminator : " ")
        }
        print(" ")
    }
}

makeMiddlePyramid(5)

//Euler 1.Soru (Multiples of 3 or 5)

func multiplesOfThreeAndFive() -> Int {
        
        var total = 0
        
        for i in 1..<1000 {
            if i % 3 == 0 || i % 5 == 0 {
                total = total + i
            }
        }
        
        return total
    }
multiplesOfThreeAndFive()

//Euler 2.Soru (Even Fibonacci numbers)

func evenFibonacci(_ maxValue:Int) -> Int {
        var start = 0
        var next = 1
        var total = 0
        
        while next < maxValue {
            let asist = start + next
            start = next
            next = asist
            
            if next % 2 == 0 {
                total = total + next
            }
        }
        
        return total
    }
evenFibonacci(4000000)

//Euler 3.Soru (Largest prime factor)

func largestPrimeFactor() -> Int {
        
        var n = 600851475143
        var division = 2
        
        while division <= n {
            if n % division == 0 {
                n = n / division
            } else {
                division += 1
            }
        }
        
        return division
    }
largestPrimeFactor()

