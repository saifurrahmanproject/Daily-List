//
//  ViewController.swift
//  Daily List
//
//  Created by Tonoy Rahman on 2020-12-01.
//

import UIKit

class ListViewController: UITableViewController {
    
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        let newItem = Item()
        newItem.title = "Buy Mike"
        itemArray.append(newItem)
        
        let newItem = Item()
        newItem.title = "Buy Mike"
        itemArray.append(newItem)
        
        let newItem = Item()
        newItem.title = "Buy Mike"
        itemArray.append(newItem)
        
        
        
//
//        if let items = defaults.array(forKey: "DailyListArray") as? [String] {
//
//            itemArray = items
//        }
        
    }
    
    
    // Tableview Datasource Methods :
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
         
        let cell = tableView.dequeueReusableCell(withIdentifier: "DailyListItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        
        if item.done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        
        return cell
    }
    
    
    // Tableview Delegate Methods :
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // print(indexPath.row)
        
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Item in List", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
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
