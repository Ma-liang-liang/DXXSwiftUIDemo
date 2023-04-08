//
//  ProductViewModel.swift
//  SwifUIDemo
//
//  Created by 马亮亮 on 2023/4/8.
//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
        
    @Published var products: [ProductModel] = []
    
    func loadProducts() {
        
        guard let url = Bundle.main.url(forResource: "001", withExtension: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            guard let dataStr = String(data: data, encoding: .utf8) else {
                return
            }
            products = [ProductModel].deserialize(from: dataStr, designatedPath: "results")?.compactMap { $0 } ?? []
        } catch {
            print(error)
        }
        print("products = \(products)")
    }
    
}
