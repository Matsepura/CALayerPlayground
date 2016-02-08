//
//  MessageLayer.swift
//  CALayerPlayground
//
//  Created by Semen Matsepura on 08.02.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

import UIKit

class MessageLayer: CALayer {
    
    // MARK: - Property
    
    private(set) var contentLayer: CALayer!
    
    // MARK: - Setup
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }
    
    override init(layer: AnyObject) {
        super.init(layer: layer)
        
        self.commonInit()
    }
    
    required override init() {
        super.init()
        
        self.commonInit()
    }
    
    private func commonInit() {
        self.contentLayer = CALayer()
        self.addSublayer(self.contentLayer)

        self.shadowColor = UIColor.lightGrayColor().CGColor
        self.shadowRadius = 5
        self.shadowOffset = CGSizeMake(2, 2)
        self.shadowOpacity = 1
    }
    
    override func layoutSublayers() {
        super.layoutSublayers()
        
        self.contentLayer.frame = self.bounds
    }
}
