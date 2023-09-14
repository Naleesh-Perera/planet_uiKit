//  HomeView.swift
//  Planet_uiKit
//  Created by Naleesh Jeffrey on 2023-09-14.

import UIKit
import RxSwift

class HomeVC: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    private var presenter = HomePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
    }
    
    private func setUpData(){
        tableView.register(UINib(nibName: "PlanetCell", bundle: nil), forCellReuseIdentifier: "planet_cell")
        tableView.delegate = self
        tableView.dataSource = self
        presenter.handleData {
            self.tableView.reloadData()
            self.loading.isHidden = true
        }
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.planets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planet_cell", for: indexPath) as! PlanetCell
        cell.setPlanetData(planet: presenter.planets[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.navigate(index: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
