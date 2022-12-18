//
//  GeelyVerificationViewController.swift
//  GEELY
//
//  Created by Tuqa on 12/15/22.
//

import UIKit
import RxSwift
import RxCocoa

class GeelyVerificationViewController: UIViewController, UITextFieldDelegate {
    //MARK: -TextField Variables
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sendCodeLabel: UILabel!
    @IBOutlet weak var firstDigitTextField: UITextField!
    @IBOutlet weak var gradientButton: UIButton!
    @IBOutlet weak var codeDescriptionlabel: UILabel!
    @IBOutlet weak var thirdDigitTextField: UITextField!
    @IBOutlet weak var fourthDigitTextField: UITextField!
    @IBOutlet weak var secondDigitTextField: UITextField!
    var digitTextFields: [UITextField] = []
    //This is for the purpose of memory management in RxSwift to prevent memory leaks
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        cursorJumps()
        clearDigit()
        textManipulation()
        gradientREButton()
        addCustomFont()
        digitTextFields = [firstDigitTextField, secondDigitTextField, thirdDigitTextField, fourthDigitTextField]
    }
    //MARK: -addCustomFont
    func addCustomFont() {
        titleLabel.font = UIFont(name: "PTSerif-Regular", size: 15)
        sendCodeLabel.font = UIFont(name: "PTSerif-Regular", size: 15)
        codeDescriptionlabel.font = UIFont(name: "PTSerif-Regular", size: 15)
    }
    //MARK: -gradient RESend Button
    func gradientREButton() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor(named: "Blue")!.cgColor, UIColor(named: "Violet")!.cgColor]
        gradient.frame =  CGRect(x: 0, y: 0, width: gradientButton.frame.width, height: gradientButton.frame.height)
        gradient.startPoint = CGPoint(x: 1.7, y: -0.5)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.5)
        gradientButton.layer.cornerRadius = 8
        gradient.cornerRadius = 8
        gradientButton.layer.insertSublayer(gradient, at: 0)
        
    }
    @IBAction func reSendButton(_ sender: AnyObject) {
    }
    //MARK: -textManipulation (Center text horizontally and vertically in each 'box')
    func textManipulation() {
        for digitTextField in digitTextFields {
            digitTextField.textAlignment = .center
            digitTextField.contentVerticalAlignment = .center
        }
        firstDigitTextField.borderStyle = .none
        secondDigitTextField.borderStyle = .none
        thirdDigitTextField.borderStyle = .none
        fourthDigitTextField.borderStyle = .none
        firstDigitTextField.delegate = self
        secondDigitTextField.delegate = self
        thirdDigitTextField.delegate = self
        fourthDigitTextField.delegate = self
    }
    // MARK: - Navigation
    @IBAction func NavigateButton(_ sender: Any) {
        UserDefaults.standard.bool(forKey: "ISUSERLOGGEDIN")
        self.navigationController?.popToRootViewController(animated: true)
    }
    //MARK: - cursor jumps method (After entering a digit, make cursor jumps to the next box)
    func cursorJumps() {
        let responders: [(digitTextField: UITextField, potentialNextResponder: UITextField?)] = [
            (firstDigitTextField, secondDigitTextField),
            (secondDigitTextField, thirdDigitTextField),
            (thirdDigitTextField, fourthDigitTextField),
            (fourthDigitTextField, nil)
        ]
        for (digitTextField, potentialNextResponder) in responders {
            if let nextResponder = potentialNextResponder {
                digitTextField.rx.controlEvent([.editingChanged])
                    .asObservable()
                    .subscribe(onNext: { nextResponder.becomeFirstResponder() })
                    .disposed(by: disposeBag)
            } else {
                digitTextField.rx.controlEvent([.editingChanged])
                    .asObservable()
                    .subscribe(onNext: { digitTextField.resignFirstResponder() })
                    .disposed(by: disposeBag)
            }
        }
    }
    //MARK: -ClearDigit method (Clear the digit if box is tapped on)
    func clearDigit() {
        for digitTextField in digitTextFields {
            digitTextField.rx.controlEvent(.editingDidBegin)
                .asObservable()
                .subscribe(onNext: { [unowned self] in
                    digitTextField.text = ""
                })
                .disposed(by: disposeBag)
        }
    }
}
