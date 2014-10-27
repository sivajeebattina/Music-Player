//
//  SongsListTable.swift
//  MusicPlayer
//
//  Created by pcs20 on 10/27/14.
//  Copyright (c) 2014 Paradigmcreatives. All rights reserved.
//

import UIKit

class SongsListTable: UITableViewController {
    
    
    var musicNames:NSArray=["bell","piano","organ","voiceOver","bell","organ"]
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return musicNames.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("songs", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel?.text=musicNames[indexPath.row] as NSString
        cell.imageView?.image=UIImage(named: "music.ico")

        return cell
    }
    

       // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        var musicPlayer:MusicPlayerViewController=segue.destinationViewController as MusicPlayerViewController
        var selectedIndex:NSIndexPath=self.tableView.indexPathForSelectedRow()!
        
        musicPlayer.songName=musicNames[selectedIndex.row] as NSString
       
    }
    

}
