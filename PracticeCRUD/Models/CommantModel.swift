//
//  CommantModel.swift
//  CRUDPractice
//
//  Created by 박인서 on 2023/05/16.
//

import Foundation

struct Comment: Identifiable, Hashable, Codable {
    var id: UUID = .init()
    var commenter: User
    var content: String
}
