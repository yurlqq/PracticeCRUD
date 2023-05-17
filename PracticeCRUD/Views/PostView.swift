//
//  PostView.swift
//  PracticeCRUD
//
//  Created by 박인서 on 2023/05/16.
//

import SwiftUI

struct PostView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State var content: String
    @State var isEditing: Bool = false
    
    let post: Post
    let currentUser: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                post.poster.image
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Text(post.poster.nickname)
                Spacer()
                if isEditing {
                    Button {
                        modelData.edit(post: post, content)
                        isEditing.toggle()
                    } label: {
                        Text("완료")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .hide(when: currentUser.id != post.poster.id)
                } else {
                    Button {
                        isEditing.toggle()
                    } label: {
                        Text("수정")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.black)
                    .hide(when: currentUser.id != post.poster.id)
                }
                

                
                Button {
                    withAnimation {
                        modelData.delete(post: post)
                    }
                } label: {
                    Text("삭제")
                        .fontWeight(.bold)
                    
                }
                .foregroundColor(.black)
                .hide(when: currentUser.id != post.poster.id)
            }
            if isEditing {
                TextField("마음껏 글을 써봐요!", text: $content, axis: .vertical)
                    .background(Color(.secondarySystemBackground))
            } else {
                Text(content)
            }
        }
        
        .padding()
        .background(Color.white)
    }
}

extension View {
    @ViewBuilder func hide(when condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0 : 1)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView(currentUser: .init(imageName: "Cat", nickname: "행복한 고양이"))
            .environmentObject(ModelData())
    }
}
