//
//  PartyRockCell.swift
//  PartyRock
//
//  Created by Mac on 10/21/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

class PartyRockCell: UITableViewCell {

    @IBOutlet var videoImage: UIImageView!
    @IBOutlet var videoName: UILabel!
 
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        
    }

 
    
    // used to update cell for each time it created
    
    func updateUI(partRock : PartyRock) {
    
    videoName.text = partRock.videoTitle
        
        let url = NSURL(string: partRock.imageURL)!
        
        let qualityOfServiceClass = QOS_CLASS_BACKGROUND
        
        dispatch_async(dispatch_get_global_queue(qualityOfServiceClass, 0)) {
            
            do {
                
                let imageData = NSData (contentsOfURL: url)
                
                dispatch_sync(dispatch_get_main_queue()) {
                    
                    self.videoImage.image = UIImage (data: imageData!)
                }
           
 
            } catch{
            
            print("error")
            
            }
            
    }
                
                

        
    videoImage.image = UIImage(named:partRock.imageURL)
 
    
    }

}
