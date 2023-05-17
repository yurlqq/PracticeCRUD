//
//  PostsView.swift
//  PracticeCRUD
//
//  Created by 박인서 on 2023/05/16.
//

import SwiftUI

struct PostsView: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.dismiss) private var dismiss
    
    let currentUser: User
    
    var body: some View {
        ZStack {
            Color(red: 0.9, green: 0.9, blue: 0.9)
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(modelData.posts.reversed()) { post in
                        PostView(
                            content: post.content,
                            post: post,
                            currentUser: currentUser
                        )
                    }
                }
            }
        }
        .navigationTitle(Text("\(currentUser.nickname)의 피드"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Button {
                        
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                    }
                    currentUser.image
                        .resizable()
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                        .offset(x: -15)
                }
                
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    withAnimation {
                        modelData.create(user: currentUser)
                    }
                } label: {
                    Text("새로 만들기")
                }
            }
        }
        
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView(currentUser: .init(imageName: "Cat", nickname: "행복한 고양이"))
            .environmentObject(ModelData())
    }
}
