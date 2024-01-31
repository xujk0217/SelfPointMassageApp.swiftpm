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
    var code: Int
    var symptom: String
    var lacation: String
    var detail: String
    var massageTime: String
    
    static let hexamples = [
        Point(name: "Yongquan acupoint (印堂穴)", code: 1, symptom: "Insomnia", lacation: "1502", detail: "wwwwwww", massageTime: "10"),
        Point(name: "Yongquan acupoint (太陽穴)", code: 2, symptom: "Insomnia", lacation: "1502", detail: "wwwwwww", massageTime: "10"),
        Point(name: "Yongquan acupoint (風池穴)", code: 3, symptom: "Insomnia", lacation: "1502", detail: "wwwwwww", massageTime: "10"),
        Point(name: "Yongquan acupoint (百會穴)", code: 4, symptom: "Insomnia", lacation: "1502", detail: "wwwwwww", massageTime: "10"),
    ]
    static let bexamples = [
        Point(name: "Yongquan acupoint (天樞穴)", code: 5, symptom: "Insomnia", lacation: "1502", detail: "wwwwwww", massageTime: "10"),
        Point(name: "Yongquan acupoint (中脘穴)", code: 6, symptom: "Insomnia", lacation: "1502", detail: "wwwwwww", massageTime: "10"),
        Point(name: "Yongquan acupoint (腰眼穴)", code: 7, symptom: "Insomnia", lacation: "1502", detail: "wwwwwww", massageTime: "10"),
    ]
    static let haexamples = [
        Point(name: "Yongquan acupoint (合谷穴)", code: 8, symptom: "Insomnia", lacation: "1502", detail: "wwwwwww", massageTime: "10"),
        Point(name: "Yongquan acupoint (落枕穴)", code: 9, symptom: "Insomnia", lacation: "1502", detail: "wwwwwww", massageTime: "10"),
        Point(name: "Yongquan acupoint (腰腿點穴)", code: 10, symptom: "Insomnia", lacation: "1502", detail: "wwwwwww", massageTime: "10"),
        Point(name: "Yongquan acupoint (內關穴)", code: 11, symptom: "Insomnia", lacation: "1502", detail: "wwwwwww", massageTime: "10"),
    ]
    static let fexamples = [
        Point(name: "Yongquan acupoint (湧泉穴)", code: 12, symptom: "Insomnia", lacation: "1502", detail: "wwwwwww", massageTime: "10"),
        Point(name: "Yongquan acupoint (足三里穴)", code: 13, symptom: "Insomnia", lacation: "1502", detail: "wwwwwww", massageTime: "10"),
    ]
    
}

struct Symptom: Equatable, Identifiable {
    let id = UUID()
    var symptom: String
    var pointCode: String
    var image: String
    var exDetail: String
    
    static let hSymExamples = [
        Symptom(symptom: "headache", pointCode: "A", image: "29", exDetail: ""),
        Symptom(symptom: "stiff neck", pointCode: "B", image: "399", exDetail: ""),
    ]
    static let bSymExamples = [
        Symptom(symptom: "lower back pain/sore", pointCode: "C", image: "1023", exDetail: ""),
        Symptom(symptom: "stomach bloating and pain", pointCode: "D", image: "193", exDetail: ""),
        Symptom(symptom: "palpitations", pointCode: "E", image: "191", exDetail: ""),
        Symptom(symptom: "strained lower back", pointCode: "K", image: "1022", exDetail: ""),
    ]
    static let oSymExamples = [
        Symptom(symptom: "Insomnia", pointCode: "F", image: "1030", exDetail: ""),
        Symptom(symptom: "anxiety", pointCode: "G", image: "1447", exDetail: ""),
        Symptom(symptom: "constipation", pointCode: "H", image: "192", exDetail: ""),
        Symptom(symptom: "nausea", pointCode: "I", image: "34", exDetail: ""),
        Symptom(symptom: "muscle soreness", pointCode: "J", image: "1104", exDetail: ""),
    ]
}

// code table:
 /*
  A: 1, 2, 3
  B: 9
  C: 7, 10
  D: 6, 11, 13
  E: 11
  F: 8, 11, 12
  G: 4, 11. 12, 1
  H: 5
  I: 6, 11
  J: 8, 11, 13
  K: 10
 */
