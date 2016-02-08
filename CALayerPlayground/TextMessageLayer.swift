//
//  TextMessageLayer.swift
//  CALayerPlayground
//
//  Created by Semen Matsepura on 08.02.16.
//  Copyright © 2016 Semen Matsepura. All rights reserved.
//

import UIKit

class TextMessageLayer: CATextLayer {
    
    // MARK: - Property
    
    private(set) var textInMessageLayer: CATextLayer!
    
        var necessarySize = CGSize()
        let stringTest = "For the world you may be just one person, but for one person you may be the whole world!"

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
        self.textInMessageLayer = CATextLayer()
                addTextToLayer()
        self.addSublayer(self.textInMessageLayer)

    }
    
    override func layoutSublayers() {
        super.layoutSublayers()
        self.textInMessageLayer.frame.size = CGSizeMake(self.necessarySize.width + 10, self.necessarySize.height + 10)
//        self.textInMessageLayer.frame = self.bounds
    }

    private func addTextToLayer() {
        
        let font = UIFont.systemFontOfSize(12)
        self.textInMessageLayer.string = stringTest
        let fontName = font.fontName as NSString
        let cgFont = CGFontCreateWithFontName(fontName);
        self.textInMessageLayer.font = cgFont
        self.textInMessageLayer.fontSize = font.pointSize
        
        let str = self.stringTest as NSString
        let attr = [NSFontAttributeName:font]
        //        let sz = CGSize(width: self.messageLayer.bounds.width - 24, height:90)
        let r = str.boundingRectWithSize(CGSizeMake(215, CGFloat.max), options: [.UsesLineFragmentOrigin, .UsesFontLeading], attributes:attr, context:nil)
        print(r)
        self.necessarySize = r.size
        
        textInMessageLayer.foregroundColor = UIColor.darkGrayColor().CGColor
        textInMessageLayer.wrapped = true
        textInMessageLayer.alignmentMode = kCAAlignmentLeft
        textInMessageLayer.contentsScale = UIScreen.mainScreen().scale
        
    }
    
    func setupSize() -> CGSize {
        var size = self.necessarySize
        size.height += 10
        size.width += 10
        
        return size
    }
}
