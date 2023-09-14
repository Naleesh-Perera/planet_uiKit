//  PlanetData.swift
//  Planet_uiKit
//  Created by Naleesh Jeffrey on 2023-09-14.

import Foundation

class PlanetData: Decodable,Encodable{
    
    let count: Int?
    let next: String
    let previous: String?
    let results: [Planet]
    
}
