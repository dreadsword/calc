//
//  ViewController.swift
//  FrogCalc
//
//  Created by Robert Dodson on 3/22/18.
//  Copyright © 2018 Robert Dodson. All rights reserved.
//

import Cocoa

enum Operation
{
    case Add
    case Sub
    case Div
    case Mult
    case None
}


class ViewController: NSViewController
{
    var tmp: Float = 0.0
    var needclear:Bool = false
    var lastop:Operation = .None
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    
    //
    // Append a character to the register
    //
    func append(val:String)
    {
        if (needclear)
        {
            register.stringValue = ""
            needclear = false
        }
        
        register.stringValue = register.stringValue.appending(val)
    }
   
    
    //
    // do math
    //
    func calc()
    {
        switch lastop
        {
            case .Add:
            tmp = tmp + register.floatValue
            
            case .Sub:
            tmp = tmp - register.floatValue
            
            case .Mult:
            tmp = tmp * register.floatValue
            
            case .Div:
            tmp = tmp / register.floatValue
            
            case .None:
                return
        }
    }
    
    
    //
    // do an operation
    //
    func accum(op:Operation)
    {
        if (lastop == .None)
        {
            tmp = register.floatValue
        }
        else
        {
            calc()
        }
        
        register.stringValue = tmp.description;
        lastop = op
        
        needclear = true
    }

    
    //
    //  Handle for number textfield called the "register"
    //
    @IBOutlet weak var register: NSTextField!

    
    //
    // Button actions
    //
    @IBAction func sevenAction(_ sender: NSButton) { append(val:"7") }
    @IBAction func eightAction(_ sender: NSButton) { append(val:"8") }
    @IBAction func nineAction(_ sender: NSButton)  { append(val:"9") }
    @IBAction func sixAction(_ sender: NSButton)   { append(val:"6") }
    @IBAction func fiveAction(_ sender: NSButton)  { append(val:"5") }
    @IBAction func fourAction(_ sender: NSButton)  { append(val:"4") }
    @IBAction func threeAction(_ sender: NSButton) { append(val:"3") }
    @IBAction func twoAction(_ sender: NSButton)   { append(val:"2") }
    @IBAction func oneAction(_ sender: NSButton)   { append(val:"1") }
    @IBAction func zeroAction(_ sender: NSButton)  { append(val:"0") }
    @IBAction func dotAction(_ sender: NSButton)   { append(val:".") }
    
    @IBAction func divAction(_ sender: NSButton)   { accum(op:.Div)  }
    @IBAction func multAction(_ sender: NSButton)  { accum(op:.Mult) }
    @IBAction func minusAction(_ sender: NSButton) { accum(op:.Sub)  }
    @IBAction func addAction(_ sender: NSButton)   { accum(op:.Add)  }
    
    @IBAction func equalsAction(_ sender: NSButton)
    {
        calc()
        register.stringValue = tmp.description;
        lastop = .None
    }
    
    @IBAction func clearAction(_ sender: NSButton)
    {
        register.stringValue = ""
        tmp = 0.0
        lastop = .None
        needclear = false
    }
    
}

