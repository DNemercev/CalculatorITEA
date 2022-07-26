import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var buttonsOutlet: [UIButton]!
    @IBOutlet weak var inputOutputTextFieldOutlet: UITextField!
    
    
    var paramForCalculating = Calculation()
    
    override func viewDidLoad() {
        
        for buttonOutlet in buttonsOutlet {
            buttonOutlet.layer.cornerRadius = self.view.frame.width / 8 - 4
        }
        
        super.viewDidLoad()
    }
    
    
    
    //MARK: all button is pressed action
    @IBAction func clearButtonIsPressed(_ sender: Any) {
        self.reloadAllParam()
        inputOutputTextFieldOutlet.text = "0"
    }

    @IBAction func divideByOneHundredIsPressed(_ sender: Any) {
        inputOutputTextFieldOutlet.text = String(Double(inputOutputTextFieldOutlet.text!)! / 100)
    }
    
    @IBAction func numButtoIsPressed(_ sender: UIButton) {
        if operandIsZero(stringOperand: inputOutputTextFieldOutlet.text) {
            inputOutputTextFieldOutlet.text = String((sender).tag)
        } else {
            if checkInputOutputText(str: inputOutputTextFieldOutlet.text!) {
                inputOutputTextFieldOutlet.text! += String((sender).tag)
            }
        }
    }
    
    @IBAction func isNegativeNumberIsPressed(_ sender: Any) {
        if inputOutputTextFieldOutlet.text?.first == "-" {
            inputOutputTextFieldOutlet.text = inputOutputTextFieldOutlet.text!.replacingCharacters(in: ...(inputOutputTextFieldOutlet.text!.startIndex), with: "")
        } else {
            if !operandIsZero(stringOperand: inputOutputTextFieldOutlet.text){
                inputOutputTextFieldOutlet.text?.insert("-", at: inputOutputTextFieldOutlet.text!.startIndex)
            }
        }
        
    }
    @IBAction func operatorButtonIsPressed(_ sender: Any) {
        paramForCalculating.operation = paramForCalculating.operations[(sender as! UIButton).tag]!
        paramForCalculating.num1 = Double(inputOutputTextFieldOutlet.text!) ?? 0
        inputOutputTextFieldOutlet.text = "0"
    }
    
    @IBAction func equalsButtonIsPressed(_ sender: Any) {
        paramForCalculating.num2 = Double(inputOutputTextFieldOutlet.text!) ?? 0
        paramForCalculating.resultOfCalculation = Calculation.changeCalculaion(operation: paramForCalculating.operation, num1: Double(paramForCalculating.num1), num2: Double(paramForCalculating.num2))
        inputOutputTextFieldOutlet.text = String(paramForCalculating.resultOfCalculation)
    }
}

//MARK: extension of MainViewController

extension MainViewController {
    
    /**
     Reload init parameters for calculation
     */
    func reloadAllParam () {
        self.paramForCalculating.resultOfCalculation = 0
        self.paramForCalculating.num1 = 0
        self.paramForCalculating.num2 = 0
        self.paramForCalculating.operation = ""
        self.paramForCalculating.isfirstNum = true
    }
    
    /**
     Checks if the operand is zero
     */
    func operandIsZero(stringOperand: String?) -> Bool {
        stringOperand == "0" ? true : false
    }
    
    /**
     Control count of string
     - Parameter str: string for checking
     */
    func checkInputOutputText(str: String) -> Bool {
        str.count <= 12 ? true : false
    }
}
