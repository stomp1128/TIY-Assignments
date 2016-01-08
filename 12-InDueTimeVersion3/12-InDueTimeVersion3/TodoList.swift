//
//  TodoList.swift
//  12-InDueTimeVersion3
//
//  Created by Chris Stomp on 12/1/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class TodoList
{
    private let ITEMS_KEY = "todoItems"
    
    class var sharedInstance : TodoList
    {
        struct Static
        {
            static let instance : TodoList = TodoList()
        }
        return Static.instance
    }
    
    func allItems() -> [TodoItem]
    {
        let todoDictionary = NSUserDefaults.standardUserDefaults().dictionaryForKey(ITEMS_KEY) ?? [:]
        let items = Array(todoDictionary.values)
        return items.map({TodoItem(deadline: $0["deadline"] as! NSDate, title: $0["title"] as! String, UUID: $0["UUID"] as! String!)}).sort({(left: TodoItem, right:TodoItem) -> Bool in
            (left.deadline.compare(right.deadline) == .OrderedAscending)
        })
    }
    
}

