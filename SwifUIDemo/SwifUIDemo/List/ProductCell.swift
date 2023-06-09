//
//  ProductCell.swift
//  DXXDemo
//
//  Created by 马亮亮 on 2023/4/7.
//

import SwiftUI

struct ProductCell: View {
    
    @ObservedObject var product: ProductModel
    
    var body: some View {
        cellBody
            .cornerRadius(12)
    }
    
    var cellBody: some View {
        HStack(spacing: 5) {
           
            leftView
           
            middleText
            
            Spacer()
            
            rightView
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            Color.white
         )
        .onTapGesture {
            product.isLike.toggle()
        }
    }

    var leftView: some View {
       
        ZStack {
            AsyncImage(url: URL(string: product.artworkUrl60)) { phase in
                if let image = phase.image {
                    image.resizable()
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .stroke(.gray.opacity(0.4), lineWidth: 2)
                        )
                } else if phase.error != nil {
                    Color.yellow
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
        VStack(alignment: .leading) {
            Text(product.artistName)
                .fontWeight(.medium)
                .font(.system(size: 24))
                .lineLimit(1)
            Spacer()
            Text(product.description)
                .fontWeight(.regular)
                .font(.body)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
        }
        .frame(height: 80)
    }
    
    var rightView: some View {
        ZStack {
            if product.isLike {
               Image(systemName: "heart.fill")
                     .resizable()
                     .frame(width: 20, height: 20)
                     .foregroundColor(Color.red)
             } else {
               Image(systemName: "heart")
                       .resizable()
                       .frame(width: 20, height: 20)
             }
        }
    }
}

struct ProductCell_Previews: PreviewProvider {
    
    static var previews: some View {
        ProductCell(product: getDefaultModel())
            .previewLayout(.sizeThatFits)
    }
    
    static func getDefaultModel() -> ProductModel {
        let model = ProductModel()
        model.artistName = "Google TCL"
        model.artworkUrl60 = "https://is1-ssl.mzstatic.com/image/thumb/Purple116/v4/fd/eb/12/fdeb12cb-b5be-4d9b-78ed-6aae49572b4b/logo_chat_2020q4_color-0-1x_U007emarketing-0-0-0-6-0-0-0-85-220-0.png/100x100bb.jpg"
        model.description = "Google Chat is an intelligent and secure communication and collaboration tool, built for teams. From ad-hoc messaging to topic-based workstream collaboration, Chat makes it easy to get work done where the conversation is happening.\n\n• Group collaboration that allows Google Workspace content creation and sharing (Docs, Sheets, Slides), without having to worry about granting permissions\n• Side by side editors, one click meetings, scheduling, document creation, and shared files, tasks, and events make it easy to get work done\n• Google search functionality, with options to filter for conversations and content that you’ve shared\n• Ready for Enterprise, with the full benefits of Google Workspace security and access controls including Data Loss Prevention, Compliance, Admin Settings, Vault Retention, Holds, Search, and Export"
        model.artistId = 111
        return model
    }
}

