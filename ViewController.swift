//
//  ViewController.swift
//  Concentration
//
//  Created by Andy Guinto on 12/24/19.
//  Copyright © 2019 Andy Guinto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Main Class.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Change background color to black.
        self.view.backgroundColor = .black

        NewGame()
    }
    // Global Variables.
    var cards = [UIButton]()
    var cardStackView = UIStackView()
    
    var flipCountLabel = UILabel(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
    
    var flipCount: NSInteger = 0
    {
        // Called everytime flipCount is updated.
        didSet
        {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    
    fileprivate func NewGame()
    {
        setupCards()
        setupFlipCountLabel()
    }
    
    
    fileprivate func setupFlipCountLabel()
    {
        flipCount = 0
        
        // Must be added to subview before adding constraints.

        flipCountLabel.text = "Flips: \(flipCount)"
        flipCountLabel.font = flipCountLabel.font.withSize(50)
        flipCountLabel.textColor = UIColor.orange

        self.view.addSubview(flipCountLabel)

        // Enables auto layout for view.
        flipCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Constraints.
        // Make sure the top does not overlap the Cards.
        flipCountLabel.topAnchor.constraint(equalTo: cardStackView.bottomAnchor).isActive = true
        
        flipCountLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true

        flipCountLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
    fileprivate func setupCards()
    {
        let emojis = ["☠️", "👽", "☠️", "👽"]
        for e in emojis
        {
            createCard(emoji: e)
            print(e)
            print(cards.count)
        }
        
        // Align the cards evenly.
        cardStackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(cardStackView)
        
        // Constraints.
        // Make sure the bottom does not overlap the Flip Count Label.
//        cardStackView.bottomAnchor.constraint(equalTo: flipCountLabel.bottomAnchor).isActive = true
        
        cardStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        
        cardStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true

        cardStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        
        // Padding on the edges..
        cardStackView.isLayoutMarginsRelativeArrangement = true
        cardStackView.layoutMargins = UIEdgeInsets(top: 50, left: 20, bottom: 0, right: 20)
        
        // Equal spacing between each card.
        cardStackView.distribution = UIStackView.Distribution.equalSpacing
        cardStackView.alignment = UIStackView.Alignment.top
    }
    
    
    fileprivate func createCard(emoji: String)
    {
        let card = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 150))
        
        card.backgroundColor = UIColor.orange
        card.setTitle(emoji, for: UIControl.State.normal)
        card.addTarget(self, action: #selector(FlipCard), for: .touchUpInside)
        
        cards.append(card)
        cardStackView.addArrangedSubview(card)

    }
    
    
    @objc func FlipCard(sender: UIButton!)
    {
        flipCount += 1
        let card: UIButton = sender
        
        if card.backgroundColor == UIColor.white
        {
            card.backgroundColor = UIColor.orange
            print("Changing to black.")
        }
        else
        {
            card.backgroundColor = UIColor.white
            print("Changing to white.")
        }
    }

    
}

