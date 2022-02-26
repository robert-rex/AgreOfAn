//
//  NaviggationList.swift
//  AgreeOfAnything
//
//  Created by Vladimir A. Kraev on 05.07.2021.
//

import SwiftUI

struct NaviggationList: View {
    
    init () { UITableView.appearance().backgroundColor = UIColor(named: "background")
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().barTintColor = UIColor(named: "background")
        
    }
    
    var body: some View {
        
        NavigationView{
            List (contents) { content in
                
                NavigationLink(destination: ContentList(content: content)){
                    ContentRow(content: content)
                    
                }
                .listRowBackground(Color("background"))
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Проверь себя")
            .navigationBarHidden(false)
            
        }
    }
}

struct NaviggationList_Previews: PreviewProvider {
    static var previews: some View {
        NaviggationList()
    }
}
