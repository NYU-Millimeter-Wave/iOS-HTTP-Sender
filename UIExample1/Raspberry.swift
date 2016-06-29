//
//  Raspberry.swift
//  UIExample1
//
//  Created by Aurélien Le Floc'h on 23/06/16.
//  Copyright © 2016 Aurélien Le Floc'h. All rights reserved.
//

import UIKit
import Alamofire


class Raspberry: NSObject {
	// Attribut
	var ipadress: String = " "
	
	
	// Constructeur
	init(ipadress: String) {
        super.init()
		self.ipadress = ipadress
	}
    
    
	
}
