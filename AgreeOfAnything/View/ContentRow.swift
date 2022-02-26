//
//  ContentRow.swift
//  AgreeOfAnything
//
//  Created by Vladimir A. Kraev on 04.07.2021.
//

import SwiftUI

struct ContentRow: View {
    
    var content: Content
    
    
    var body: some View {
        
        HStack {
            Text(content.chapter)
            Spacer()
        }
        
        
    }
}

struct ContentRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentRow(content: contents[0])
            ContentRow(content: contents[1])
            
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
