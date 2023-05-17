//
//  UserModel.swift
//  CRUDPractice
//
//  Created by 박인서 on 2023/05/16.
//
import SwiftUI
import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var posts: [Post] = []
    
    func edit(post: Post, _ content: String) {
        posts[posts.firstIndex { $0.id == post.id }!].content = content
    }
    
    func delete(post: Post) {
        posts.remove(at: posts.firstIndex { $0.id == post.id }!)
    }
    func create(user: User) {
        posts.append(.init(poster: user, content: ""))
    }
}

let users: [User] = [
    User(imageName: "Dog", nickname: "사랑스러운 강아지"),
    User(imageName: "Cat", nickname: "똑똑한 고양이"),
    User(imageName: "Tiger", nickname: "용맹한 호랑이"),
    User(imageName: "Polarbear", nickname: "푸근한 북극곰"),
    User(imageName: "Goose", nickname: "친절한 거위"),
]

struct User: Codable, Hashable, Identifiable {
    var id: UUID = .init()
    var imageName: String
    var nickname: String
    
    var image: Image {
        return Image(imageName)
    }
}

