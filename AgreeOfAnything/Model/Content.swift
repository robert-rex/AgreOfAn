//
//  Content.swift
//  AgreeOfAnything
//
//  Created by Vladimir A. Kraev on 04.07.2021.
//

import Foundation
import SwiftUI

// MARK: - ContentElement
struct Content: Codable, Hashable, Identifiable{
    
    let id: Int
        let chapter: String
        let chapterTitle: String
        let testNumber: String
        let ask: [Ask]
}

// MARK: - Ask
struct Ask: Codable, Hashable {
    let title: String
    let variants: [Variant]
//    let answers: [Answer]
    
}

enum Code: String, Codable, Hashable  {
    case a = "a"
    case b = "b"
    case c = "c"
}

struct Variant: Codable, Hashable  {
    let code: String
    let name: String
    var discription: String
    var result: String
}

// MARK: - Answer
//struct Answer: Codable, Hashable {
//    let code: String
//    var computed: String {
//        if code == code {
//            return discription
//        } else {
//            return "Ничего не найдено!!!"
//        }
//    }
//
//
//}




