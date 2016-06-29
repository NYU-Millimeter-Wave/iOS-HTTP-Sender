//
//  ViewController.swift
//  UIExample1
//
//  Created by Aurélien Le Floc'h on 17/06/16.
//  Copyright © 2016 Aurélien Le Floc'h. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {

    @IBOutlet weak var ipadress: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = [String]()
    var request: Int = 0
    var adress : String = "q"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Connect data (pickerview):
        self.picker.delegate = self
        self.picker.dataSource = self
        
        // Input data into the Array (pickerview):
        pickerData = ["POST", "GET", "PUSH"]
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // The number of columns of data (pickerview)
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data (pickerview)
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in (pickerview)
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // Take the choice of the request
        request = row
        return pickerData[row]
    }
    // Take the adress from the Textfield
    @IBAction func ipChanged(sender : AnyObject) {
        adress = ipadress.text!
    }
    
    // Alert message button
    @IBAction func showMessage()
    {
        // The editing is finished (call ipChanged)
        ipadress.endEditing(true)
        
        // Test PC Windows
        adress = "http://172.16.8.164:8000/"
        //adress = "http://localhost:8000/"
        
        let alertControl = UIAlertController(title:"HTTP Request",
                                             message : "Your request has been sent",
                                             preferredStyle: UIAlertControllerStyle.Alert)
        
        alertControl.addAction(UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default,
            handler: nil))
        
        self.presentViewController(alertControl, animated: true,
                                   completion: nil)
        print("Request = " + pickerData[request])
        print("Adress = " + adress)
        let r1 = Raspberry(ipadress: adress)
        let iphone = Iphone()
        iphone.sendRequest(r1)
        
    }
    
    // Retire the keyboard when you touch the screen
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
 
}

