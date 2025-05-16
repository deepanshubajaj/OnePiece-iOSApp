//
//  Arc.swift
//  OnePiece
//
//  Created by Deepanshu Bajaj on 16/05/25.
//

import Foundation

struct Arc: Identifiable, Codable {
    var id: Int // Use UUID to conform to Identifiable
    let name: String
    let straw_hats: [String]
    let details: String
}
