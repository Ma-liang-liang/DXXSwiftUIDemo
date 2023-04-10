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
    
    @State private var isLoadMore = false
    
    @State private var isNoMore = false
    
    var body: some View {

        ZStack {
            NavigationView {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.products, id: \.uuid) { product in
                            ProductCell(product: product)
                                .padding(.horizontal, 12)
                        }
                        PullUpLoadingView(isLoading: $isLoadMore, isNoMore: $isNoMore)
                            .frame(width: 360, height: 40)
                            .onAppear {
                                print("上拉加载更多")
                                isLoadMore = true
                                viewModel.loadProducts(isLoadMore: isLoadMore)
                            }
                    }
                }
                .refreshable {
                    print("下拉刷新")
                    isLoadMore = false
                    viewModel.loadProducts(isLoadMore: false)
                }
                .navigationTitle(navText)
                .background(
                    Color.gray.opacity(0.2)
                 )
                .onChange(of: viewModel.isNoMore, perform: { newValue in
                    print("isNoMore改变了\(newValue)")
                    isNoMore = newValue
                })

            }
            .navigationBarTitleDisplayMode(.inline)
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

