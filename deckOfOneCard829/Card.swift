//
//  Card.swift
//  deckOfOneCard829
//
//  Created by Patrick Pahl on 8/29/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import Foundation

//image is a string bc its json

class Card {
    
    private let imageKey = "image"
    private let valueKey = "value"
    private let suitKey = "suit"
    
    let imageEndpoint: String
    let value: String
    let suit: String
    
    init?(dictionary: [String: AnyObject]) {
        
        guard let imageEndpoint = dictionary[imageKey] as? String, value = dictionary[valueKey] as? String, suit = dictionary[suitKey] as? String else {return nil}
        
        self.imageEndpoint = imageEndpoint
        self.value = value
        self.suit = suit
        
    }
    
}