//
//  CafeClass.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/06.
//

import UIKit

struct Cafe: Decodable {
  let id: Int
  let title: String
  let openingCrawl: String
  let director: String
  let producer: String
  let releaseDate: String
  let starships: [String]
  
  enum CodingKeys: String, CodingKey {
    case id = "episode_id"
    case title
    case openingCrawl = "opening_crawl"
    case director
    case producer
    case releaseDate = "release_date"
    case starships
  }
}


//class CafeClass {
//    var cafeName = "sampleName"
//    var cafeImg = "sampleCafeImg1"
//    var cafeInfo = "sampleInfo"
//    var cafeLocal = "sampleLocal"
//    var cafeDis = 0.0
//
//    init(name: String, img: String, info: String, local: String, dis: Double) {
//        self.cafeName = name
//        self.cafeImg = img
//        self.cafeInfo = info
//        self.cafeLocal = local
//        self.cafeDis = dis
//    }
//}
