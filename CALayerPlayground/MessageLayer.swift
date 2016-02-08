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
    //test
    //    private(set) var maskLayer: CALayer!
    //    let bubbleRightCapInsets: UIEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 0)
        var necessarySize = CGSize()
    //test
    
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

        self.shadowColor = UIColor.redColor().CGColor
        self.shadowRadius = 5
        self.shadowOffset = CGSizeMake(2, 2)
        self.shadowOpacity = 1
        //test
        //        self.maskLayer = CALayer()
        //
        //        if let bubble = UIImage(named: "rightBubbleBackground") {
        //
        //            self.maskLayer.contentsScale = bubble.scale
        //            self.maskLayer.contents = bubble.CGImage
        //            //contentCenter defines stretchable image portion. values from 0 to 1. requires use of points (for iPhone5 - pixel = points / 2.).
        //            self.maskLayer.contentsCenter = CGRect(x: bubbleRightCapInsets.left/bubble.size.width,
        //                y: bubbleRightCapInsets.top/bubble.size.height,
        //                width: 1/bubble.size.width,
        //                height: 1/bubble.size.height)
        //            self.maskLayer.shadowColor = UIColor.blackColor().CGColor;
        //            self.maskLayer.shadowRadius = 5
        //            self.maskLayer.shadowOffset = CGSizeMake(0, 3);
        //            self.maskLayer.shadowOpacity = 1
        //        }
        //        self.mask = self.maskLayer
        //
        //
        //test
    }
    
    override func layoutSublayers() {
        super.layoutSublayers()
        
        self.contentLayer.frame = self.bounds
        //test
        //        self.maskLayer.frame = self.bounds
        //test
    }
}
