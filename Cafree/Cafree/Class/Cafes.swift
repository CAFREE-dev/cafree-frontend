//
//  Cafes.swift
//  Cafree
//
//  Created by 박승찬 on 2023/01/18.
//

import Foundation
struct Cafes: Decodable {
    let title: String
    let userId: Int
  
  enum CodingKeys: String, CodingKey {
    case title
    case userId
  }
}
