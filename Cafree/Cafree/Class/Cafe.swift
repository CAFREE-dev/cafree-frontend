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
    let mapUrl: String
    let liceCount: String
    let preview: String
    let isMarked: String
    let sido: String
    let sigungu: String
    let eupmyun: String
    let dong: String
    let buildNo: String
    let branch: String
    let latitude: Float
    let longitude: Float
    let distance: Float
  
  enum CodingKeys: String, CodingKey {
    //case id = "episode_id"
    case id
    case title
    case mapUrl
    case liceCount
    case preview
    case isMarked
    case sido
    case sigungu
    case eupmyun
    case dong
    case buildNo
    case branch
    case latitude
    case longitude
    case distance
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
