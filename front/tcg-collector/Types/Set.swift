//
//  Set.swift
//  tcg-collector
//
//  Created by Pierre Guéroult on 01/11/2024.
//

import Foundation

struct Set: Codable {
    let id: String
    let name: String
    let series: String
    let printedTotal: Int
    let total: Int
    let legalities: Legalities
    let ptcgoCode: String
    let releaseDate: String
    let updatedAt: String
    let images: Images
    
    struct Legalities: Codable {
        let unlimited: String
        let standard: String
        let expanded: String
    }
    
    struct Images: Codable {
        let logo: String
        let symbol: String
    }
}

struct SetResponse: Codable {
    let count: Int
    let data: [Set]
    let page: Int
    let pageSize: Int
}
