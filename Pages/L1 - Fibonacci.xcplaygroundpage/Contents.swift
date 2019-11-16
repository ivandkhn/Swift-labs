//
//  Lab #1 - Fibonacci sequence
//  Created by Иван Дахненко on 15.11.2019.
//  Copyright © 2019 Ivan Dakhnenko. All rights reserved.
//

enum ReturnType {
    case lastElement
    case wholeSequence
}

func generateFibonacciSequence(upTo upperBound: Int, return returnType: ReturnType) -> [Int]? {
    if upperBound < 0 {return nil}
    var fibonacciSequence = [1, 1]
    var length = 2
    for _ in 3...upperBound {
        length = fibonacciSequence.count
        fibonacciSequence.append(fibonacciSequence[length-1] + fibonacciSequence[length-2])
    }
    switch returnType {
    case .lastElement:
        return [fibonacciSequence.last!]
    case .wholeSequence:
        return fibonacciSequence
    }
}

generateFibonacciSequence(upTo: 10, return: .lastElement)
generateFibonacciSequence(upTo: 10, return: .wholeSequence)
