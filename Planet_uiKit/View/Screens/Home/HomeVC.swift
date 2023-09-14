//  HomeView.swift
//  Planet_uiKit
//  Created by Naleesh Jeffrey on 2023-09-14.

import UIKit
import RxSwift

class HomeVC: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    private let disposeBag = DisposeBag()
    private let planetStore = PlanetStore()
    private var planets: [Planet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
    }
    
    func setUpData(){
        tableView.register(PlanetCell.self, forCellReuseIdentifier: "planet_cell")
        tableView.register(UINib(nibName: "PlanetCell", bundle: nil), forCellReuseIdentifier: "planet_cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        Task(priority: .high) {
            await self.planetStore.getAllPlanets()
                .map { planets in
                    return planets.results.map {$0}
                }
                .observe(on: MainScheduler.instance)
                .subscribe(onNext: { [weak self] planets in
                    self?.planets = planets
                    self?.tableView.reloadData()
                    self?.loading.isHidden.toggle()
                })
                .disposed(by: self.disposeBag)
        }
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planet_cell", for: indexPath) as! PlanetCell
        cell.setPlanet(planet: planets[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50 + 10.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(PlanetDetailVC.create(planet: planets[indexPath.row]), animated: true)
    }
}
