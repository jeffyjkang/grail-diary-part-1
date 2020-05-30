//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Jeff Kang on 5/30/20.
//  Copyright © 2020 Jeff Kang. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        if let poi = poi {
            locationLabel.text = poi.location
            countryLabel.text = poi.country
            cluesCountLabel.text = "\(poi.clues.count) clues"
            
        }
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
