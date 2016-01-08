//: Playground - noun: a place where people can play

import UIKit

//: ## Question 1
//: ### Leap Year
//: You are given a year, determine if it’s a leap year. A leap year is a year containing an extra day. It has 366 days instead of the normal 365 days. The extra day is added in February, which has 29 days instead of the normal 28 days. Leap years occur every 4 years. 2012 is a leap year and so is 2016. Except that every 100 years special rules apply. Years that are divisible by 100 are not leap years if they are not divisible by 400. For example 1900 was not a leap year, but 2000 was. __Print Leap year! or Not a leap year! depending on the case.__
let year = 2000

if year % 400 == 0
{
    print("Leap year!")
}
else if year % 100 == 0
{
    print("Not a Leap year!")
}
else if year % 4 == 0
{
   print("Leap year!")
}
//: ## Question 2
//: ### Food Spoilage
//: You are working on a smart-fridge. The smart-fridge knows how old the eggs and bacon in it are. You know that eggs spoils after 3 weeks (21 days) and bacon after one week (7 days). Given ```baconAge``` and ```eggsAge``` (in days) determine if you can cook bacon and eggs or what ingredients you need to throw out.
//:
//: If you can cook bacon and eggs print you can cook bacon and eggs. If you need to throw out any ingredients for each one print a line with the text throw out ingredient (throw out bacon or throw out eggs) in any order.
let baconAge = 2
let eggsAge = 2

if baconAge > 7 && eggsAge < 21
{
    print("Throw out bacon")
}
else if eggsAge > 21 && baconAge > 7
{
    print("Throw out bacon and eggs")
}
else if eggsAge > 21
{
    print("Throw out eggs")
}
else
{
    print("You can cook bacon and eggs")
}


//: ## Question 3
//: ### Difference of Square of Sums and Sum of Squares
//: The sum of the squares of the first ten natural numbers is,
//: 1^2 + 2^2 + ... + 10^2 = 385
//:
//: The square of the sum of the first ten natural numbers is,
//: (1 + 2 + ... + 10)^2 = 55^2 = 3025
//:
//: Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
//: __Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.__

func sumSquared() -> Int
{
    var total = 0
    
    for number in 1...10
    {
        total += Int("\(number * number)")!
    }
    return total
}

sumSquared()


func squaredSum() -> Int
{
    var addedTotal = 0
    
    for number in 1 ... 100
    {
        addedTotal += number
        
    }
    return addedTotal * addedTotal
}

squaredSum()

let difference = squaredSum() - sumSquared()


