//
//  NaviggationList.swift
//  AgreeOfAnything
//
//  Created by Vladimir A. Kraev on 05.07.2021.
//

import SwiftUI

struct NaviggationList: View {
    
//    init () { UITableView.appearance().backgroundColor = UIColor("background")
//    }
    
    var body: some View {
        
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            NavigationView{
                
                List (contents) { content in
                    
                    NavigationLink(destination: ContentList(content: content)){
                        ContentRow(content: content)
                    }
                }
                .navigationTitle("Проверь себя")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(false)
                .navigationBarItems(trailing:
                                        Button("Результат"){
                    print("Вставить результат")
                })
                
                
            }
            
        }
    }
}

struct NaviggationList_Previews: PreviewProvider {
    static var previews: some View {
        NaviggationList()
    }
}
