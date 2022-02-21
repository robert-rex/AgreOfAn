//
//  AnswerRow.swift
//  AgreeOfAnything
//
//  Created by Vladimir A. Kraev on 09.08.2021.
//

import SwiftUI

struct AnswerRow: View {
    var content: Content
    
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            
        TabView {
            
            ForEach(content.ask, id: \.self) { test in
               let page = content.ask.count

                
                VStack {
                    HStack{
                        Text(content.testNumber)
                            .fontWeight(.bold)
                            .font(.title)
                            .multilineTextAlignment(.leading)
                    }
                    
                    ScrollView(showsIndicators: false){
                        HStack{
                            Text("\(test.title)")
                                .font(.title2)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .lineSpacing(10.0)
                                
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("Выберите ответ: \(page)")
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(test.variants, id: \.self) { i in
                                
                                NavigationLink(
                                    destination: ContentDetail(content: content, selected: i),
                                    label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(lineWidth: 3)
                                                .foregroundColor(.white)
                                            VStack(alignment: .leading){
                                                HStack(spacing: 0.0){
                                                    
                                                    Text("Ответ к вопросу \(i.code)")
                                                        .font(.title3)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                        .multilineTextAlignment(.leading)
                                                        .padding(.horizontal)
                                                        .padding(.bottom, 3)
                                                    
                                                    
                                                }
                                                
                                                
                                                VStack{
                                                    
                                                    Text("\(i.name)")
                                                        .foregroundColor(.white)
                                                        .multilineTextAlignment(.leading)
                                                        .padding(.horizontal)
                                                    
                                                    
                                                }
                                                
                                                Spacer()
                                            }
                                            .padding(.vertical)
                                        }
                                        .padding(.all)
                                        .aspectRatio(3/3, contentMode: .fit)
                                        .background(Color(#colorLiteral(red: 0.9794914126, green: 0.3892467618, blue: 0.01223743614, alpha: 1)))
                                        .cornerRadius(20)
                                        .shadow(color: (Color(#colorLiteral(red: 0.9794914126, green: 0.3892467618, blue: 0.01223743614, alpha: 1))).opacity(0.4), radius: 8, y: 8)
                                        .padding()
                                        .multilineTextAlignment(.center)
                                        
                                    })
                            }
                        }
                    }
                    
                    
                    
                    Spacer()
                    
                }
                .padding()
                
            }
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    struct AnswerRow_Previews: PreviewProvider {
        static var previews: some View {
            AnswerRow(content: contents[2])
                .preferredColorScheme(.light)
            AnswerRow(content: contents[2])
                .preferredColorScheme(.dark)
                
        }
    }
}
