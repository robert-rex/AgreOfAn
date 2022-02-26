//
//  ContentList.swift
//  AgreeOfAnything
//
//  Created by Vladimir A. Kraev on 11.07.2021.
//

import SwiftUI

struct ContentList: View {
    
    var content: Content
    
    @State var showAnswers = false
    
    var body: some View {
        
        ZStack{
            
            Color(showAnswers ? "shadows" : "background")
                .ignoresSafeArea()
           
            VStack{
                
                //            Содержание вопросов с первым циклом
                
                TabView {
                    
                    ForEach(content.ask, id: \.self) { test in
                        
                        
                        VStack {
                            HStack{
                                Text(content.testNumber)
                                    .fontWeight(.bold)
                                    .font(.title)
                                    .multilineTextAlignment(.leading)
                            }
                            
                            ScrollView(showsIndicators: false){
                                VStack{
                                    Text("\(test.title)")
                                        .font(.title2)
                                        .multilineTextAlignment(.leading)
                                        .padding()
                                        .lineSpacing(10.0)
                                    
                                }
                                .onTapGesture{
                                    if showAnswers == true{
                                        self.showAnswers = false
                                    }
                                }
                            }
                            
                            
                            Spacer()
                            
//                            HStack{
//
//                                Text("Ответ к вопросу \(content.chapter)")
//                                    .font(.title2)
//                                    .fontWeight(.regular)
//                                    .foregroundColor(.black)
//                                    .multilineTextAlignment(.leading)
//                                    .padding()
//                            }
//
//                            Spacer()
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.black)
                                
                                HStack (alignment: .top, spacing: 40){
                                    
                                    Button("Выберите вариант ответа") {
                                        self.showAnswers.toggle()
                                    }
                                }
                                .font(.title2)
                                .foregroundColor(Color("accentColor"))
                                
                            }
                            .padding(.top, 20)
                            .frame(width: 300.0, height: 85.0)
                            .shadow(color: (Color(#colorLiteral(red: 0.9794914126, green: 0.3892467618, blue: 0.01223743614, alpha: 1))).opacity(0.3), radius: 10, y: 10)
                            
                            
                            
                            
                            
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
                    
                            PopUpAnswers(content: content, selected: i, showAnswers: $showAnswers)
                                .offset(y: showAnswers ? 0 : 700)
                                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                            
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
            
            VStack {
                Text("\(selected.name)")
                    .font(.title3)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding([.top, .leading, .trailing], 20)
            }
            
            
            
            Spacer()
            
            HStack {
//                Button {
//                    self.showAnswers.toggle()
//                }label:  {
//                    Text("Вернуться")
//                        .fontWeight(.heavy)
//                        .foregroundColor(.red)
//                }
//
                Spacer()
                NavigationLink(destination: ContentDetail(content: content, selected: selected),
                               label:  {
                    Text("Согласен")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("accentColor"))
                })
                Spacer()
                
                
            }
            .font(.title2)
            .padding()
            .padding(.bottom, 30)
            
        }
        .aspectRatio(4/3, contentMode: .fit)
        //                .frame(maxWidth: .infinity)
        //                .frame(maxHeight: 480)
        .background(Color.white.opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 8, y: 8)
        .padding(.horizontal, 5)
        .padding()
    }
}



struct ContentList_Previews: PreviewProvider {
    static var previews: some View {
        ContentList(content: contents[15])
        
    }
}


