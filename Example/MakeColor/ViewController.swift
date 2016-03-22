//
//  ViewController.swift
//  MakeColor
//
//  Created by Matthew Catellier on 03/22/2016.
//  Copyright (c) 2016 Matthew Catellier, Cheng Jiang. All rights reserved.
//

import UIKit
import MakeColor

class ViewController: UIViewController
{
    let mk = MakeColor()
    
    @IBOutlet var colorOne: UITextField!
    @IBOutlet var colorTwo: UITextField!
    
    @IBAction func mkColorBtn(sender: AnyObject)
    {
        
        let color = mk.makeColor(colorOne.text!);
        self.view.backgroundColor = color;
        
    }
    
    @IBAction func mkGradientBtn(sender: AnyObject)
    {
        let colorone = colorOne.text;
        let colortwo = colorTwo.text;
        let gradient = mk.makeVerticalGradient(colorone!, bottomColor: colortwo!)
        gradient.frame = view.bounds;
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // SET DEFAULT BACKGROUND COLOR HERE
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


