//
//  Iphone.swift
//  UIExample1
//
//  Created by Aurélien Le Floc'h on 27/06/16.
//  Copyright © 2016 Aurélien Le Floc'h. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


class Iphone: NSObject {
    // Attribut
    
    
    
    // Constructeur
    override init() {
        super.init()
    }
    
    //Methode
    func sendRequest(receiver : Raspberry) {
        print("Adress is \(receiver.ipadress)")
        /* http://stackoverflow.com/questions/31982513/how-to-send-a-post-request-with-body-in-swift
 Alamofire.request(.POST, "http://myserver.com", parameters: ["IdQuiz":"102","IdUser":"iOSclient","User":"iOSClient","List":list ], encoding: .JSON)
 .response { request, response, data, error in
 let dataString = NSString(data: data!, encoding:NSUTF8StringEncoding)
 println(dataString)
 }*/
        Alamofire.request(.POST, receiver.ipadress, parameters: ["username":"102","password":"iOSclient"], encoding: .JSON)
            .response { request, response, data, error in
                let dataString = NSString(data: data!, encoding:NSUTF8StringEncoding)
                print("dataString = \(dataString)")
        }
    
    }
    
    
    
}
