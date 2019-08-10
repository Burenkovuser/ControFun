//
//  ViewController.swift
//  ControFun
//
//  Created by Vasilii on 10/08/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var doSomethingButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderLabel.text = "50"
    }

    // Press to Done, keyboard to close
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
 
    @IBAction func onTapCestureRecognized(sender: AnyObject) {
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }
    
    @IBAction func onSliderChanged(_ sender: UISlider) {
        sliderLabel.text = "\(lroundf(sender.value))" //lroundf округляет текущие значение до ближайшего целого
    }
    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        let setting = sender.isOn
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
    }
    @IBAction func toggleControls(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            leftSwitch.isHidden = false
            rightSwitch.isHidden = false
            doSomethingButton.isHidden = true
        } else {
            leftSwitch.isHidden = true
            rightSwitch.isHidden = true
            doSomethingButton.isHidden = false
        }
    }
    @IBAction func onbuttonPressed(_ sender: UIButton) {
        let controller = UIAlertController(title: "Are You Sure", message: nil, preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Yes, I'm sure", style: .destructive) { action in let mgs = self.nameField.text!.isEmpty ? "You can breathe easy, everything went OK" : "You can breathe easy, \(String(describing: self.nameField.text))," + "everything went OK"
            let controller2 = UIAlertController(title: "Something Was Don", message: mgs, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Phew", style: .cancel, handler: nil)
            controller2.addAction(cancelAction)
            self.present(controller2, animated: true, completion: nil)
        }
        let noAction = UIAlertAction(title: "no way", style: .cancel, handler: nil)
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
            present(controller, animated: true, completion: nil)
        }
    }
    
    
    // MARK: Text Field Delegate
    
    /*
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameField {
            textField.resignFirstResponder()
            numberField.becomeFirstResponder()
        }
        return true
    }
*/
}

