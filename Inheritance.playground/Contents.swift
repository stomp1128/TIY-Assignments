//Iheritance

//“The example below defines a base class called Vehicle. 

class Vehicle
{
    var currentSpeed = 0.0
    var description: String
        {
        return "traveling at \(currentSpeed) miles per hour"
        }
    func makeNoise()
    {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
    
}

//    You create a new instance of Vehicle with initializer syntax, which is written as a TypeName followed by empty parentheses:

let aVehicle = Vehicle()

print("Vehicle: \(aVehicle.description)")



//Subclassing
//“Subclassing is the act of basing a new class on an existing class. The subclass inherits characteristics from the existing class, which you can then refine. You can also add new characteristics to the subclass.”

class Bicycle: Vehicle
{
    var hasBasket = false
}

let aBicycle = Bicycle()

aBicycle.hasBasket = true

aBicycle.currentSpeed = 15.0
print("Bicycle: \(aBicycle.description)")




//Subclasses can themselves be subclassed. The next example creates a subclass of Bicycle for a two-seater bicycle known as a “tandem”:

class Tandem: Bicycle
{
    var currentNumberOfPassengers = 0
}

//Tandem inherits all of the properties and methods from Bicycle, which in turn inherits all of the properties and methods from Vehicle

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

//To override a characteristic that would otherwise be inherited, you prefix your overriding definition with the override keyword.

class Train: Vehicle
{
    override func makeNoise()
    {
        print("Choo Choo")
    }
    
}

let train = Train()
train.makeNoise()


//Another example of inheritance and overriding
//new stored property introduced and inherited description is overridden and replaced with a custom version

class Car: Vehicle
{
    var gear = 1
    override var description: String
    {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")
// Car: traveling at 25.0 miles per hour in gear 3”



// Using didSet Observer

class AutomaticCar: Car
{
    override var currentSpeed: Double
    {
        didSet
        {
            gear = Int(currentSpeed / 10.0) + 1 //divides by speed by 10 and casts as Int
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
// AutomaticCar: traveling at 35.0 miles per hour in gear 4”


//You can prevent a method, property, or subscript from being overridden by marking it as final.
// example:  final var, final func, final class func, and final subscript







