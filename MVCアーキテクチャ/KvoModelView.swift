//
//  KvoModelView.swift
//  MVCアーキテクチャ
//
//  Created by 倉田　隆成 on 2018/05/29.
//  Copyright © 2018年 倉田　隆成. All rights reserved.
//

import UIKit

class KvoModelView: UIView {

    let mainLabel: UILabel!
    
    override init(frame: CGRect) {
        self.mainLabel = UILabel()
        
        self.mainLabel.textAlignment = .center
        
        self.mainLabel.text = KvoModel.shardInstance.myDate.description
        
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        self.addSubview(mainLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let labelSize = self.mainLabel.sizeThatFits(self.bounds.size)
        
        let x = (self.bounds.width - labelSize.width) / 2
        let y = (self.bounds.height - labelSize.height) / 2
        let labelOrigin = CGPoint(x: x, y: y)
        
        self.mainLabel.frame = CGRect(origin: labelOrigin, size: labelSize)
        
    }

}
