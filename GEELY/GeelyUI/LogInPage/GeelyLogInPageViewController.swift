//
//  GeelyLogInPageViewController.swift
//  GEELY
//
//  Created by Tuqa on 12/15/22.
//

import UIKit

class GeelyLogInPageViewController: UIViewController {
    
    //MARK: -Variables
    @IBOutlet weak var GeelyIconImage: UIImageView!
    @IBOutlet weak var CarImage: UIImageView!
    @IBOutlet weak var GeelyTitle: UILabel!
    @IBOutlet weak var PhoneNumLabel: UILabel!
    @IBOutlet weak var PhoneTextField: UITextField!
    @IBOutlet weak var carNumbLabel: UILabel!
    @IBOutlet weak var carNumbTextField: UITextField!
    @IBOutlet weak var LogInButtonBackG: UILabel!
    @IBOutlet weak var checkBoxLabel: UILabel!
    var check = true
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
        
    }
    
    /*    // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
