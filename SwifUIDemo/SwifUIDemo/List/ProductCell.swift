//
//  ProductCell.swift
//  DXXDemo
//
//  Created by 马亮亮 on 2023/4/7.
//

import SwiftUI

struct ProductCell: View {
    
//    let product: ProductModel
    
    var body: some View {
        HStack {
            cellBody
                .cornerRadius(12)
        }
    
    }
    
    var cellBody: some View {
        HStack(spacing: 10) {
           
            leftView
           
            middleText
            
            Spacer()
           
            rightView
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            Color.green.opacity(0.4)
         )
    }
    let urlStr = "https://is1-ssl.mzstatic.com/image/thumb/Purple116/v4/fd/eb/12/fdeb12cb-b5be-4d9b-78ed-6aae49572b4b/logo_chat_2020q4_color-0-1x_U007emarketing-0-0-0-6-0-0-0-85-220-0.png/100x100bb.jpg"
    var leftView: some View {
       
        ZStack {
            AsyncImage(url: URL(string: urlStr)) { phase in
                if let image = phase.image {
                    image.resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                 .stroke(.orange, lineWidth: 2)
                                    
                        )
                } else if phase.error != nil {
                    Color.yellow
                        .frame(width: 80, height: 80)
                } else {
                    ProgressView()
                }
            }
        }
        .frame(width: 80, height: 80)
        .background(
            Color.white
        )
        .cornerRadius(12)

    }
    
    var middleText: some View {
        VStack {
            Text("Google LLC Hello, World!")
                .fontWeight(.medium)
                .font(.system(size: 24))
                .lineLimit(1)
                .padding(.bottom, 4)
            
            Text("Google Chat is an intelligent and secure communication and collaboration tool, built for teams. From ad-hoc messaging to topic-based workstream collaboration, Chat makes it easy to get work done where the conversation is happening.\n\n• Group collaboration that allows Google Workspace content creation and sharing (Docs, Sheets, Slides), without having to worry about granting permissions\n• Side by side editors, one click meetings, scheduling, document creation, ")
                .fontWeight(.regular)
                .font(.body)
                .lineLimit(2)
        }
    }
    
    var rightView: some View {
        Image(systemName: "heart")
            .resizable()
            .frame(width: 20, height: 20)
    }
}

struct ProductCell_Previews: PreviewProvider {
    
    static var previews: some View {
        ProductCell()
            .previewLayout(.fixed(width: .infinity, height: 120))
        
    }
}

