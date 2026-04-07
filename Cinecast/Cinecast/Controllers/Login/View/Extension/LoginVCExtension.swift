//
//  LoginVCExtension.swift
//  Cinecast
//
//  Created by Anand Mahajan on 07/04/26.
//

import UIKit

//MARK: - UITableView Delegate & DataSource
extension LoginViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TextInputCell = Utility.tableCell(nibName: "TextInputCell", tableView: tableView)
        return cell
    }
    
    
    
}
