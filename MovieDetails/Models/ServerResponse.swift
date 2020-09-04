//
//  ServerResponse.swift
//  MovieDetails
//
//  Created by Luna Abreu on 03/09/20.
//  Copyright © 2020 Luna IOS1. All rights reserved.
//

import UIKit

class ServerResponse  {
    
    var success : Bool = false
    
    var erroMessage : String = ""
    
    var statusCode : Int = 0
    
    var movie : Movie!
    
    var movies : [Movie] = []
    
    init() {
        
    }
    
}
