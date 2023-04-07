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
            NavigationView {
                ScrollView {
                    LazyVStack {
                        ForEach(0 ..< 12) { index in
                            ProductCell()
                                .padding(.horizontal, 12)
                        }
                    }
                }
                .navigationTitle(navText)
                .background(
                    Color.gray.opacity(0.2)
                )
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

