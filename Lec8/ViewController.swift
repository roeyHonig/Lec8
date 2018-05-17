//
//  ViewController.swift
//  Lec8
//
//  Created by hackeru on 3 Sivan 5778.
//  Copyright © 5778 student.roey.honig. All rights reserved.
//

import UIKit
import AVFoundation // framework for playing sound

class ViewController: UIViewController {
    // field:
    var player: AVAudioPlayer!
    
    
    @IBOutlet weak var UITextFieldEmail: UITextField!
    @IBOutlet weak var UITextFieldPassword: UITextField!
    @IBOutlet weak var UIButtonRegister: UIButton!
    @IBOutlet weak var snackBarHeight: NSLayoutConstraint!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        UITextFieldEmail.resignFirstResponder()
        UITextFieldPassword.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIButtonRegister.layer.cornerRadius = 20
        UIButtonRegister.clipsToBounds = true
        
        let url = Bundle.main.url(forResource: "sound", withExtension: "wav")!
        // the "try!" says to ios i know i didn't handele the potiential erro but gohead any how
        player = try! AVAudioPlayer(contentsOf: url)
        
        //aside - present an icom image in theplaceholder
        //UITextFieldEmail.leftView =
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func register(_ sender: UIButton) {
        //USERDefults:
        // Save data localy in the phone
        saveData()
        
        snackBarHeight.constant = 73
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10, options: [], animations: {
            self.view.layoutIfNeeded()
        }) { (isComplete) in
            //TODO: we can cheack with the bollean "isComplete" if the animation ended
            // and do something like switch to another ViewController
            self.player.play()
        }
        
        loadData()
        
        //
        
    }
    
    func saveData (){
        
        // we'll see two options to handle the optionals
        
        
        // first: get the text from the textFields
        guard let e = UITextFieldEmail.text else {
            return
        }
        
        // nil colleasin operator
        // if there's a nil there bring me "" an emphty  string to avoid optional
        let pass = UITextFieldPassword.text ?? ""
        
        
        
        
        
        // now save the data
        // get a ref to an Object (sheard instence, kind like static) called UserDefults
        let defults = UserDefaults.standard
        
        // use the UserDefults Objects to save data        defults.set(e, forKey: "user")
        defults.set(pass, forKey: "pass")
        defults.set(e, forKey: "user")
        
        
        
    }
    func loadData() {
        // maybe we have 2 variables
        let defults = UserDefaults.standard // no new factory method
        let password = defults.string(forKey: "pass")
        let usr = defults.string(forKey: "user")
        
        if usr != nil {
            print(usr)
        }
        
    }
}

