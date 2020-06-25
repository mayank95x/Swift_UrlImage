//
//  DogApi.swift
//  dogRandom
//
//  Created by mayank bhoria on 25/06/20.
//  Copyright © 2020 mayank bhoria. All rights reserved.
//

import Foundation

class DogApi{
    
    enum Endpoint:String {
        case randomDogImage="https://dog.ceo/api/breeds/image/random"
     
    
    var url:URL{
        
        return URL(string: self.rawValue  )!
        
        
    }
    
    }
}
