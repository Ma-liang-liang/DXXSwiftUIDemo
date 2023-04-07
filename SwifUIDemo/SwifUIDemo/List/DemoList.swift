//
//  DemoList.swift
//  SwiftUI-FeaturesDemo
//
//  Created by 马亮亮 on 2023/4/6.
//

import SwiftUI
import Combine

struct DemoList: View {
    
//    @ObservedObject private var products: [ProductModel] = []
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {

        ZStack {
            
            Color.gray.opacity(0.1)
            
            List {
                ForEach(0 ..< 12) { index in
                    ProductCell()
                        .background(
                            Color.yellow
                        )
                }
            }
            .listRowSeparator(.hidden)
            .listStyle(.plain)
            .background(
                Color.green
            )
            .onAppear {
                
                
            }
            
        }
        
    }
}


struct DemoList_Previews: PreviewProvider {
    static var previews: some View {
        DemoList()
    }
}

