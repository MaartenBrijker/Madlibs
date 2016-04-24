//
//  DisplayStoriesViewController.swift
//  Madlibs
//
//  Created by Maarten Brijker on 22/04/16.
//  Copyright © 2016 Maarten_Brijker. All rights reserved.
//

import UIKit

class DisplayStoriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // List of stories.
    let stories = ["Simple", "Tarzan", "University", "Clothes", "Dance"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the screen title.
        self.title = "Select Story"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Check which story was selected?
        let selectedIndex = self.tableView.indexPathForCell(sender as! StoryCell)
        
        let sending = segue.destinationViewController as! EnterTextViewController
        sending.selectedStory = selectedIndex!.row
    }


}

extension DisplayStoriesViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // Display as much rows as there are stories
        return stories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        // Create cells.
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! StoryCell
        cell.storyLabel?.text = self.stories[indexPath.row]
        return cell
    }
}