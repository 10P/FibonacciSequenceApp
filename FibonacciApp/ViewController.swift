//
//  ViewController.swift
//  FibonacciApp
//
//  Created by E on 2/26/15.
//  Copyright (c) 2015 punch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var includesZeroSwitch: UISwitch!
    @IBOutlet weak var includesZeroLable: UILabel!
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var numberOfItemsSlider: UISlider!
    
    /*
    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init()
    }
    */
    
    // Ready
    
    var fibonacciSequence = FibonacciSequence(numberOfItemsInSequence: 2, includesZero: true)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.updateFibonacciSequence()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateFibonacciSequence() {
        
        if includesZeroSwitch.on {
            includesZeroLable.text = "Yes"
        }
        else {
            includesZeroLable.text = "No"
        }
        
        numberOfItemsLabel.text = String(Int(numberOfItemsSlider.value))
        
        if includesZeroSwitch.on {
            numberOfItemsSlider.maximumValue = 94
        }
        else {
            numberOfItemsSlider.maximumValue = 93
        }
        
        fibonacciSequence = FibonacciSequence(numberOfItemsInSequence: UInt64(numberOfItemsSlider.value), includesZero: includesZeroSwitch.on)
        textView.text = fibonacciSequence.values.description
        
    }


}

