//
//  Task+Convenience.swift
//  Task
//
//  Created by Jimmy Brown on 4/22/20.
//  Copyright © 2020 Jimmy Brown. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    convenience init(name: String, notes: String?, due: Date?, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = isComplete
    }
}
