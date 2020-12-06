//
//  ViewController.swift
//  Daily List
//
//  Created by Tonoy Rahman on 2020-12-01.
//

import UIKit

class ListViewController: UITableViewController {
    
    
    var itemArray = ["Buy Mike", "Buy Eggs", "Buy fruits"]
    
    let defaults = UserDefaults.standard
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
   
        if let items = defaults.array(forKey: "DailyListArray") as? [String] {
            
            itemArray = items
        }
        
    }
    
    
    // Tableview Datasource Methods :
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: "DailyListItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        
        return cell
    }
    
    
    // Tableview Delegate Methods :
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // print(indexPath.row)
    
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Item in List", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            self.itemArray.append(textField.text!)
            
            self.defaults.set(self.itemArray, forKey: "DailyListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
}
