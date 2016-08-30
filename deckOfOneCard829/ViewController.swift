//
//  ViewController.swift
//  deckOfOneCard829
//
//  Created by Patrick Pahl on 8/29/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - Outlet
    @IBOutlet weak var cardImageView: UIImageView!
    
    //MARK: - Action
    @IBAction func cardButtonTapped(sender: AnyObject) {
        
        CardController.drawCards(1) { (cards) in
         
            guard let card = cards.first else {return}
            
            ImageController.imageForURL(card.imageEndpoint, completion: { (image) in
                
                guard let image = image else {return}
                self.cardImageView.image = image
            })
        }
        
    }
    
    
    
}

