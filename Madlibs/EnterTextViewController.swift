//
//  EnterTextViewController.swift
//  Madlibs
//
//  Created by Maarten Brijker on 22/04/16.
//  Copyright © 2016 Maarten_Brijker. All rights reserved.
//

import UIKit

class EnterTextViewController: UIViewController {
    
    // An optional to indicate which story was selected.
    var selectedStory: Int?
    
    // An optional to indicate the file name.
    var fileName: String?
    
    // Instantiating an object of the Story class
    var someStory: Story = Story(stream: "string")
    
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var enterWordTextField: UITextField!
    @IBAction func submitWordButton(sender: AnyObject) {
        
        // Variable to hold the word user entered.
        let enteredWord = enterWordTextField.text
        
        // Fill in placeholder in placeholder array.
        if enteredWord != "" {
            someStory.fillInPlaceholder(enteredWord!)
        }
        
        // Display the next placeholder.
        let placeholder = someStory.getNextPlaceholder()
        wordLabel.text = placeholder
        
        // If all words are filled in, go to the next screen.
        if someStory.isFilledIn() {
            self.performSegueWithIdentifier("showShowTextViewController", sender: self)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Clear previous story.
        someStory.clear()
        
        // Set the screen title.
        self.title = "Input Text"

        // Set the selected story.
        if selectedStory == 0 {
            fileName = "madlib0_simple"
        }
        else if selectedStory == 1 {
            fileName = "madlib1_tarzan"
        }
        else if selectedStory == 2 {
            fileName = "madlib2_university"
        }
        else if selectedStory == 3 {
            fileName = "madlib3_clothes"
        }
        else if selectedStory == 4 {
            fileName = "madlib4_dance"
        }
        
        // Input the stream.
        if fileName != nil {
            let fileLocation = NSBundle.mainBundle().pathForResource(fileName, ofType: "txt")
            let content = try? String(contentsOfFile: fileLocation!, encoding: NSUTF8StringEncoding)
            someStory = Story(stream: content!)
        }
       
        
        // Display placeholder type.
        let placeholder = someStory.getNextPlaceholder()
        wordLabel.text = placeholder
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Send array of placeholders to next screen.
        let wordSubmitted = segue.destinationViewController as! ShowTextViewController
        wordSubmitted.kopie = someStory
        
    }

}





