//
//  ProductModel.swift
//  DXXDemo
//
//  Created by 马亮亮 on 2023/4/7.
//

import SwiftUI
import HandyJSON

class ProductModel: ObservableObject, HandyJSON {
    
//    let uuid = UUID().uuidString
    
    var artistId = 0
    
    var artworkUrl60 = ""
    
    var artistName = ""
    
    var description = ""
    
    var kind = ""
    
    @Published var isLike = false
    
    required init() {}
    
    static func getDefaultModel() -> ProductModel {
        
        let model = ProductModel()
        model.artistId = Int.random(in: 0...10000)
        model.artworkUrl60 = "https://is1-ssl.mzstatic.com/image/thumb/Purple116/v4/fd/eb/12/fdeb12cb-b5be-4d9b-78ed-6aae49572b4b/logo_chat_2020q4_color-0-1x_U007emarketing-0-0-0-6-0-0-0-85-220-0.png/60x60bb.jpg"
        model.artistName = "Google LLC"
        model.description = "Google Chat is an intelligent and secure communication and collaboration tool, built for teams. From ad-hoc messaging to topic-based workstream collaboration, Chat makes it easy to get work done where the conversation is happening.\n\n• Group collaboration that allows Google Workspace content creation and sharing (Docs, Sheets, Slides), without having to worry about granting permissions\n• Side by side editors, one click meetings, scheduling, document creation, and shared files, tasks, and events make it easy to get work done\n• Google search functionality, with options to filter for conversations and content that you’ve shared\n• Ready for Enterprise, with the full benefits of Google Workspace security and access controls including Data Loss Prevention, Compliance, Admin Settings, Vault Retention, Holds, Search, and Export"
        return model
    }
}

