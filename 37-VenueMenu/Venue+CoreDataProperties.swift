//
//  Venue+CoreDataProperties.swift
//  37-VenueMenu
//
//  Created by Chris Stomp on 12/7/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Venue {

    @NSManaged var address: String?
    @NSManaged var name: String?
    @NSManaged var rating: NSNumber?
    @NSManaged var userLike: NSNumber?
    @NSManaged var lat: NSNumber?
    @NSManaged var lng: NSNumber?

}
