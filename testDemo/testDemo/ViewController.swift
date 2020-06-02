//
//  ViewController.swift
//  testDemo
//
//  Created by Mac on 2020/5/27.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var progress: UIProgressView!
    
    @IBOutlet weak var lab: UILabel!
    
    @IBOutlet weak var lab2: UILabel!
    
    @IBOutlet weak var textFiled: UITextField!
    
    var detailview : DetailViewController?

    var person : Person!
    
    var observation: NSKeyValueObservation?
    
    @objc var labText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.slider.addObserver(self, forKeyPath: "value", options: .new, context: nil)
//        self.slider.addTarget(self, action: #selector(sliderChange(slider:)), for: .valueChanged)
        person = Person(name: "halo", age: 10.0, sex: "man")
        self.lab.addObserver(self, forKeyPath: "text", options: .new, context: nil)
        self.lab.tag = 0
        self.lab.accessibilityIdentifier = "第一个lab"
        self.lab2.addObserver(self, forKeyPath: "text", options: .new, context: nil)
        
        self.textFiled.addObserver(self, forKeyPath: "text", options: .new, context: nil)
        
        self.textFiled.delegate = self
        self.setValue("你好", forKey: "labText")
//        self.lab.text = value(forKey: "labText") as! String
        observation=person.observe(\Person.age, options: [.new,.old], changeHandler: { (Person, change) in
//            if let age = change.oldValue{
//                print("旧值", age)
//            }
//
//            if let age = change.newValue{
//                print("新值", age)
//                self.lab.text = String(age)
//            }
        })
        
    }


    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "value" {
            if let value = change?[NSKeyValueChangeKey.newKey] as? Float {
//                self.progress.progress = value/self.slider.maximumValue
                self.lab.text = String(value)
                self.lab2.text = String(value*2)
                self.textFiled.text = String(value*3)
                self.person.setValue(value, forKey: "age")
                print(self.person.age)
                self.setValue(String(value), forKey: "labText")
            }
        }else if keyPath == "text" {
            print("文字", change as Any)
            if let lab = (object as? UILabel) {
                print("是标签")
                if lab == self.lab {
                    print("第一个标签")
                }else {
                    print("第二个标签")
                }
            }else {
                print("不是标签")
            }
        
        }else if keyPath == "TextField" {
            print("er")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.lab.text = textFiled.text
        return true
    }
    
    
    override class func didChangeValue(forKey key: String) {
        print("fe")
    }
    
    override func willChangeValue(forKey key: String) {
        if key == "labText" {
            print("rer")
        }
    }
   
    
    @objc func sliderChange(slider:UISlider) {
        self.progress.progress = slider.value/self.slider.maximumValue
        
//        self.labText = String(slider.value)
        
        self.person.setValuesForKeys(["age":slider.value*2])
        
    }
    
         
    deinit {
        self.progress.removeObserver(self, forKeyPath: "progress")
        self.slider.removeObserver(self, forKeyPath: "value")
        self.lab.removeObserver(self, forKeyPath: "lab")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "todetail" {
//            let vc = (segue.destination as! UINavigationController).topViewController as! DetailViewController
            let vc = segue.destination as! DetailViewController
            vc.text = self.person
            print("测试", self.person.age)
        }
    }
    
   
}

