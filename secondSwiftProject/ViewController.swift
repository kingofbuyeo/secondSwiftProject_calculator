//
//  ViewController.swift
//  secondSwiftProject
//
//  Created by 김용철 on 2018. 6. 16..
//  Copyright © 2018년 김용철. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var value = 0
    var calc : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    @IBOutlet weak var buttonControll: UIButton!
    
    @IBOutlet weak var calculatorTextField: UITextField!
    @IBAction func zeroButton(_ sender: Any) {
        changeTextFile(num: "0")
    }
    @IBAction func oneButton(_ sender: Any) {
        changeTextFile(num: "1")
    }
    @IBAction func twoButton(_ sender: Any) {
        changeTextFile(num: "2")
    }
    @IBAction func threeButton(_ sender: Any) {
        changeTextFile(num: "3")
    }
    @IBAction func fourButton(_ sender: Any) {
        changeTextFile(num: "4")
    }
    @IBAction func fiveButton(_ sender: Any) {
        changeTextFile(num: "5")
    }
    @IBAction func sixButton(_ sender: Any) {
        changeTextFile(num: "6")
    }
    @IBAction func sevenButton(_ sender: Any) {
        changeTextFile(num: "7")
    }
    @IBAction func eightButton(_ sender: Any) {
        changeTextFile(num: "8")
    }
    @IBAction func nineButton(_ sender: Any) {
        changeTextFile(num: "9")
    }
    @IBAction func allClearButton(_ sender: Any) {
        value = 0
        calc = ""
        calculatorTextField.text = "0"
    }
    @IBAction func clearButton(_ sender: Any) {
        calc = ""
        calculatorTextField.text = "0"
    }
    @IBAction func sumButton(_ sender: Any) {
        calculate(char: "+")
    }
    @IBAction func minusButton(_ sender: Any) {
        calculate(char: "-")
    }
    @IBAction func multiButton(_ sender: Any) {
        calculate(char: "*")
    }
    @IBAction func divisionButton(_ sender: Any) {
        calculate(char: "/")
    }
    @IBAction func resultButton(_ sender: Any) {
        if(calc == ""){
            return
        }
        calculate(char: "=")
    }
    
    func calculate(char : String) {
        var displayValue:Int = Int(calculatorTextField.text!)!
        var temp : Int = 0
        if(calc == ""){
            calc = char;
            value = displayValue
            calculatorTextField.text = "0"
            return
        }
        switch char {
        case "+":
            
            if(calc != "+"){
                calculate(char : calc)
                calc = "+"
            }else{
                temp = value + displayValue
                
                calculatorTextField.text = "0"
            }
            
            
        case "-" :
            if(calc != "-"){
                calculate(char : calc)
                calc = "-"
            }else{
                temp = value - displayValue
                print(temp);
                calculatorTextField.text = "0"
            }
            
        case "*" :
            if(calc != "*"){
                calculate(char : calc)
                calc = "*"
            }else{
                temp = value * displayValue
                print(temp);
                calculatorTextField.text = "0"
            }
            
        case "/" :
            if(displayValue == 0){
                return
            }
            if(calc != "/"){
                calculate(char : calc)
                calc = "/"
            }else{
                temp = value / displayValue
                print(temp);
                calculatorTextField.text = "0"
            }
            
        case "=" :
            print(calc)
            if(calc == "+"){
                temp = value + displayValue
            }else if(calc == "-"){
                temp = value - displayValue
            }else if(calc == "*"){
                temp = value * displayValue
            }else if(calc == "/"){
                temp = value / displayValue
            }
            
            print(temp);
            calc = ""
            calculatorTextField.text = String(temp)
        default:
            
            return
        }
        
        
        value = temp
    }
    
    func changeTextFile(num : String){
        var temp:Int = Int(calculatorTextField.text!)!
        let str = String(temp) + num
        if(str.count > 11){
            return
        }
        temp = Int(str)!
        calculatorTextField.text = String(temp)
//        value = temp
    }
}

