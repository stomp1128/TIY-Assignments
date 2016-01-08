//
//  List+CoreDataProperties.swift
//  12-InDueTimeRedux
//
//  Created by Chris Stomp on 12/1/15.
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
