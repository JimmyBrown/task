//
//  TaskController.swift
//  Task
//
//  Created by Jimmy Brown on 4/22/20.
//  Copyright © 2020 Jimmy Brown. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    // MARK: - Shared Instance(singleton)
    static let sharedInstance = TaskController()
    
    // MARK: - Source of Truth
    
    let fetchedResultsController: NSFetchedResultsController<Task>
    
    init() {
        
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        
        request.sortDescriptors = [NSSortDescriptor(key: "isComplete", ascending: false), NSSortDescriptor(key: "due", ascending: false)]
        
        let resultsController: NSFetchedResultsController<Task> = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "Complete", cacheName: nil)
        
        fetchedResultsController = resultsController
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("There was an error performing the fetch")
        }
    }
    
    // MARK: - CRUD

    func add(taskWithName name: String, notes: String?, due: Date?) {
        Task(name: name, notes: notes, due: due)
        saveToPersistance()
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistance()
    }
    
    func remove(task: Task) {
        if let moc = task.managedObjectContext {
            moc.delete(task)
            saveToPersistance()
        }
    }
    
    func saveToPersistance() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch let saveError {
            print("There is a boo-boo \(saveError)")
        }
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
        saveToPersistance()
    }
}
