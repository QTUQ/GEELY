//
//  GeelyLogInPageViewController.swift
//  GEELY
//
//  Created by Tuqa on 12/15/22.
//

import UIKit

class GeelyLogInPageViewController: UIViewController {
    
    //MARK: -Variables
    @IBOutlet weak var LogIn: UIButton!
    @IBOutlet weak var GeelyIconImage: UIImageView!
    @IBOutlet weak var CarImage: UIImageView!
    @IBOutlet weak var GeelyTitle: UILabel!
    @IBOutlet weak var PhoneNumLabel: UILabel!
    @IBOutlet weak var PhoneTextField: UITextField!
    @IBOutlet weak var carNumbLabel: UILabel!
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var carNumbTextField: UITextField!
    @IBOutlet weak var checkBoxLabel: UILabel!
    var check = true
    //MARK: -LifeCyclce
    override func viewDidLoad() {
        super.viewDidLoad()
        navigation()
        UIManipulation()
        addCustomFint()
    }
    //MARK: -dealing with UI
    func UIManipulation() {
        LogIn.layer.cornerRadius = 8
        LogIn.layer.borderWidth = 1
        LogIn.layer.borderColor = UIColor.black.cgColor
        blurView.layer.opacity = 0.3
    }
    //MARK: -add CustomFont add
    func addCustomFint() {
        PhoneNumLabel.font = UIFont(name: "PTSerif-Regular", size: 15)
        carNumbLabel.font = UIFont(name: "PTSerif-Regular", size: 15)
        GeelyTitle.font = UIFont(name: "PTSerif-Regular", size: 15)
        checkBoxLabel.font = UIFont(name: "PTSerif-Regular", size: 15)
    }
    //MARK: -navigation
    func navigation() {
        if UserDefaults.standard.bool(forKey: "ISUSERLOGGEDIN") == true {
            //User is already LoggedIn
            let verificationVC = self.storyboard?.instantiateViewController(withIdentifier: "GoToVerificationView") as! GeelyVerificationViewController
            self.navigationController?.pushViewController(verificationVC, animated: false)
        }
    }
    //MARK: -checkBox method (Selected, unSelected)
    @IBAction func checkBoxButton(_ sender: AnyObject) {
        check = !check
        if check == true {
            sender.setImage(UIImage(named: "selectedBox"), for: .normal)
        }
        
        else {
            sender.setImage(UIImage(named: "unselectedbox"), for: .normal)
        }
    }
    @IBAction func logInButton(_ sender: UIButton) {
        if PhoneTextField.text != "" && carNumbTextField.text != "" && check == true {
            //Save users Info using userDefaults.
            UserDefaults.standard.set(true, forKey: "ISUSERLOGGEDIN")
            //Navigate to Verification View
            let verificationVC = self.storyboard?.instantiateViewController(withIdentifier: "GoToVerificationView") as! GeelyVerificationViewController
            self.navigationController?.pushViewController(verificationVC, animated: true)
        }
        else {
            let alert = UIAlertController(title: "LogIn Failed", message: "Please enter a correct phone number and car number.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    
}
