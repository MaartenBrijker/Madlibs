//
//  ShowTextViewController.swift
//  Madlibs
//
//  Created by Maarten Brijker on 22/04/16.
//  Copyright © 2016 Maarten_Brijker. All rights reserved.
//

import UIKit

class ShowTextViewController: UIViewController {
    
    // Copy of the someStory class.
    var kopie: Story?
    
    @IBOutlet weak var finalTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the screen title.
        self.title = "LOL HAHA LOL"
        
        // Display resulting story.
        finalTextLabel.text = kopie!.toString()
        
        // Adjsut font size to fit the width of the screen.
        finalTextLabel.adjustsFontSizeToFitWidth = true
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}