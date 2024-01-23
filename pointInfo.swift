//
//  pointInfo.swift
//  playgroundTest
//
//  Created by 許君愷 on 2024/1/21.
//

import Foundation

struct Point: Equatable, Identifiable {
    let id = UUID()
    var name: String
    var healPart: String
    var symptom: String
    var lacation: String
    var detail: String
    var image: String
    var messageTime: Double
    
    static let hexamples = [
        Point(name: "湧泉穴", healPart: "head", symptom: "Insomnia", lacation: "feet", detail: "wwwwwww", image: "🦶", messageTime: 10),
        Point(name: "湧泉", healPart: "head", symptom: "Ins", lacation: "feet", detail: "wwwwwww", image: "🦶", messageTime: 10),
        Point(name: "湧穴", healPart: "head", symptom: "nia", lacation: "feet", detail: "wwwwwww", image: "🦶", messageTime: 10)
    ]
    static let bexamples = [
        Point(name: "湧泉穴", healPart: "body", symptom: "Insomnia", lacation: "feet", detail: "wwwwwww", image: "🦶", messageTime: 10)
    ]
    static let oexamples = [
        Point(name: "湧泉穴", healPart: "other", symptom: "Insomnia", lacation: "feet", detail: "wwwwwww", image: "🦶", messageTime: 10)
    ]
}
/*
struct BodyPoint: Equatable, Identifiable {
    let id = UUID()
    var name: String
    let healPart = "body"
    var symptom: String
    var lacation: String
    var detail: String
    var image: String
    var messageTime: Double
    
    static let bexamples = [
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
    
    static let oexamples = [
        OtherPoint(name: "湧泉穴", symptom: "Insomnia", lacation: "feet", detail: "wwwwwww", image: "🦶", messageTime: 10)
    ]
}

*/
