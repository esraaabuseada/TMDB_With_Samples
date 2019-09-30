//
//  ActorsTableViewCell.swift
//  TMDB
//
//  Created by user on 9/30/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit
import SDWebImage

class ActorsTableViewCell: UITableViewCell {

  
    
    @IBOutlet weak var actorName: UILabel!
    @IBOutlet weak var actorImage: UIImageView!
   let placeHolderImage = UIImage(named: "AppIcon")
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configur(person : Person) {
        var  imageURL="https://image.tmdb.org/t/p/w500/" + person.profilePath!
        let url:URL = URL(string: imageURL)!
       actorImage.sd_setImage(with: url, placeholderImage: placeHolderImage)
        actorName.text = person.name
        // actorKnownfor.text = sub
    }
}
