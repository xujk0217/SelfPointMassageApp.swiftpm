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
        Point(name: "Yongquan acupoint (湧泉穴)", healPart: "head", symptom: "Insomnia", lacation: "1502", detail: "wwwwwww", image: "1030", messageTime: 10),
        Point(name: "湧泉", healPart: "head", symptom: "Ins", lacation: "feet", detail: "wwwwwww", image: "194", messageTime: 10),
        Point(name: "湧穴", healPart: "head", symptom: "nia", lacation: "feet", detail: "wwwwwww", image: "194", messageTime: 10)
    ]
    static let bexamples = [
        Point(name: "湧泉穴", healPart: "body", symptom: "Insomnia", lacation: "feet", detail: "wwwwwww", image: "119", messageTime: 10)
    ]
    static let oexamples = [
        Point(name: "湧泉穴", healPart: "other", symptom: "Insomnia", lacation: "feet", detail: "wwwwwww", image: "120", messageTime: 10)
    ]
    
    
    static let headPoint = [
        Point(name: "湧泉穴", healPart: "other", symptom: "Insomnia", lacation: "feet", detail: "wwwwwww", image: "120", messageTime: 10)
    ]
    static let bodyPoint = [
        Point(name: "湧泉穴", healPart: "other", symptom: "Insomnia", lacation: "feet", detail: "wwwwwww", image: "120", messageTime: 10)
    ]
    static let handPoint = [
        Point(name: "湧泉穴", healPart: "other", symptom: "Insomnia", lacation: "feet", detail: "wwwwwww", image: "120", messageTime: 10)
    ]
    static let feetPoint = [
        Point(name: "湧泉穴", healPart: "head", symptom: "Insomnia", lacation: "feet", detail: "wwwwwww", image: "1030", messageTime: 10),
    ]
}
