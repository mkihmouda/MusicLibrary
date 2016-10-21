//
//  ViewController.swift
//  PartyRock
//
//  Created by Mac on 10/19/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

class MainVC: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var partyRocks = [PartyRock]()
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.tableView.delegate = self
        self.tableView.dataSource = self
         
        // defin 3 partyRock Objects
        
        
        
        let p1 = PartyRock.init(imageURL: "https://i.ytimg.com/vi/CY2eP_Hceq4/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CY2eP_Hceq4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: " Mawlaya ")
        
        let p2 = PartyRock.init(imageURL: "https://s2.tunefiles.com/files/thumbs/2015/06/22/14349640408c940-original-6.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/eLFW---YSWE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Ya Nabi Salam Alayka")
        
        let p3 = PartyRock.init(imageURL: "http://indoflac.com/wp-content/uploads/2015/08/Maher-Zain.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/PACjNsQF0Z0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Insha Allah")
 
        
        // add 3 partyRock objects to prtyRock Array
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)

        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Override UITableView Methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return partyRocks.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        // if cell is not exist it will create it
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("PartyRockCell", forIndexPath: indexPath) as? PartyRockCell{
        
            cell.updateUI(partyRocks[indexPath.row])
            
            return cell
            
        }else{
        
            return UITableViewCell()
        
        }
        
   
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let partyRock = partyRocks[indexPath.row]
        
        performSegueWithIdentifier("videoVC", sender: partyRock)
 
    }
    
    
    // MARK: - Override Segue Methods
 

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if  let videoVC = segue.destinationViewController as? VideoVC {
        
            if let partyRockObj = sender as? PartyRock {
            
            
             videoVC.partyRock = partyRockObj
            
            }

        } 
        
    }
    
}

