//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Keron Williams on 10/16/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation


class CalculatorBrain
{

    var symbol: String = ""
    var operandOne: String = ""
    var operandTwo: String = ""
    
    
    // how you define how to return  something
    func addDigit(digit: String) -> String
    {
        if symbol == ""
        {
            operandOne += digit
            return operandOne
        }
        else
        {
            operandTwo += digit
            return operandTwo
     }
   
    // If the symbol has not been pressed then any number that follow goes into operandOne, "else" - meaning the symbol is presed, then it goes in operandTwo.
   
        
        func pressSymbol(addOperator: String)
        {
           symbol = addOperator
        }

    }
}



