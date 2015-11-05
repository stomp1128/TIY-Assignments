//
//  List+CoreDataProperties.swift
//  Due Time
//
//  Created by Chris Stomp on 10/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension List {

    @NSManaged var item: String?
    @NSManaged var completed: Bool

}
