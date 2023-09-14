//  PlanetDetailVC.swift
//  Planet_uiKit
//  Created by Naleesh Jeffrey on 2023-09-14.

import UIKit
import SDWebImage

class PlanetDetailVC: UIViewController {
    
    var planet: Planet!
    
    @IBOutlet weak var planetImg: UIImageView!
    @IBOutlet weak var planetName: UILabel!
    @IBOutlet weak var planetOrbitPeriod: UILabel!
    @IBOutlet weak var planetGravity: UILabel!
    
    static func create(planet:Planet) -> PlanetDetailVC {
        let stry = UIStoryboard.init(name: "PlanetDetail", bundle: nil)
        let vc = stry.instantiateViewController(withIdentifier: "planet_detail_vc") as! PlanetDetailVC
        vc.planet = planet
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPlanetData()
    }
    
    func setPlanetData(){
        planetImg.layer.cornerRadius = 15
        planetImg.clipsToBounds = true
        self.planetImg.sd_setImage(with: URL(string: "https://picsum.photos/200"))
        self.planetName.text = Const.planetText+planet.name
        self.planetOrbitPeriod.text = Const.planetOrbitalPeriod+planet.orbitalPeriod
        self.planetGravity.text = Const.planetGravity+planet.gravity
    }
    
}
