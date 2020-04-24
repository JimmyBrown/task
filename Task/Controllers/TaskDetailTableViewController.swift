//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Jimmy Brown on 4/22/20.
//  Copyright © 2020 Jimmy Brown. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    var task: Task?
//    {
//        didSet {
//            loadViewIfNeeded()
//            updateViews()
//        }
//    }

    var dueDateValue: Date?
    
    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDateTextField.inputView = dueDatePicker
        updateViews()
        
    }
    func updateViews() {
        guard let task = task, isViewLoaded else { return }
        nameTextField.text = task.name
        notesTextView.text = task.notes
        dueDateTextField.text = task.due?.stringValue()
    }

    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text,
            let due = dueDateValue,
            let notes = notesTextView.text  else { return }
        
        if let task = task {
            
            // update task
            TaskController.sharedInstance.update(task: task, name: name, notes: notes, due: due)
        } else {
            // new task
            TaskController.sharedInstance.add(taskWithName: name, notes: notes, due: due)
        }
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueDateValue = sender.date
        dueDateTextField.text = dueDateValue?.stringValue()
    }
    
    @IBAction func userTappedView(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        notesTextView.resignFirstResponder()
        dueDateTextField.resignFirstResponder()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
