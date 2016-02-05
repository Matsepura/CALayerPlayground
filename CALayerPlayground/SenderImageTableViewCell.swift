//
//  SenderImageTableViewCell.swift
//  CALayerPlayground
//
//  Created by Semen Matsepura on 04.02.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

import UIKit

class SenderImageTableViewCell: BaseMessageTableViewCell {

    // MARK: Property
    
    let bubbleRightCapInsets: UIEdgeInsets = UIEdgeInsets(top: 20, left: 25, bottom: 0, right: 0)
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
        self.messageLayer.contentsGravity = kCAGravityResizeAspectFill
        self.messageLayer.backgroundColor = UIColor.darkGrayColor().CGColor
        self.messageLayer.frame.size = calculateSizeOfBubbleImage()
        
        if let bubble = UIImage(named: "leftBubbleBackground") {
            
            self.mask.contentsScale = bubble.scale
            self.mask.contents = bubble.CGImage
            
            self.mask.contentsCenter = CGRect(x: bubbleRightCapInsets.left/bubble.size.width,
                y: bubbleRightCapInsets.top/bubble.size.width ,
                width: 1/bubble.size.width,
                height: 1/bubble.size.height)
        }
        self.messageLayer.contents = UIImage(named: "raketa")?.CGImage
        self.messageLayer.mask = self.mask
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.messageLayer.position = CGPoint(x: 10, y: self.bounds.height / 2)
        self.mask.frame = self.messageLayer.bounds
    }
    
    private func calculateSizeOfBubbleImage() -> CGSize {
        var size = CGSize()
        size = CGSizeMake(120, 120)
        return size
    }
}