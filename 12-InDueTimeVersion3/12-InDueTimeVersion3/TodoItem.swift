//
//  TodoItem.swift
//  12-InDueTimeVersion3
//
//  Created by Chris Stomp on 12/1/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

struct TodoItem
{
    var title: String
    var deadline: NSDate
    var UUID: String 
    
    init(deadline: NSDate, title: String, UUID: String)
    {
        self.deadline = deadline
        self.title = title
        self.UUID = UUID
    }
    
    var isOverdue: Bool{
        return (NSDate().compare(self.deadline) == NSComparisonResult.OrderedDescending) // deadline is earlier than current date
    }
    
}


