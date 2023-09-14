//  PlanetStore.swift
//  Planet_uiKit
//  Created by Naleesh Jeffrey on 2023-09-14.

import Foundation
import RxSwift

class PlanetStore {
    
    static let shared = PlanetStore()
    private let disposeBag = DisposeBag()
    
    private var planetDataSubject = BehaviorSubject<PlanetData?>(value: nil)
    
    var planetData: Observable<PlanetData?> {
        return planetDataSubject.asObservable()
    }
    
    func fetchPlanetData() async{
        await Net.shared.fetchData(endPoint: .fetchPlanet)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] planetData in
                self?.planetDataSubject.onNext(planetData)
            }, onError: { error in
                print("Error fetching data: \(error)")
            })
            .disposed(by: disposeBag)
    }
}
