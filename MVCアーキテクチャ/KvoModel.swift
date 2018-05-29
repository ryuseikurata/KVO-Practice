//
//  KvoModel.swift
//  MVCアーキテクチャ
//
//  Created by 倉田　隆成 on 2018/05/29.
//  Copyright © 2018年 倉田　隆成. All rights reserved.
//

import Foundation

class KvoModel: NSObject {
    class var shardInstance: KvoModel {
        struct Singleton {
            static var instance: KvoModel = KvoModel()
        }
        return Singleton.instance
    }
    @objc dynamic var myDate = NSDate()
    
    func updateDate(){
        self.myDate = NSDate()
    }

}



