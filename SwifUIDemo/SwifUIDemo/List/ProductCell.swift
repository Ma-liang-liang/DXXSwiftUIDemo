//
//  ProductCell.swift
//  DXXDemo
//
//  Created by 马亮亮 on 2023/4/7.
//

import SwiftUI

struct ProductCell: View {
    
    
    var body: some View {
        HStack {
            cellBody
                .cornerRadius(12)
//                .padding(.horizontal, 12)
//                .padding(.vertical, 10)
        }
        .background(
            Color.gray.opacity(0.1)
        )
    }
    
    
    var cellBody: some View {
        HStack(spacing: 10) {
            Image(systemName: "car")
                .resizable()
                .frame(width: 80, height: 80)
                .padding(.horizontal, 8)
                .padding(.vertical, 8)
                .background(Color.white)
                .cornerRadius(12)
            
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
            
            Spacer()
            
            Image(systemName: "heart")
                .resizable()
                .frame(width: 20, height: 20)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            Color.white
         )
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell()
            .previewLayout(.fixed(width: .infinity, height: 120))
        
    }
}
