//
//  Card.swift
//  tcg-collector
//
//  Created by Pierre Guéroult on 01/11/2024.
//

import Foundation

struct Card: Codable {
    let id: String
    let name: String
    let superType: String?
    let subTypes: [String]?
    let level: String?
    let hp: String
    let types: [String]?
    let evolvesFrom: String?
    let evolvesTo: [String]?
    let rules: [String]?
    let ancientTrait: [AncientsTrait]?
    let abilities: [Ability]?
    let attacks: [Attack]?
    let weaknesses: [Weakness]?
    let resistances: [Resistance]?
    let retreatCost: [String]?
    let convertedRetreatCost: Int
    let set: Set
    let number: String
    let artist: String
    let rarity: String
    let flavorText: String?
    let nationalPokedexNumbers: [Int]?
    let legalities: Legalities
    let regulationMark: String
    let images: Images
    let tcgPlayer: TcgPlayer?
    let cardMarket: CardMarket?
    
    struct AncientsTrait: Codable {
        let name: String
        let text: String
    }

    struct Ability: Codable {
        let name: String
        let text: String
        let type: String
    }

    struct Attack: Codable {
        let cost: [String]
        let name: String
        let text: String
        let damage: String
        let convertedEnergyCost: Int
    }

    struct Weakness: Codable {
        let type: String
        let value: String
    }

    struct Resistance: Codable {
        let type: String
        let value: String
    }

    struct Legalities: Codable {
        let standard: String
        let expanded: String
        let unlimited: String
    }

    struct Images: Codable {
        let small: String
        let large: String
    }

    struct TcgPlayer: Codable {
        let url: String
        let updatedAt: String
        let prices: TcgPrices?
    }

    struct TcgPrices: Codable {
        let low: Double
        let mid: Double
        let high: Double
        let market: Double
        let directLow: Double
    }

    struct CardMarket: Codable {
        let url: String
        let updatedAt: String
        let prices: CardMarketPrices?
    }

    struct CardMarketPrices: Codable {
        let averageSellPrice: Double
        let lowPrice: Double
        let trendPrice: Double
        let germanProLow: Double
        let suggestedPrice: Double
        let reverseHoloSell: Double
        let reverseHoloLow: Double
        let reverseHoloTrend: Double
        let lowPriceExPlus: Double
        let avg1: Double
        let avg7: Double
        let avg30: Double
        let reverseHoloAvg1: Double
        let reverseHoloAvg7: Double
        let reverseHoloAvg30: Double
    }
}

struct CardResponse: Codable {
    let count: Int
    let data: [Card]
    let page: Int
    let pageSize: Int
}
