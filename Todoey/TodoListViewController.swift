//
//  ViewController.swift
//  Todoey
//

import UIKit

class TodoListViewController: UITableViewController {
var itemArray = ["Make the Loundry", "find my keys", "Clean my rrom"]
    
    let defaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let items = defaults.array(forKey: "toDoListArray") as? [String] {
            itemArray = items
        }
    }

   
    @IBAction func barButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Neue Erinnerung hinzufügen", message: "", preferredStyle: .alert)
        
        var textField = UITextField()
        let placeholder = "z.B. einkaufen gehen"
       
        let action = UIAlertAction(title: "Neues Element", style: .default) { (action) in
            // will happen once th user clicks the "neues Element" button
            print(textField.text!)
            
                
           
            self.itemArray.append(textField.text!)
            
            self.defaults.setValue(self.itemArray, forKey: "toDoListArray")
          
            
            self.tableView.reloadData()
            
        
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = placeholder
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    

}

// MARK: - Data Source
extension TodoListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = itemArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = message
        return cell
    }
    
}
// MARK: - TableView Delegate
extension TodoListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
}
}
