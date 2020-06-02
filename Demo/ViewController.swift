//
//  ViewController.swift
//  Demo
//
//  Created by Mac on 2020/3/27.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDelegate {
    
    var image = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
        let btn = UIButton(frame: CGRect(origin: view.center, size: CGSize(width: 200, height: 100)))
        btn.setTitle("下载", for: [])
        btn.addTarget(self, action: #selector(downLoad), for: .touchUpInside)
        view.addSubview(btn)
        
        let btn2 = UIButton(frame: CGRect(origin: CGPoint(x: 300, y: 400), size: CGSize(width: 200, height: 100)))
        btn2.setTitle("读取", for: [])
        btn2.addTarget(self, action: #selector(loadImage), for: .touchUpInside)
        view.addSubview(btn2)
        
        image.frame = CGRect(origin: CGPoint(x: 300, y: 200), size: CGSize(width: 100, height: 100))
        image.backgroundColor = .blue
//        try? image.image = UIImage.init(data: Data.init(contentsOf: URL.init(string: "http://image.baidu.com/search/down?tn=download&ipn=dwnl&word=download&ie=utf8&fr=result&url=http%3A%2F%2Fimg2.100bt.com%2Fupload%2Fttq%2F20131124%2F1385272062997_middle.jpg&thumburl=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D1030264816%2C3603936872%26fm%3D26%26gp%3D0.jpg")!))
        view.addSubview(image)
        
    }

    
    @objc private func downLoad() {
        print("开始下载")
        var urlSession = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        urlSession.dataTask(with: URL.init(string: "http://image.baidu.com/search/down?tn=download&ipn=dwnl&word=download&ie=utf8&fr=result&url=http%3A%2F%2Fimg2.100bt.com%2Fupload%2Fttq%2F20131124%2F1385272062997_middle.jpg&thumburl=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D1030264816%2C3603936872%26fm%3D26%26gp%3D0.jpg")!) { (data, URLResponse, Error) in
            
            let userAccountPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)[0]
            let path = (userAccountPath as NSString).appendingPathComponent("1.jpg")
            
            
            try! data?.write(to: URL(fileURLWithPath: path), options: .atomic)
//            DispatchQueue.main.async {
//                let imagedata = UIImage.init(data: data!)
//                self.image.image = imagedata
//            }
            
            print(userAccountPath)
           
            
          
            
        }.resume()
    
    }
    
    @objc func loadImage() {
        var path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)[0]
        path += "/1.jpg"
        print("路径",path)
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data.init(contentsOf: url)
            DispatchQueue.main.async {
                self.image.image = UIImage(data: data)
            }
        }catch{
            print(error)
        }
        
    }

}

