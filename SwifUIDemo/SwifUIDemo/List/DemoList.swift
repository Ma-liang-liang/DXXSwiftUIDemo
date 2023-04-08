//
//  DemoList.swift
//  SwiftUI-FeaturesDemo
//
//  Created by 马亮亮 on 2023/4/6.
//

import SwiftUI
import Combine

struct DemoList: View {
    
    @StateObject private var viewModel = ProductViewModel()
        
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {

        ZStack {
            NavigationView {
                GeometryReader { proxy in
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.products, id: \.uuid) { product in
                                ProductCell(product: product)
                                    .padding(.horizontal, 12)
                            }
                        }
                    }
                    .navigationTitle(navText)
                    .background(
                        Color.gray.opacity(0.2)
                     )
                    .onAppear {
                        viewModel.loadProducts()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.large)
        }
        .edgesIgnoringSafeArea(.top)
        
    }
    
    var navText: Text {
        Text("APP")
            .font(.system(size: 42, weight: .semibold))
    }
}


struct DemoList_Previews: PreviewProvider {
    static var previews: some View {
        DemoList()
    }
}

