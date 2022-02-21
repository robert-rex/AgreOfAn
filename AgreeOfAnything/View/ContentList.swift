//
//  ContentList.swift
//  AgreeOfAnything
//
//  Created by Vladimir A. Kraev on 11.07.2021.
//

import SwiftUI

struct ContentList: View {
    
    var content: Content
    var selected: Variant
    
    @State var showAnswers = false
    
    var body: some View {
        
        ZStack{
            Color("background")
                .ignoresSafeArea()
            VStack{
                
                //            Содержание вопросов с первым циклом
                
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
                            
                            HStack (alignment: .top, spacing: 40){
                                Button("Открыть варианты ответов") {
                                    self.showAnswers.toggle()
                                }
                            }
                            .font(.title2)
                            
                            Spacer()
                            
                            HStack {
                                Text("Выберите ответ: \(page)")
                                    .font(.subheadline)
                            }
                            
                            Spacer()
                            
                            
                                TestWindow(content: content, ask: test,
                                           showAnswers: $showAnswers)
                                    .offset(y: showAnswers ? 0 : 700)
                                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))

                           
                            
                            Spacer()
                            
                        }
                        .padding()
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                //            Конец содержания вопросов
            }
        }
    }
}


struct TestWindow: View {
    var content: Content
    var ask: Ask
//    var selected: Variant
    
    @Binding var showAnswers: Bool
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
        HStack {
            ForEach(ask.variants, id: \.self) { i in
                
                NavigationLink(
                    destination: ContentDetail(content: content, selected: i),
                    label: {
                        PopUpAnswers(content: content, selected: i, showAnswers: $showAnswers)
                            .offset(y: showAnswers ? 0 : 700)
                            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                        
                        
                    })
            }
        }
    }
    }
}



struct PopUpAnswers: View {
    
    var content: Content
    var selected: Variant
    
    @Binding var showAnswers: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            
            HStack{
                
                Text("Ответ к вопросу \(content.chapter)")
                    .font(.title)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.top)
            }
            
            VStack {
                Text("\(selected.name)")
                    .font(.title2)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
            }
            .padding(5)
            
            
            Spacer()
            
            HStack {
                Text("Не cогласен")
                    .foregroundColor(.blue)
                Spacer()
                NavigationLink(destination: ContentDetail(content: content, selected: selected),
                               label:  {
                    Text("Согласен")
                        .foregroundColor(.green)
                })
                
                
            }
            .font(.title2)
            .padding(.horizontal, 30)
            .padding(.bottom, 30)
            
        }
        .aspectRatio(4/3, contentMode: .fit)
        //                .frame(maxWidth: .infinity)
        //                .frame(maxHeight: 480)
        .background(Color.white).opacity(0.5)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 30, x: 8, y: 20)
        .padding(.horizontal, 5)
        .padding()
    }
}



struct ContentList_Previews: PreviewProvider {
    static var previews: some View {
        ContentList(content: contents[5], selected: contents[0].ask[0].variants[0])
        
    }
}


