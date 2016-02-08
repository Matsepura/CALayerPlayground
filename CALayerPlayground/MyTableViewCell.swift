//
//  MyTableViewCell.swift
//  CALayerPlayground
//
//  Created by Semen Matsepura on 04.02.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

import UIKit

class MyTableViewCell: BaseMessageTableViewCell {
    
    let bubbleRightCapInsets: UIEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 0)
    let mask = CALayer()
    
    let textLayer = CATextLayer()
    
    let string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce auctor arcu quis velit congue dictum."
    
    // MARK: Setup

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
        // setup message bubble layer
        self.messageLayer.anchorPoint = CGPoint(x: 1, y: 0.5)
        self.messageLayer.backgroundColor = UIColor.lightGrayColor().CGColor
        self.messageLayer.frame.size = self.calculateSizeOfBubbleImage()
        
        // add text to buuble message layer
        self.textLayer.string = string
        self.textLayer.fontSize = 12
        
        let str = self.string as NSString
        let attr = [NSFontAttributeName:UIFont.systemFontOfSize(12)]
//        let sz = CGSize(width: self.messageLayer.bounds.width - 24, height:90)
        let r = str.boundingRectWithSize(CGSizeMake(215, CGFloat.max), options: [.UsesLineFragmentOrigin, .UsesFontLeading], attributes:attr, context:nil)
        print(r)

        self.messageLayer.frame.size = self.calculateSizeOfBubbleImage()
        textLayer.foregroundColor = UIColor.darkGrayColor().CGColor
        textLayer.wrapped = true
        textLayer.alignmentMode = kCAAlignmentLeft
        textLayer.contentsScale = UIScreen.mainScreen().scale
        self.messageLayer.addSublayer(textLayer)
        
        if let bubble = UIImage(named: "rightBubbleBackground") {
            
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
        
        self.messageLayer.position = CGPoint(x: self.bounds.width - 10, y: self.bounds.height / 2)
        self.mask.frame = self.messageLayer.bounds
        self.textLayer.frame = CGRect(x: self.messageLayer.bounds.origin.x + 4, y: self.messageLayer.bounds.origin.y + 4, width: self.messageLayer.bounds.width, height: self.messageLayer.bounds.height)
    }
    
    private func calculateSizeOfBubbleImage() -> CGSize {
        var size = CGSize()
        size = CGSizeMake(120, 40)
        return size
    }
    
    func sizeOfString (string: String, constrainedToWidth width: Double) -> CGSize {
        return (string as NSString).boundingRectWithSize(CGSize(width: width, height: DBL_MAX),
            options: NSStringDrawingOptions.UsesLineFragmentOrigin,
            attributes: [NSFontAttributeName: self],
            context: nil).size
    }
}

extension UIFont {
    func sizeOfString (string: String, constrainedToWidth width: Double) -> CGSize {
        return (string as NSString).boundingRectWithSize(CGSize(width: width, height: DBL_MAX),
            options: NSStringDrawingOptions.UsesLineFragmentOrigin,
            attributes: [NSFontAttributeName: self],
            context: nil).size
    }
}

