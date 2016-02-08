//
//  BaseMessageTableViewCell.swift
//  CALayerPlayground
//
//  Created by Semen Matsepura on 04.02.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

import UIKit

class BaseMessageTableViewCell: UITableViewCell {
    
    // MARK: Property

//    private(set) var messageLayer: CALayer!
    private(set) var messageLayer: MessageLayer!
    
    // MARK: Setup
    
    class func messageLayerClass() -> MessageLayer.Type {
        return MessageLayer.self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier id: String?) {
        super.init(style: style, reuseIdentifier: id)
        
        self.commonInit()
    }
    
    private func commonInit() {
        self.setupMessageLayer()
    }

    private func setupMessageLayer() {
//        self.messageLayer = self.dynamicType.messageLayerClass().init()
        self.messageLayer = self.dynamicType.messageLayerClass().init()
        self.contentView.layer.addSublayer(self.messageLayer)
        self.messageLayer.masksToBounds = true
    }
}
