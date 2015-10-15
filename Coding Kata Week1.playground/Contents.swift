//: Playground - noun: a place where people can play

import UIKit

//Question 1

//Multiples of 3 and 5

//If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23. Find the sum of all the multiples of 3 or 5 below 1000

let naturalNumbers = 1..<1000
var total = 0
for number in naturalNumbers
{
    if number % 5 == 0 || number % 3 == 0
    {
        total += number
    }
}

print(total)

/*var listOfNumbers = [1..<1000]

func multipleOf
{
return (number % 3 == 0 || number % 5 == 0)
}*/

func isGood(number: Int) -> Bool {
    return (number % 3 == 0 || number % 5 == 0)
}

Array(3...999)
    .filter { (number) in isGood(number) }
    .reduce(0) { (total, number) in total + number }

//Question 2

//Largest Palindrome Product

//A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99. Find the largest palindrome made from the product of two 3-digit numbers.

func isGood(number: Int)