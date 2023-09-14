//  PlanetStore.swift
//  Planet_uiKit
//  Created by Naleesh Jeffrey on 2023-09-14.

import Foundation
import RxSwift

class PlanetStore {
    
    func getAllPlanets() async -> Observable<PlanetData> {
        
        return await Net.shared.fetchData(endPoint: .fetchPlanet)
            .map {
                return $0
            }
    }
}
