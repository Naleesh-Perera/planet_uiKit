//  PlanetCell.swift
//  Planet_uiKit
//  Created by Naleesh Jeffrey on 2023-09-14.

import UIKit
import SDWebImage

class PlanetCell: UITableViewCell {
    
    var planet: Planet!
    
    @IBOutlet weak var planetImg: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var climate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        planetImg.layer.cornerRadius = planetImg.frame.size.width / 2
        planetImg.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setPlanet(planet: Planet){
        self.planetImg.sd_setImage(with: URL(string: "https://picsum.photos/200"))
        self.title.text = planet.name
        self.climate.text = planet.climate
    }
    
}
