//
//  pointInfo.swift
//  playgroundTest
//
//  Created by 許君愷 on 2024/1/21.
//

import Foundation

struct HeadPoint: Equatable, Identifiable {
    let id = UUID()
    var name: String
    let healPart = "head"
    var symptom: String
    var lacation: String
    var detail: String
    var image: String
    var messageTime: Double
    
    static let examples = [
        HeadPoint(name: "湧泉穴", symptom: "Insomnia", lacation: "feet", detail: "wwwwwww", image: "🦶", messageTime: 10),
        HeadPoint(name: "湧泉", symptom: "Insomnia", lacation: "feet", detail: "wwwwwww", image: "🦶", messageTime: 10),
        HeadPoint(name: "湧穴", symptom: "Insomnia", lacation: "feet", detail: "wwwwwww", image: "🦶", messageTime: 10)
    ]
}

struct BodyPoint: Equatable, Identifiable {
    let id = UUID()
    var name: String
    let healPart = "body"
    var symptom: String
    var lacation: String
    var detail: String
    var image: String
    var messageTime: Double
    
    static let examples = [
        BodyPoint(name: "湧泉穴", symptom: "Insomnia", lacation: "feet", detail: "wwwwwww", image: "🦶", messageTime: 10)
    ]
}

struct OtherPoint: Equatable, Identifiable {
    let id = UUID()
    var name: String
    let healPart = "other"
    var symptom: String
    var lacation: String
    var detail: String
    var image: String
    var messageTime: Double
    
    static let examples = [
        OtherPoint(name: "湧泉穴", symptom: "Insomnia", lacation: "feet", detail: "wwwwwww", image: "🦶", messageTime: 10)
    ]
}
