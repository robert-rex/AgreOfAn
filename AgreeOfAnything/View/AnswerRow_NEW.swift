//
//  AnswerRow_NEW.swift
//  AgreeOfAnything
//
//  Created by Vladimir A. Kraev on 26.11.2021.
//

import SwiftUI

struct AnswerRow_NEW: View {
    var content: Content
    var selected: Variant
    var body: some View{
        
        TabView{
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
                    .foregroundColor(.white)
                VStack(alignment: .leading){
                    HStack{
                        
                        Text("Ответ к вопросу \(selected.code)")
                            .font(.title3)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .padding()
                    }
                    
                    VStack{
                        
                        Text(selected.name)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .padding()
                        
                        
                    }
                    
                    Spacer()
                }
                .padding(.vertical)
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .aspectRatio(3/3, contentMode: .fit)
            .background(Color(#colorLiteral(red: 0.9794914126, green: 0.3892467618, blue: 0.01223743614, alpha: 1)))
            .cornerRadius(20)
            .shadow(color: (Color(#colorLiteral(red: 0.9794914126, green: 0.3892467618, blue: 0.01223743614, alpha: 1))).opacity(0.6), radius: 10, y: 10)
            .padding()
            .multilineTextAlignment(.center)
            
        }
    }
}







struct AnswerRow_NEW_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow_NEW(content: contents[1], selected: contents[1].ask[1].variants[1])
    }
}

