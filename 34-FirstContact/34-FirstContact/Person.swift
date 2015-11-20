//
//  Contact.swift
//  34-FirstContact
//
//  Created by Chris Stomp on 11/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//
import Foundation
import RealmSwift

class Person: Object
{
    dynamic var name = ""
    dynamic var friendCount = 0
    let people = List<Person>() //use list to define many relationships, one to many

}