//
//  ViewController.swift
//  Calculator
//
//  Created by Nemercev Dmytro on 24.07.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var buttonsOutlet: [UIButton]!
    @IBOutlet weak var inputOutputTextFieldOutlet: UITextField!
    
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
    var operators = [10: "+", 11: "-", 12: "*", 13: "/"]
    override func viewDidLoad() {
        
        for buttonOutlet in buttonsOutlet {
            
            buttonOutlet.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 30.0)
            buttonOutlet.titleLabel?.textColor = .white
            buttonOutlet.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
            buttonOutlet.layer.cornerRadius =
            self.view.frame.width / 8 - 4
        }
        
        super.viewDidLoad()
    }
    
    
    @IBAction func clearButtonIsPressed(_ sender: Any) {
        self.reloadAllParam()
        inputOutputTextFieldOutlet.text = "0"
    }
    
    
    @IBAction func numButtoIsPressed(_ sender: Any) {
        
        if inputOutputTextFieldOutlet.text == "0" {
            inputOutputTextFieldOutlet.text = String((sender as! UIButton).tag)
        } else {
            if checkInputOutputText(str: inputOutputTextFieldOutlet.text!) {
                inputOutputTextFieldOutlet.text! += String((sender as! UIButton).tag)
            }
        }
    }
    
    @IBAction func operatorButtonIsPressed(_ sender: Any) {
        operation = operators[(sender as! UIButton).tag]!
        num1 = Double(inputOutputTextFieldOutlet.text!) ?? 0
        inputOutputTextFieldOutlet.text = "0"
    }
    
    
    @IBAction func equalsButtonIsPressed(_ sender: Any) {
        num2 = Double(inputOutputTextFieldOutlet.text!) ?? 0
        resultOfCalculation = Calculation.changeCalculaion(operation: self.operation, num1: Double(self.num1), num2: Double(self.num2))
        inputOutputTextFieldOutlet.text = String(resultOfCalculation)
    }
}

//MARK: extension of MainViewController

extension MainViewController {
    func reloadAllParam () {
        self.resultOfCalculation = 0
        self.num1 = 0
        self.num2 = 0
        self.operation = ""
        self.isfirstNum = true
    }
    
    
    /**
        Control count of string
        - Parameter str: string for checking
    */
    func checkInputOutputText(str: String) -> Bool {
        str.count <= 12 ? true : false
    }
}


//MARK: Calculation
struct Calculation {
    
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

