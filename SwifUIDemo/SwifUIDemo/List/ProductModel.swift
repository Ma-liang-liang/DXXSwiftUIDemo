//
//  ProductModel.swift
//  DXXDemo
//
//  Created by 马亮亮 on 2023/4/7.
//

import SwiftUI

class ProductModel: ObservableObject {
    
//    let uuid = UUID().uuidString
    
    var artistId = 0
    
    var artworkUrl60 = ""
    
    var artistName = ""
    
    var description = ""
    
    var kind = ""
    
    @Published var isLike = false
}

func loadAppList() -> [ProductModel]? {
    
    guard let url = Bundle.main.url(forResource: "001", withExtension: "json") else {
        return nil
    }
    do {
        let data = try Data(contentsOf: url)
        let jsonDecoder = JSONDecoder()
       
    } catch {
        print(error)
    }
    
    return nil
}
