//
//  PullUpLoadingView.swift
//  SwifUIDemo
//
//  Created by 马亮亮 on 2023/4/10.
//

import SwiftUI

struct PullUpLoadingView: View {
    
    @Binding var isLoading: Bool
    
    @Binding var isNoMore: Bool
    
    var body: some View {
       
        ZStack {
            if isLoading && !isNoMore {
                HStack(spacing: 10) {
                    ProgressView()
                    Text("is Loading")
                        .foregroundColor(.gray)
                        .font(.system(size: 18, weight: .regular))
                }
            }
            if isNoMore {
                Text("No More Data.")
                    .foregroundColor(.gray)
                    .font(.system(size: 18, weight: .regular))
            }
        }
    }
}

struct PullUpLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PullUpLoadingView(isLoading: .constant(true), isNoMore: .constant(false))
                .previewLayout(.sizeThatFits)
            PullUpLoadingView(isLoading: .constant(false), isNoMore: .constant(true))
                .previewLayout(.sizeThatFits)
        }
    }
}
