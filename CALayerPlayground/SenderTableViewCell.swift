//
//  SenderTableViewCell.swift
//  CALayerPlayground
//
//  Created by Semen Matsepura on 04.02.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

import UIKit

class SenderTableViewCell: BaseMessageTableViewCell {
    
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
        setupMessagesLayer()
    }
    
    private func setupMessagesLayer() {
        self.messageLayer.anchorPoint = CGPoint(x: 0, y: 0.5)
        
        self.messageLayer.backgroundColor = UIColor.darkGrayColor().CGColor
//        self.messageLayer.cornerRadius = 20
        self.messageLayer.frame.size = calculateSizeOfBubleImage()
        
        if let bubble = UIImage(named: "leftBubbleBackground") {
            
            self.mask.contentsScale = bubble.scale
            self.mask.contents = bubble.CGImage
            //contentCenter defines stretchable image portion. values from 0 to 1. requires use of points (for iPhone5 - pixel = points / 2.).
            self.mask.contentsCenter = CGRect(x: bubbleRightCapInsets.left/bubble.size.width,
                y: bubbleRightCapInsets.top/bubble.size.height,
                width: 1/bubble.size.width,
                height: 1/bubble.size.height);
        }
        self.messageLayer.mask = self.mask
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.messageLayer.position = CGPoint(x: 10, y: self.bounds.height / 2)
        self.mask.frame = self.messageLayer.bounds
    }
    
    private func calculateSizeOfBubleImage() -> CGSize{
        var size = CGSize()
        size = CGSizeMake(120, 40)
        return size
    }
}





