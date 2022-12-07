//
//  CafeClass.swift
//  Cafree
//
//  Created by 박승찬 on 2022/12/06.
//

import UIKit

class CafeClass {
    var cafeName = "sampleName"
    var cafeImg = "sampleCafeImg1"
    var cafeInfo = "sampleInfo"
    var cafeLocal = "sampleLocal"
    var cafeDis = 0.0
    
    init(name: String, img: String, info: String, local: String, dis: Double) {
        self.cafeName = name
        self.cafeImg = img
        self.cafeInfo = info
        self.cafeLocal = local
        self.cafeDis = dis
    }
}
