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
    
    var isNoMore = false
    
    private var allProducts = [ProductModel]()
    
    private var pageNumber = 20
        
    init() {
        loadAllProducts()
    }

    private func loadAllProducts() {
        
        guard let url = Bundle.main.url(forResource: "001", withExtension: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            guard let dataStr = String(data: data, encoding: .utf8) else {
                return
            }
            allProducts = [ProductModel].deserialize(from: dataStr, designatedPath: "results")?.compactMap { $0 } ?? []
        } catch {
            print(error)
        }
        print("products = \(products)")
    }
    
    func loadProducts(isLoadMore: Bool, completion: ((Bool) -> Void)? = nil) {
        /// 模拟网络数据
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.loadMockData(isLoadMore: isLoadMore, completion: completion)
        }
    }
    
    private func loadMockData(isLoadMore: Bool, completion: ((Bool) -> Void)? = nil) {
        
        defer {
            isNoMore = (!products.isEmpty && products.count == allProducts.count)
            completion?(isNoMore)
            
            print("products.count = \(products.count)")
            print("allProducts.count = \(allProducts.count)")
        }
        
        let totalNumber = allProducts.count
        if !isLoadMore { //下拉
            products = []
            
            for idx in 0..<pageNumber {
                let model = allProducts[idx]
                products.append(model)
            }
            
        } else { // 上拉
            if products.count == allProducts.count {
                return
            }
                                    
            let fromIndex = products.count
            let endIndex = fromIndex + pageNumber
            
            for idx in fromIndex..<endIndex {
                if idx >= totalNumber {
                    return
                }
                let model = allProducts[idx]
                products.append(model)
            }
        }
    }
    
}
