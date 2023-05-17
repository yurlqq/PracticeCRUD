//
//  ContentView.swift
//  PracticeCRUD
//
//  Created by 박인서 on 2023/05/16.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.9, green: 0.9, blue: 0.9)
                    .ignoresSafeArea()
                VStack(spacing: 15) {
                    Text("로그인할 동물 선택하기")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    ForEach(users) { user in
                        NavigationLink {
                            PostsView(currentUser: user)
                        } label: {
                            UserRowView(user: user)
                        }
                        .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
