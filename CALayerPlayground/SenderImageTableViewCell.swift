//
//  SenderImageTableViewCell.swift
//  CALayerPlayground
//
//  Created by Semen Matsepura on 04.02.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

import UIKit

class SenderImageTableViewCell: BaseMessageTableViewCell<MessageLayer> {

    // MARK: Property
    
    let bubbleRightCapInsets: UIEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 0)
    let mask = CALayer()
    
    // MARK: Setup

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.commonInit()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.commonInit()
    }
    
    private func commonInit() {
        setupMessageLayer()
    }
    
    private func setupMessageLayer() {
        
        self.messageLayer.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.messageLayer.contentLayer.contentsGravity = kCAGravityResizeAspectFill
        self.messageLayer.contentLayer.backgroundColor = UIColor.darkGrayColor().CGColor
        self.messageLayer.frame.size = calculateSizeOfBubbleImage()
        
        if let bubble = UIImage(named: "mask") {
            self.mask.contentsScale = bubble.scale
            self.mask.contents = bubble.CGImage
            
            
            //contentCenter defines stretchable image portion. values from 0 to 1. requires use of points (for iPhone5 - pixel = points / 2.).
            self.mask.contentsCenter = CGRect(x: bubbleRightCapInsets.left/bubble.size.width,
                y: bubbleRightCapInsets.top/bubble.size.height,
                width: 1/bubble.size.width,
                height: 1/bubble.size.height);
            
            self.mask.contents = bubble.CGImage
            self.mask.masksToBounds = true
        }
        
        if let bubble = UIImage(named: "bubble_min") {
            self.messageLayer.contentsScale = bubble.scale
            self.messageLayer.contents = bubble.CGImage
            
            
            //contentCenter defines stretchable image portion. values from 0 to 1. requires use of points (for iPhone5 - pixel = points / 2.).
            self.messageLayer.contentsCenter = CGRect(x: bubbleRightCapInsets.left/bubble.size.width,
                y: bubbleRightCapInsets.top/bubble.size.height,
                width: 1/bubble.size.width,
                height: 1/bubble.size.height);
            
            self.messageLayer.contents = bubble.CGImage
            self.messageLayer.masksToBounds = false
        }
//        self.messageLayer.contentLayer.contents = UIImage(named: "raketa")?.CGImage
        
//        self.mask.shouldRasterize = true
//        self.mask.rasterizationScale = UIScreen.mainScreen().scale
        
        self.mask.drawsAsynchronously = true

        
        self.messageLayer.contentLayer.mask = self.mask
        self.messageLayer.contentLayer.masksToBounds = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.messageLayer.position = CGPoint(x: 10, y: self.bounds.height / 2)
        self.mask.frame = self.messageLayer.contentLayer.bounds
    }
    
    func calculateSizeOfBubbleImage() -> CGSize {
        var size = CGSize()
        size = CGSizeMake(120, 120)
        return size
    }
}