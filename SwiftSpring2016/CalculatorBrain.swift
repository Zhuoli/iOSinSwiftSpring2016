//
//  CalculatorBrain.swift
//  SwiftSpring2016
//
//  Created by LiangZhuoli on 4/24/16.
//  Copyright © 2016 ios.zhuoliliang.com. All rights reserved.
//

import Foundation

func multiply(op1 : Double, op2 : Double) -> Double
{
    return op1 * op2;
}

class CalculatorBrain
{
    private var accumulator = 0.0
    func setOperand(operand : Double)
    {
        accumulator = operand
    }
    
    var operations: Dictionary<String, Operation> = [
        "π":Operation.Constant(M_PI),
        "e":Operation.Constant(M_E),
        "√":Operation.UnaryOpeation(sqrt),
        "cos":Operation.UnaryOpeation(cos),
        "✕":Operation.BinaryOperation(multiply),
        "=":Operation.Equals
    ]
    

    enum Operation {
        case Constant(Double)
        case UnaryOpeation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    func performOperatin(symbol : String)
    {
        if let operation = operations[symbol]
        {
            switch operation {
            case .Constant(let value): accumulator = value
                break
            case .UnaryOpeation(let function): accumulator = function(accumulator)
                break
            case .BinaryOperation(let function):pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
                break
            case .Equals:
                if pending != nil
                {
                    accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
                    pending = nil
                }
                break
            }
        }
    }
    
    var pending: PendingBinaryOperationInfo?
    
    struct  PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    var result: Double
        {
        get {
            return accumulator
        }
    }
}