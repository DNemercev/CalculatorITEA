import Foundation

struct Calculation {
    
    /// result of calculation
    var resultOfCalculation: Double = 0
    /// math operator + - / *
    var operation: String = ""
    /// first operand
    var num1: Double = 0
    /// second operand
    var num2: Double = 0
    var isfirstNum: Bool = true
    /// key: operation button tag value: operation
    var operations = [10: "+", 11: "-", 12: "*", 13: "/"]
    
    
    /**
     Return resul of calculation
     - Parameter operation: math operato
     - Parameter num1: first operand
     - Parameter num2: second operand
     */
    static func changeCalculaion(operation: String, num1: Double, num2: Double) -> Double{
        switch operation {
        case "+":
            return num1 + num2
        case "-":
            return num1 - num2
        case "/":
            return num2  != 0 ? num1 / num2 : 0
        case "*":
            return num1 * num2
        default: return 0
        }
    }
}
