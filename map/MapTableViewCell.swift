//
//  MapTableViewCell.swift
//  map
//
//  Created by Ivan Ermak on 22.03.2018.
//  Copyright © 2018 Ivan Ermak. All rights reserved.
//

import UIKit

class MapTableViewCell: UITableViewCell {
    @IBOutlet weak var CountryView: UILabel!
    @IBOutlet weak var GeoCode: UILabel!
    @IBOutlet weak var FlagView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
