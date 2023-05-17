//
//  UserRowView.swift
//  PracticeCRUD
//
//  Created by 박인서 on 2023/05/16.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    
    var body: some View {
        HStack {
            user.image
                .resizable()
                .frame(width: 65, height: 65)
                .clipShape(Circle())
            Spacer()
            Text(user.nickname)
                .font(.title)
        }
        .padding(10)
        .background(.white)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(
            user: User(imageName: "Dog", nickname: "사랑스러운 강아지")
        )
    }
}
