//
//  Card.swift
//  Concentration
//
//  Created by Andy Guinto on 12/29/19.
//  Copyright © 2019 Andy Guinto. All rights reserved.
//

import Foundation
import UIKit
// Struct = No inheritance, Value Types instead of Reference Types
class Card: UIButton
{
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    // Stored for the type, not each individual card.
    static func getUniqueIdentifier() -> Int
    {
        identifierFactory += 1
        return identifierFactory
    }
    
    required init(emoji: String)
    {
        self.identifier = Card.getUniqueIdentifier()
        
        super.init(frame: CGRect(x: 100, y: 100, width: 100, height: 150))
        self.backgroundColor = UIColor.orange
        self.setTitle(emoji, for: UIControl.State.normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

