//
//  ViewController.swift
//  MVCアーキテクチャ
//
//  Created by 倉田　隆成 on 2018/05/29.
//  Copyright © 2018年 倉田　隆成. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let label = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.label.frame.size = CGSize(width: 220, height: 50)
        self.label.center = self.view.center
        self.view.addSubview(self.label)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        self.label.text = KvoModel.shardInstance.myDate.description
        KvoModel.shardInstance.addObserver(self, forKeyPath: "myDate", options: .new, context: nil)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        KvoModel.shardInstance.removeObserver(self, forKeyPath: "myDate")
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("touched!")
        print("Old myDate -> ")
        print(KvoModel.shardInstance.myDate)
        
        KvoModel.shardInstance.updateDate()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "MyDate"){
            print("NeW Mydate -> ")
            print(KvoModel.shardInstance.myDate.description)
            self.label.text = KvoModel.shardInstance.myDate.description
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}

