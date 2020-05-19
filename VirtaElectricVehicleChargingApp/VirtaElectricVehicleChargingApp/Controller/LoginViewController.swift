//
//  LoginViewController.swift
//  VirtaElectricVehicleChargingApp
//
//  Created by Naina Soni on 18/05/2020.
//  Copyright © 2020 Naina Soni. All rights reserved.
//

import UIKit
import Foundation
class LoginViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel = AuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.activityIndicator.isHidden = true;
        
        viewModel.showLoading = {
            DispatchQueue.main.async {
                if self.viewModel.isLoading {
                    self.activityIndicator.isHidden = false;
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.isHidden = true;
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.goToHome = {
            DispatchQueue.main.async {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "StationListViewController") as! StationListViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        viewModel.inValidLogin = {
            DispatchQueue.main.async {
                self.showError(message: "Invalid login!")
            }
        }
        
    }
    @IBAction func loginButtonPressed(_ sender: Any) {
        if validate() {
            viewModel.doLogin(username: self.usernameTF.text ?? "", password: self.passwordTF.text ?? "")
        }
    }
    
    func validate() -> Bool {
        
        self.usernameTF.resignFirstResponder()
        self.passwordTF.resignFirstResponder()
        
        if (self.usernameTF?.text!.isEmpty ?? false || self.passwordTF?.text!.isEmpty ?? false) {
            showError(message: "username/password required")
            return false
        }
        
        return true
        
    }
    
    func showError(message : String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField.isEqual(usernameTF)) {
            passwordTF.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
