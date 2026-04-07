//
//  Utility.swift
//  Cinecast
//
//  Created by Anand Mahajan on 07/04/26.
//

import UIKit

class Utility: NSObject{
    
    
    class func tableCell<T: UITableViewCell>(nibName: String, tableView: UITableView) -> T {
        if let cell = tableView.dequeueReusableCell(withIdentifier: nibName) as? T {
            cell.selectionStyle = .none
            return cell
        }
        
        guard let topLevelObjects = Bundle.main.loadNibNamed(nibName, owner: self, options: nil),
              let cell = topLevelObjects.first as? T else {
            fatalError("Could not load cell with identifier: \(nibName)")
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    
}
