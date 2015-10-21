
//Coding Kata 3

import UIKit

//: # Question 1
//: ## Seconds
//: Determine the number of seconds in a year and store the number in a variable named ```secondsInAYear```.

let secondsInMinute = 60
let minutesInHour = 60
let HoursinDay = 24
let DaysinYear = 365

let secondsInAYear = DaysinYear * (HoursinDay * (secondsInMinute * minutesInHour))



//: # Question 2
//: ## Coin Toss
//: If you use ```arc4random()``` it will give you a random number. Generate a random number and use it to simulate a coin toss. Print "heads" or "tails".
import Foundation
var randomNumber = arc4random()

if randomNumber % 2 == 0
{
    print("heads")
}
else
{
    print("tails")
}



//: # Question 3
//: ## Testing
//: Test if ```number``` is divisible by 3, 5 and 7. For example 105 is divisible by 3,5 and 7, but 120 is divisible only by 3 and 5 and not by 7. If ```number``` is divisible by 3, 5, 7 print "number is divisible by 3, 5 and 7" otherwise print "number is not divisible by 3, 5 and 7".
var number = arc4random() % 1000

if number % 3 == 0 && number % 5 == 0 && number % 3 == 0
{
    print("number is divisible by 3, 5, and 7")
}
else
{
    print("number is not divisible by 3, 5, and 7")
}