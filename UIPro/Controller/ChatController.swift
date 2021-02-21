//
//  ChatViewController.swift
//  UIPro
//
//  Created by Long Nguyen on 8/16/20.
//  Copyright © 2020 Long Nguyen. All rights reserved.
//

import UIKit

class ChatController: UIViewController {
    
//MARK: - Properties
    private let tableViewChat = UITableView()
    private let reuseIdentifier = "hey"
    
    private var rows = [NewItemModel]()
    private var newNumber: Int = 0
    
//MARK: - Scenes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    
    
//MARK: - selectors
    
    @objc func showProfile () {
        //print("Show Profile..")
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func addMore () {
        print("adding..")
        var textField = UITextField()
        
        let alert = UIAlertController (title: "New Items", message: "Wanna add a new item?", preferredStyle: .alert)
        let cancel = UIAlertAction (title: "Cancel", style: .cancel, handler: nil)
        let addNew = UIAlertAction (title: "Add", style: .default) { _ in
            if textField.text?.isEmpty == false {
                
                self.newNumber = self.newNumber + 1
                let new = NewItemModel(newItemTitle: textField.text!, newItemNumber: self.newNumber)
                self.rows.append(new)
                
                self.tableViewChat.reloadData()
            }
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add a new Item"
            //alertTextField.autocapitalizationType = .words
            textField = alertTextField
        }
        
        alert.addAction(addNew)
        alert.addAction(cancel)
        present (alert, animated: true, completion: nil)
        
    }
    
    
//MARK: - functions
    
    func configureUI() {
        //view.backgroundColor = .red //this line will be useless since the UIViewController is completely filled with NavBar and tableView
        configureNavBar()
        configureTableView()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "car"), style: .plain, target: self, action: #selector(showProfile))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addMore))
    }
    
    
    func configureTableView () {
        
        view.addSubview(tableViewChat)
        tableViewChat.frame = view.frame
        //tableView.backgroundColor = .black //you can set the color if needed
        
        tableViewChat.rowHeight = 80
        
        tableViewChat.delegate = self
        tableViewChat.dataSource = self
        tableViewChat.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableViewChat.tableFooterView = UIView()
    }
    
    
    func configureNavBar () {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() //just call it
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white] //enables us to set our textColor of the largeTitle to white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white] //enables us to set our textColor of the normalTitle to white
        appearance.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
        //just call it for the sake of calling it
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance //when you scroll down, the nav bar just shrinks
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        //specify what show be showing up on the nav bar
        navigationController?.navigationBar.prefersLargeTitles = true
        //navigationItem.title = UIFont.systemFont(ofSize: 18)
        navigationItem.title = "Title Of The Car"
        navigationController?.navigationBar.tintColor = .white //enables us to set the color for the image of the nav bar button
        navigationController?.navigationBar.isTranslucent = true
    }
    
    
}



//MARK: - Datasource
extension ChatController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if rows.count == 0 {
            return 1
        } else {
            return rows.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        if rows.count == 0 {
            cell.textLabel?.text = "Press the \"+\" button on the upper right corner to add a new item"
            cell.textLabel?.adjustsFontSizeToFitWidth = true
            cell.textLabel?.numberOfLines = 2
            cell.textLabel?.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        } else {
            cell.textLabel?.text = "\(rows[indexPath.row].newItemNumber)/ \(rows[indexPath.row].newItemTitle)"
            cell.textLabel?.numberOfLines = 2
            cell.textLabel?.font = UIFont.systemFont(ofSize: 18)
            cell.textLabel?.textColor = .black
        }
        
        return cell
    }
    
}


//MARK: - Delegate
extension ChatController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
