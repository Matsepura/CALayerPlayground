//
//  MyImageTableViewCell.swift
//  CALayerPlayground
//
//  Created by Semen Matsepura on 04.02.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

import UIKit

class MyImageTableViewCell: BaseMessageTableViewCell {
    
    // MARK: Property

    let bubble = UIImage(named: "rightBubbleBackground")
    let bubbleRightCapInsets: UIEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 0)
    let mask = MessageLayer()
    
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
        self.setupMessageLayer()
    }
    
    private func setupMessageLayer() {

        self.messageLayer.anchorPoint = CGPoint(x: 1, y: 0.5)
        self.messageLayer.contentsGravity = kCAGravityResizeAspectFill
        self.messageLayer.backgroundColor = UIColor.lightGrayColor().CGColor
        self.messageLayer.frame.size = calculateSizeOfBubbleImage()
        
        if let bubble = UIImage(named: "rightBubbleBackground") {
            self.mask.contentsScale = bubble.scale
            self.mask.contents = bubble.CGImage
            //contentCenter defines stretchable image portion. values from 0 to 1. requires use of points (for iPhone5 - pixel = points / 2.).
            self.mask.contentsCenter = CGRect(x: bubbleRightCapInsets.left/bubble.size.width,
                y: bubbleRightCapInsets.top/bubble.size.height,
                width: 1/bubble.size.width,
                height: 1/bubble.size.height);
        }
        self.messageLayer.masksToBounds = false
        self.messageLayer.contents = UIImage(named: "cat")?.CGImage
        //// тени нету, картинка тянется по маске
        self.messageLayer.mask = self.mask
        //// картинка квадратная, тень есть
//        self.messageLayer.contentLayer.mask = self.mask
//        self.messageLayer.contentLayer.mask = self.messageLayer.mask
        
        self.messageLayer.contentLayer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.messageLayer.position = CGPoint(x: self.bounds.width - 10, y: self.bounds.height / 2)
        self.mask.frame = self.messageLayer.bounds
    }
    
    private func calculateSizeOfBubbleImage() -> CGSize {
        var size = CGSize()
        size = CGSizeMake(120, 120)
        return size
    }
}