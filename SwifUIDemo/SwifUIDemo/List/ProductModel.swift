//
//  ProductModel.swift
//  DXXDemo
//
//  Created by 马亮亮 on 2023/4/7.
//

import SwiftUI
import HandyJSON

class ProductModel: ObservableObject, HandyJSON, Identifiable {
    
    let uuid = UUID().uuidString
    
    var artistId = 0
    
    var artworkUrl60 = ""
    
    var artistName = ""
    
    var description = ""
    
    var kind = ""
    
    @Published var isLike = false
    
    required init() {}
}

