//
//  EmployeeQueueTableViewController.swift
//  Stack and Queue
//
//  Created by Aseel Alshohatee on 6/12/19.
//  Copyright © 2019 Aseel Alshohatee. All rights reserved.
//

import UIKit

class EmployeeQueueTableViewController: UITableViewController {

   var conter = [Int]();
    var employees: MyQueue <Int>  = MyQueue <Int>();
    var count = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        navigationItem.leftBarButtonItem = editButtonItem;
     
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath);
        
        
        // Configure the cell ...
        // The employeeNumber of the employee displayed in this cell.
        // The oldest employee has employeeNumber 1.
        // The most recent employee has employeeNumber employees.count
        print(indexPath.row)
        print("DSFS")
        let employeeNumber: Int = employees.count - indexPath.row;
        print(employeeNumber)
        //let employeeValue: String = employees.get(employeeNumber - 1);
        let employeeValue: Int = employees.get(employeeNumber - 1);   //version 2
        
        cell.textLabel!.text = "\(employees.count - indexPath.row). \(employeeValue)";
        return cell;
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        // Only the most recently hired employee can be fired.
        //   return indexPath.row == 0; stack
        return indexPath.row == employees.count-1;   // queue
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {
            return;
        }
        // Delete the row from the data source
        _ = employees.dequeue();
        
        tableView.deleteRows(at: [indexPath], with: .fade);
        tableView.reloadData();
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        guard let viewController: ViewController = segue.destination as? ViewController else {
            fatalError("destination was of type \(type(of: segue.destination))");
        }
        
        // Pass the selected object to the new view controller.
        viewController.count = employees.count;
    }
    
    @IBAction func unwind(unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.identifier == "HireSegue" else {
            return;   //Do nothing if the user cancelled the new hiring.
        }
        
        guard let viewController: ViewController = unwindSegue.source as? ViewController else {
            fatalError("source was of type \(type(of: unwindSegue.destination))");
        }
        let stringFromTextField: String = viewController.textField.text ?? "";
        
        //  let employeeValue: String = stringFromTextField;
        guard let employeeValue: Int = Int(stringFromTextField) else {   //version 2
            fatalError("could not convert string \"\(stringFromTextField)\" to Int");
        }
        
        employees.enqueue(employeeValue);
        tableView.reloadData();
    }
}
