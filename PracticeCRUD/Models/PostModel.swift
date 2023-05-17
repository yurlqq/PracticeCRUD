//
//  PostModel.swift
//  CRUDPractice
//
//  Created by 박인서 on 2023/05/16.
//

import Foundation
import SwiftUI



struct Post: Codable, Identifiable, Hashable {
    var id: UUID = .init()
    var poster: User
    var content: String
    var comments: [Comment] = .init()
}
