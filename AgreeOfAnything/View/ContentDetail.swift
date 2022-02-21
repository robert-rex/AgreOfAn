//
//  ContentDetail.swift
//  AgreeOfAnything
//
//  Created by Vladimir A. Kraev on 05.07.2021.
//

import SwiftUI


struct ContentDetail: View {
    
    var content: Content
    var selected: Variant
    
    var body: some View {
        
        //        Контейрер представления
        
        ZStack{
            Color("background")
                .ignoresSafeArea()
                
            VStack(alignment: .leading) {
                
                Text(content.chapter)
                    .fontWeight(.light)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                //        Название книги
                
                Text("Договорится можно обо всем")
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.9794914126, green: 0.3892467618, blue: 0.01223743614, alpha: 1)))
                Spacer()
                Text(content.chapterTitle)
                    .font(.title3)
                    .foregroundColor(Color.black)
                
                Divider()
                
                
                //         Контейнер вывода ответов
                
                HStack(spacing: 5){
                    Text("\(selected.result)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 0.9794914126, green: 0.3892467618, blue: 0.01223743614, alpha: 1)))
                    Spacer()
                }
                
                ScrollView{
                    HStack(spacing: 5){
                        Text("\(selected.discription)")
                            .font(.title2)
                        Spacer()
                    }
                }
            }
            .padding()
            .padding()
        }
    }

    
}

struct ContentDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetail(content: contents[0], selected: contents[0].ask[0].variants[0])
        
    }
}

