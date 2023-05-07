//
//  RickyandMorty.swift
//  RickandMorty
//
//  Created by Anton Akhmedzyanov on 06.05.2023.
//

import Foundation

struct RickyandMorty: Decodable {
    let name: String
    let type: String
    let gender: String
    let location: Place
    let image: URL
    let episode: [URL]
}

struct Place: Decodable {
    let name: String
    let url: URL
}

