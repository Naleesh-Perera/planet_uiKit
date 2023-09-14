//  HomePresenter.swift
//  Planet_uiKit
//  Created by Naleesh Jeffrey on 2023-09-15.

import RxSwift

class HomePresenter{
    
    var planets: [Planet] = []
    private let disposeBag: DisposeBag = DisposeBag()
    
    func handleData(_ callBack: @escaping ()->()){
        PlanetStore.shared.planetData
            .compactMap { $0 }
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {planetData in
                self.planets = planetData.results
                callBack()
            })
            .disposed(by: disposeBag)
    }
    
    func navigate(index:Int){
        Router.shared.pushViewController(PlanetDetailVC.create(planet: planets[index]))
    }
}
