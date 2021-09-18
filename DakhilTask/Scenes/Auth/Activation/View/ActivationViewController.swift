//
//  ActivationViewController.swift
//  DakhilTask
//
//  Created by Saad Sherif on 9/17/21.
//

import UIKit

final class ActivationViewController: UIViewController {
    
    // MARK: - Properties
    
    var configurator: ActivationConfiguratorImplementation!
    
    var presenter: ActivationPresenter?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var OPTTxtField1: UITextField!
    @IBOutlet weak var OPTTxtField2: UITextField!
    @IBOutlet weak var OPTTxtField3: UITextField!
    @IBOutlet weak var OPTTxtField4: UITextField!
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(ActivationViewController: self)
        OPTTxtField1.becomeFirstResponder()
    }
    
    // MARK: - Helper Functions
    
    private func activate() {
        let txt1 = OPTTxtField1.text!
        let txt2 = OPTTxtField2.text!
        let txt3 = OPTTxtField3.text!
        let txt4 = OPTTxtField4.text!
        let code = txt1 + txt2 + txt3 + txt4
        presenter?.activate(code: code)
    }
    
    // MARK: - IBActions
    
    @IBAction func resendCodeWasTapped(_ sender: UIButton) {
        print("Resend Code")
    }
    
    @IBAction func submitWasTapped(_ sender: UIButton) {
        activate()
    }
}

// MARK: - UITextFieldDelegate

extension ActivationViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.count)! < 1)  && (string.count > 0){
            if textField == OPTTxtField1 {
                OPTTxtField2.becomeFirstResponder()
            }
            if textField == OPTTxtField2 {
                OPTTxtField3.becomeFirstResponder()
            }

            if textField == OPTTxtField3 {
                OPTTxtField4.becomeFirstResponder()
            }

            if textField == OPTTxtField4 {
                OPTTxtField4.resignFirstResponder()
            }

            textField.text = string

            return false

        } else if ((textField.text?.count)! >= 1) && (string.count == 0) {
            if textField == OPTTxtField2 {
                OPTTxtField1.becomeFirstResponder()
            }
            if textField == OPTTxtField3 {
                OPTTxtField2.becomeFirstResponder()
            }

            if textField == OPTTxtField4 {
                OPTTxtField3.becomeFirstResponder()
            }

            if textField == OPTTxtField1 {
                OPTTxtField1.resignFirstResponder()
            }
            textField.text = ""

            return false

        } else if (textField.text?.count)! >= 1 {
            textField.text = string
            return false
        }
        return true
    }
}

extension ActivationViewController: ActivationView {}
