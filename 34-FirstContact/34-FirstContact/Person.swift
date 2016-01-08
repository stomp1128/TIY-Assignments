//
//  Person.swift
//  
//
//  Created by Chris Stomp on 11/20/15.
//
//

import Foundation
import RealmSwift

class Person: Object
    
{
    dynamic var name = ""
    dynamic var friendCount = 0
    let people = List<Person>()
}

