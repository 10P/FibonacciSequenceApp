//
//  FibonacciSequence.swift
//  FibonacciApp
//
//  Created by E on 2/26/15.
//  Copyright (c) 2015 punch. All rights reserved.
//

import Foundation

// Fibonacci Model

class FibonacciSequence {
    
    var includesZero: Bool
    var values: [UInt64]
    
    init(maxNumber: UInt64, includesZero: Bool) {
        self.includesZero = includesZero
        //TODO: Create an array which contains the numbers in the Fibonacci sequence, but don't add any numbers to the array which exceed the maxNumber. For example, if the maxNumber is 10 then the array should contain [0,1,1,2,3,5,8] because the next number is 13 which is higher than the maxNumber. If includesZero is false then you should not include the number 0 in the sequence.
        
        var isReached = false
        var fibArray:[UInt64] = []
        
        if(self.includesZero == true && maxNumber > 0) {
            
            fibArray = [0,1]
            var index = 1
            
            while(isReached == false) {
                var (newNum, didOverflow) = UInt64.addWithOverflow(fibArray[index-1], fibArray[index])
                if(didOverflow) {
                    println("Warning: Next number is too large to store")
                    break
                }
                if(newNum <= maxNumber) {
                    fibArray.append(newNum)
                    index++
                }
                else {
                    isReached = true
                }
            }
        }
        else if(self.includesZero == false && maxNumber > 0) {
            
            fibArray = [1,1]
            var index = 1
            var newNum:UInt64 = 0
            
            while(isReached == false) {
                
                var (newNum, didOverflow) = UInt64.addWithOverflow(fibArray[index-1], fibArray[index])
                if(didOverflow) {
                    println("Warning: Next number is too large to store")
                    break
                }
                if(newNum <= maxNumber) {
                    fibArray.append(newNum)
                    index++
                }
                else {
                    isReached = true
                }
                
            }
        }
        else if(self.includesZero == true && maxNumber == 1){
            fibArray = [0]
        }
        else {
            fibArray = []
        }
        
        values = fibArray
        
    }
    
    init(numberOfItemsInSequence: UInt64, includesZero: Bool) {
        self.includesZero = includesZero
        //TODO: Create an array which contains the numbers in the Fibonacci sequence, and the array should contain this many items: numberOfItemsInSequence. For example, if numberOfItemsInSequence is 10 then the array should contain [0,1,1,2,3,5,8,13,21,34] if inlcudesZero is true, or [1,1,2,3,5,8,13,21,34,55] if includesZero is false.
        
        /*
        if(numberOfItemsInSequence > 94) {
        println("Sequence is too large")
        }
        */
        
        var fibArray:[UInt64] = []
        
        var range:Int = Int(numberOfItemsInSequence)
        
        if range == 0 {
            fibArray = []
        }
        else if range == 1 {
            if(self.includesZero) {
                fibArray = [0]
            }
            else {
                fibArray = [1]
            }
        
        }
        else if(range == 2) {
            
            if(self.includesZero) {
                
                fibArray = [0,1]
                
            } else {
                
                fibArray = [1,1]
            }
        }
        else {
            
                if(self.includesZero) {
                
                    fibArray = [0,1]
                    
                } else {
                
                    fibArray = [1,1]
                }
            
                var index:UInt64
                var newNum:UInt64
            
                var limit = range - 2
            
                if limit == 2 {
                
                }
            
                for index in 1 ... limit {
                    var (newNum, didOverflow) = UInt64.addWithOverflow(fibArray[index-1], fibArray[index])
                    if(didOverflow) {
                        println("Warning: Next number is too large to store")
                        break
                    }
                    fibArray.append(newNum)
                }
            
        }
        
        values = fibArray
        
    }
}