//
//  MessageLayer.swift
//  CALayerPlayground
//
//  Created by Semen Matsepura on 08.02.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

import UIKit

typealias MessageLayer = BaseMessageLayer<CALayer>

class BaseMessageLayer<T: CALayer>: CALayer {
    
    // MARK: - Property
    
    private(set) var contentLayer: T!
    //test
    //    private(set) var maskLayer: CALayer!
    //    let bubbleRightCapInsets: UIEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 0)
        var necessarySize = CGSize()
    //test
    
    // MARK: - Setup
    
//    class func contentLayerClass() -> CALayer.Type {
//        return CALayer.self
//    }
    
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
        self.contentLayer = T.init()
        self.addSublayer(self.contentLayer)
        
        self.backgroundColor = UIColor.clearColor().CGColor
        self.masksToBounds = false

//        self.shadowColor = UIColor.redColor().CGColor
//        self.shadowRadius = 2.5
//        self.shadowOffset = CGSizeMake(1, 2)
//        self.shadowOpacity = 0.25
        
//        self.shouldRasterize = true
//        self.rasterizationScale = UIScreen.mainScreen().scale
        self.drawsAsynchronously = true
        
        self.contentLayer.opaque = true
        
        self.contentLayer.drawsAsynchronously = true
    }
    
    override func layoutSublayers() {
        super.layoutSublayers()
        
        var frame = self.bounds
        frame.origin.x += 4.5
        frame.size.width -= 8
        frame.size.height -= 9

        self.contentLayer.frame = frame
        //test
        //        self.maskLayer.frame = self.bounds
        //test
    }
}
