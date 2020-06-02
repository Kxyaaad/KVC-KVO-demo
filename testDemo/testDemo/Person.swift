//
//  Person.swift
//  testDemo
//
//  Created by Mac on 2020/6/1.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

class Person: NSObject {
    @objc var name : String!
    @objc var sex : String?
    @objc dynamic var age : Float = 0.0  ///KVC需要 @objc ， KVO需要 dynamic
    
    init(name:String, age:Float, sex:String) {
        self.name = name
        self.age = age
        self.sex = sex
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "age" {
            self.age = value as? Float ?? 0.0
            print("age值", self.age)
        }
    }
 
  
}
