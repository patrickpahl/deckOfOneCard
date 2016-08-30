//
//  CardController.swift
//  deckOfOneCard829
//
//  Created by Patrick Pahl on 8/29/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import Foundation

//The parameters are after the '?' in a web address.

class CardController {
    
    static let baseURL = NSURL(string: "http://deckofcardsapi.com/api/deck/new/draw/")
    
    static func drawCards(numberOfCards: Int, completion: (cards: [Card]) -> Void) {
        
        guard let url = self.baseURL else { fatalError("URL optional is nil")}
        
        let urlParameters = ["count": "\(numberOfCards)"]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            
            if let data = data, responseDataString = NSString(data: data, encoding: NSUTF8StringEncoding){
                
                guard let responseDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject],
                
                    
                    
                cardDictionaries = responseDictionary["cards"] as? [[String: AnyObject]] else {
                    print("Unable to serialize JSON \(responseDataString)")
                    return}
                
                let cards = cardDictionaries.flatMap({ Card(dictionary: $0)})
                //flatMap: for each value in the array, make a new value.
                
//For Loop Alternative:
//                var cards: [Card] = []
//                for dictionary in cardDictionaries {
//                    let card = Card(dictionary: dictionary)
//                    cards.append(card)
//                }
                
                completion(cards: cards)
            } else {
                print("No data retrieved from network")
                completion(cards: [])
            }
            }
        }
    }
    
    