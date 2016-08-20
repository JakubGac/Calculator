//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Jakub Gac on 23.07.2016.
//  Copyright © 2016 Jakub Gac. All rights reserved.
//

import Foundation

func multiply(op1: Double,op2: Double) -> Double { return op1 * op2 }

class CalculatorBrain {
    
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    private var operations: Dictionary<String,Operation> = [
        //"pi" : Operation.Constant(M_PI), for future use
        "+/-" : Operation.UnaryOperation { -$0 },
        "✔️" : Operation.UnaryOperation(sqrt),
        "✖️" : Operation.BinaryOperation {$0 * $1},
        "➗" : Operation.BinaryOperation {$0 / $1},
        "➖" : Operation.BinaryOperation {$0 - $1},
        "➕" : Operation.BinaryOperation {$0 + $1},
        "=" : Operation.Equals,
        "C"  : Operation.Cleaning
    ]
    
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double,Double) -> Double)
        case Equals
        case Cleaning
    }
    
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                executePendingBinaryOperation()
            case .Cleaning:
                accumulator = 0.0
                if pending != nil {
                    pending!.firstOperand = 0.0
                }
            }
        }
    }
    
    private func executePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}