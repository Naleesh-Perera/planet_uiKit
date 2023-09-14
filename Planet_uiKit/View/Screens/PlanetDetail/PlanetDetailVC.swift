//  PlanetDetailVC.swift
//  Planet_uiKit
//  Created by Naleesh Jeffrey on 2023-09-14.

import UIKit

class PlanetDetailVC: UIViewController {
    
    var planet: Planet!
    
    static func create(planet:Planet) -> PlanetDetailVC {
        let stry = UIStoryboard.init(name: "PlanetDetail", bundle: nil)
        let vc = stry.instantiateViewController(withIdentifier: "planet_detail_vc") as! PlanetDetailVC
        vc.planet = planet
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
