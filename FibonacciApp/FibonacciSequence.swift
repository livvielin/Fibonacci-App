//
//  FibonacciSequence.swift
//  FibonacciApp
//
//  Created by Livvie Lin on 1/27/15.
//  Copyright (c) 2015 Livvie Lin. All rights reserved.
//

import Foundation

class FibonacciSequence {
    
    let includesZero: Bool
    let values: [UInt]
    
    init(maxNumber: UInt, includesZero: Bool) {
        self.includesZero = includesZero
        if maxNumber == 0 && includesZero == false {
            values = []
        } else if maxNumber == 0 {
            values = [0]
        } else {
            var sequence: [UInt] = [0,1,1]
            var nextNumber: UInt = 2
            while nextNumber <= maxNumber {
                sequence.append(nextNumber)
                let lastNumber = sequence.last!
                let secondToLastNumber = sequence[sequence.count-2]
                let (sum, didOverflow) = UInt.addWithOverflow(lastNumber, secondToLastNumber)
                if didOverflow == true {
                    println("Overflow! The next number is too big to store in a UInt!")
                    break
                }
                nextNumber = sum
            }
            if includesZero == false {
                sequence.removeAtIndex(0)
            }
            values = sequence
        }
    }
    
    init(numberOfItemsInSequence: UInt, includesZero: Bool) {
        self.includesZero = includesZero
        if numberOfItemsInSequence == 0 {
            values = []
        } else if numberOfItemsInSequence == 1 {
            if includesZero == true {
                values = [0]
            } else {
                values = [1]
            }
        } else {
            var sequence: [UInt]
            if includesZero == true {
                sequence = [0,1]
            } else {
                sequence = [1,1]
            }
            for var i = 2; i < Int(numberOfItemsInSequence); i++ {
                let lastNumber = sequence.last!
                let secondToLastNumber = sequence[sequence.count-2]
                let (nextNumber, didOverflow) = UInt.addWithOverflow(lastNumber, secondToLastNumber)
                if didOverflow == true {
                    println("Overflow! The next number is too big to store in a UInt!")
                    break
                }
                sequence.append(nextNumber)
            }
            values = sequence
        }
    }
}