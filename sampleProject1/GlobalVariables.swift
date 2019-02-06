//
//  GlobalVariables.swift
//  sampleProject1
//
//  Created by Jayaram G on 21/01/19.
//  Copyright © 2019 Jayaram G. All rights reserved.
//

import Foundation

class GlobalVariables {
    
    
    var Something:String?
    
    
    
    
    
    class var sharedManager: GlobalVariables {
        struct Static {
            static let instance = GlobalVariables()
        }
        return Static.instance
    }
}
