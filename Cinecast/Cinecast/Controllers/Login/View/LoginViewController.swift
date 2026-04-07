//
//  LoginViewController.swift
//  Cinecast
//
//  Created by Anand Mahajan on 07/04/26.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet var veFooter: UIView!
    @IBOutlet weak var lblSignUp: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.loadInitialSettings()
    }

    //MARK: - loadInitialSettings
    func loadInitialSettings(){
        
        /// confirm tableview delegates
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = self.veFooter
        /// setup UI
        designViewUI()
    }
    
    //MARK: - designViewUI
    func designViewUI(){
        self.designBtn(btn: self.btnLogin, title: "login".localized)
        lblSignUp.setClickableText(
            fullText: "dont_have_account".localized,
            clickableText: "register".localized,
            normalColor: UICOLOR_PRIMARY_TEXT,
            clickableColor: UICOLOR_BUTTON
        ) {
            self.signUPButtonClicked()
        }
    }
    
    //MARK: - signUPButtonClicked
    func signUPButtonClicked(){
        
    }
    
    //MARK: - clickLoginBtn
    @IBAction func clickLoginBtn(_ sender: Any) {
        
    }
    
}
