//
//  DetailViewController.swift
//  testDemo
//
//  Created by Mac on 2020/6/1.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var lab: UILabel!
    @objc var text = Person(name: "hah", age: 1.0, sex: "")
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lab.text = String(self.text.age)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
