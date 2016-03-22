//
//  MakeColor.swift
//  MakeColor
//
//  Created by Matthew Catellier on 2016-03-15.
//  Copyright © 2016 Matthew Catellier. All rights reserved.
//

import UIKit

public class MakeColor {
    
    // DEFAULT COLORS
    var red : UIColor { return self.makeColor("FF3B30")}
    var orange : UIColor {return self.makeColor("FF9500") }
    var yellow : UIColor { return self.makeColor("FFCC00")}
    var green : UIColor { return self.makeColor("4cd964") }
    var aqua : UIColor { return self.makeColor("34aadc") }
    var blue : UIColor { return self.makeColor("0071ff") }
    var purple : UIColor { return self.makeColor("5856d6") }
    var lightgray : UIColor { return self.makeColor("F7F7F7") }
    
    // DEFAULT GRADIENTS
    var redGradient : CAGradientLayer { return self.makeVerticalGradient("FF5E3A", bottomColor: "FF2A68")}
    var orangeGradient : CAGradientLayer { return self.makeVerticalGradient("Ff9500", bottomColor: "Ff5e3a")}
    var yellowGradient : CAGradientLayer { return self.makeVerticalGradient("Ffdb4c", bottomColor: "Ffcd02")}
    var greenGradient : CAGradientLayer { return self.makeVerticalGradient("87fc70", bottomColor: "0bd318")}
    var lightBlueGradient : CAGradientLayer { return self.makeVerticalGradient("52edc7", bottomColor:"5ac8fb")}
    var darkBlueGradient : CAGradientLayer { return self.makeVerticalGradient("1ad6fd", bottomColor: "1d62f0")}
    var purpleGradient : CAGradientLayer { return self.makeVerticalGradient("C644FC", bottomColor:"5856D6")}
    var pinkGradient : CAGradientLayer { return self.makeVerticalGradient("Ef4db6", bottomColor:"C643fc")}
    var darkGrayGradient : CAGradientLayer { return self.makeVerticalGradient("4a4a4a", bottomColor: "2b2b2b")}
    var grayGradient : CAGradientLayer { return self.makeVerticalGradient("Dbddde", bottomColor: "898c90")}
    var lightGrayGradient : CAGradientLayer { return self.makeVerticalGradient("F7f7f7", bottomColor: "FF2A68")}
    
    
    public func makeColor (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substringFromIndex(1)
        }
        
        let rString = (cString as NSString).substringToIndex(2)
        let gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        let bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
    /* http://www.developerdave.co.uk/2014/10/gradient-backgrounds-swift/ */
    public func makeVerticalGradient(topColor:String, bottomColor:String) -> CAGradientLayer {
        let topColor = makeColor(topColor);
        let bottomColor = makeColor(bottomColor);
        
        let gradientColors: Array <AnyObject> = [topColor.CGColor, bottomColor.CGColor]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.startPoint = CGPointMake(0.5, 0);
        gradientLayer.endPoint = CGPointMake(0.5, 1);
        
        return gradientLayer
    }
    
    /* http://www.developerdave.co.uk/2014/10/gradient-backgrounds-swift/ */
    public func makeHorizontalGradient(leftColor:String, rightColor:String) -> CAGradientLayer {
        let leftColor = makeColor(leftColor);
        let rightColor = makeColor(rightColor);
        
        let gradientColors: Array <AnyObject> = [leftColor.CGColor, rightColor.CGColor]
        // let gradientLocations: Array <NSNumber> = [location1, location2]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.startPoint = CGPointMake(0, 0.5);
        gradientLayer.endPoint = CGPointMake(1, 0.5);
        // gradientLayer.locations = gradientLocations
        
        return gradientLayer
    }
    
    public func makeGradient(color1:String, color2:String, startPoint:CGPoint, endPoint:CGPoint) -> CAGradientLayer {
        let topColor = makeColor(color1);
        let bottomColor = makeColor(color2);
        
        let gradientColors: Array <CGColorRef> = [topColor.CGColor, bottomColor.CGColor]
        // let gradientLocations: Array <NSNumber> = [location1, location2]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors;
        gradientLayer.startPoint = startPoint;
        gradientLayer.endPoint = endPoint;  // CGPointMake(1, 0.5);
        // gradientLayer.locations = gradientLocations
        
        return gradientLayer
    }
    
    public func makeOpac(var color:UIColor,alpha:CGFloat) ->UIColor {
        color = color.colorWithAlphaComponent(alpha);
        return color;
    }
    
    public func makeLighter(color :UIColor, percent:CGFloat)-> UIColor {
        let float = percent/100;
        let ciColor = color.coreImageColor!
        var red = ciColor.red
        if(red != 1.0 ) {
            red = ciColor.red + float;
        }
        var green = ciColor.green
        if(green != 1.0 ) {
            green = ciColor.green + float;
        }
        var blue = ciColor.blue
        if(blue != 1.0 ) {
            blue = ciColor.blue + float;
        }
        let alpha = ciColor.alpha
        
        let darkerColor = UIColor(red: red , green: green, blue:blue , alpha: alpha)
        return darkerColor;
    }
    
    public func makeDarker(color :UIColor, percent:CGFloat) ->UIColor {
        let float = percent/100;
        let ciColor = color.coreImageColor!
        var red = ciColor.red
        if(red != 0 ) {
            red = ciColor.red - float;
        }
        var green = ciColor.green
        if(green != 0 ) {
            green = ciColor.green - float;
        }
        var blue = ciColor.blue
        if(blue != 0 ) {
            blue = ciColor.blue - float;
        }
        let alpha = ciColor.alpha
        
        let darkerColor = UIColor(red: red, green: green, blue:blue , alpha: alpha)
        return darkerColor;
        
    }
    
    
}

// to get components RGB components out of a UIColor
extension UIColor {
    var coreImageColor: CoreImage.CIColor? {
        return CoreImage.CIColor(color: self)  // The resulting Core Image color, or nil
    }
}

