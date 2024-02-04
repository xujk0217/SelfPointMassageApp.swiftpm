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
        Point(name: "Yintang acupoint (印堂穴)", code: 1, symptom: "Commonly used to alleviate forehead discomfort, promote mental clarity, and is believed to benefit relaxation and relieve stress.", lacation: "1502", detail: "In the center between the eyebrows, precisely at the midpoint of the forehead.", massageTime: "10"),
        Point(name: "Temples acupoint (太陽穴)", code: 2, symptom: "Used for relieving headaches, migraines, and eye discomfort. Massaging the temples helps relax head muscles, improve blood circulation, and alleviate tension.", lacation: "1502", detail: "Approximately 1 inch behind the temples, find the hollow area known as the Temples.", massageTime: "10"),
        Point(name: "Fengchi acupoint (風池穴)", code: 3, symptom: "Known for regulating blood pressure, relieving discomfort in the back of the head, and improving overall head and neck well-being.", lacation: "1502", detail: "On both sides of the neck, slightly below the level of the cervical vertebrae.", massageTime: "10"),
        Point(name: "Baihui acupoint (百會穴)", code: 4, symptom: " It is believed to be associated with regulating the nervous system, enhancing consciousness, and promoting overall harmony within the body's meridians and blood circulation.", lacation: "1502", detail: "At the top of the head, at the intersection point of the midline and the line connecting the anterior hairline and the midpoint of the head.", massageTime: "10"),
    ]
    static let bexamples = [
        Point(name: "Tianshu acupoint (天樞穴)", code: 5, symptom: "The Tianshu acupoint is commonly used to alleviate abdominal discomfort, pain, bloating, and other digestive issues. Massaging this acupoint is believed to promote blood circulation in the abdominal region, regulate gastrointestinal function, and relieve symptoms related to the digestive system.", lacation: "1502", detail: "Located on both sides of the abdomen, approximately three finger-widths away from the navel.", massageTime: "10"),
        
        Point(name: "Zhongwan acupoint (中脘穴)", code: 6, symptom: "Zhongwan acupoint is an important point for regulating gastrointestinal function. Massaging Zhongwan is believed to help alleviate stomach discomfort, stomach pain, and loss of appetite. Additionally, it can be used to relieve symptoms related to the digestive system and promote the normal functioning of the digestive system.", lacation: "1502", detail: "Located on the abdomen, approximately four finger-widths above the navel. It can also be described as being about four horizontal fingers above the belly button.", massageTime: "10"),
        
        Point(name: "Yaoyan acupoint (腰眼穴)", code: 7, symptom: "Yaoyan acupoint is utilized for relieving discomfort and pain in the lumbar region. Massaging Yaoyan is believed to help relax the muscles in the lower back, alleviate tension around the lumbar vertebrae, and provide relief for issues such as lower back pain and stiffness.", lacation: "1502", detail: "Located in the lumbar region, approximately three horizontal fingers below the lower edge of the lumbar vertebrae. It is generally described as being beside the spine, about three horizontal fingers away from the lower edge of the lumbar vertebrae.", massageTime: "10"),
    ]
    static let haexamples = [
        Point(name: "Hegu acupoint (合谷穴)", code: 8, symptom: "Hegu acupoint is part of the Hand Shaoyin meridian and is commonly used to alleviate pain in the hands, headaches, toothaches, and other discomfort. Massaging Hegu is believed to help relieve pain and improve blood circulation in the hands.", lacation: "1502", detail: "Located on the back of the hand, in the depression between the index finger and the thumb, precisely at the highest point of the webbed area between the fingers.", massageTime: "10"),
        
        Point(name: "Xiangqiang acupoint (項強穴)", code: 9, symptom: "Effective in treating conditions such as numbness in the palm and fingers, inability to flex or extend muscles, and situations related to having a stiff neck.", lacation: "1502", detail: "located between the bones of the index and middle fingers, approximately one finger-width behind the knuckle.", massageTime: "10"),
        
        Point(name: "Waist and Leg Point (腰腿點穴)", code: 10, symptom: "Described as an effective acupoint for treating lower back and leg pain, especially effective for acute sprains.", lacation: "1502", detail: "There are two points for Waist and Leg Point, located respectively on the back of the hand, in the middle of the joint between the bones of the index and middle fingers on the back of the hand, and in the middle of the joint between the bones of the ring and little fingers.", massageTime: "10"),
        
        Point(name: "Neiguan acupoint (內關穴)", code: 11, symptom: "Neiguan acupoint is part of the Pericardium Meridian and is commonly used to alleviate discomfort related to the heart, such as palpitations, anxiety, and nausea. This acupoint is also widely utilized to relieve feelings of fear, calm emotions, and regulate heartbeat.", lacation: "1502", detail: "Located on the inner side of the arm, three fingers below the wrist crease, precisely in the depression between the tendons of the forearm muscles.", massageTime: "10"),
    ]
    static let fexamples = [
        Point(name: "Yongquan acupoint (湧泉穴)", code: 12, symptom: "The Yongquan acupoint is part of the Kidney Meridian and is believed to be beneficial for regulating kidney energy and promoting the flow of the kidney meridian. This acupoint is often used to alleviate symptoms such as insomnia, anxiety, headaches, and dizziness.", lacation: "1502", detail: "Located on the sole of the foot, in the depression between the second and third toes, about one-third from the front of the foot.", massageTime: "10"),
        
        Point(name: "Zusanli acupoint (足三里穴)", code: 13, symptom: "Zusanli acupoint is part of the Stomach Meridian in traditional Chinese medicine. It is believed to be beneficial for strengthening the spleen and stomach functions, regulating gastrointestinal digestion, and enhancing the immune system. Additionally, Zusanli acupoint is often used to alleviate fatigue, boost energy, and reduce stress.", lacation: "1502", detail: "Located below the knee, three fingers below the lower edge of the fibula head, approximately four fingers away from the knee joint. It is situated in the depression between the lower edge of the fibula head and the anterior margin of the tibia.", massageTime: "10"),
    ]
    
}

struct Symptom: Equatable, Identifiable {
    let id = UUID()
    var symptom: String
    var pointCode: String
    var image: String
    var exDetail: String
    
    static let hSymExamples = [
        Symptom(symptom: "headache", pointCode: "A", image: "29", exDetail: "During massage, use moderate pressure and massage along acupressure points to alleviate headache symptoms. Additionally, different acupressure points correspond to various locations of headaches."),
        
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
  B: 9, 3
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
