//
//  infix.swift
//  Credit
//
//  Created by Otto Dzhandzhuliya on 25.01.2023.
//

import Foundation

//infix operator ^^ { associativity left precedence 160 }
//func ^^ (radix: Int, power: Int) -> Int {
//    return Int(pow(Double(radix), Double(power)))
//}

infix operator * : MultiplicationPrecedence

precedencegroup MultiplicationPrecedence {
  associativity: left
  higherThan: AdditionPrecedence
}
 func * (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}
