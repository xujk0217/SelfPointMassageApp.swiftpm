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
        Point(name: "Yintang acupoint", code: 1, symptom: "Commonly used to alleviate forehead discomfort, promote mental clarity, and is believed to benefit relaxation and relieve stress.", lacation: "1502", detail: "In the center between the eyebrows, precisely at the midpoint of the forehead.", massageTime: "Lie on your back, extend the thumb, semi-clench the other four fingers into a fist, place the thumb on the Yintang acupoint (located between the eyebrows), and massage with rubbing or pressing motions 50 times."),
        
        Point(name: "Temples acupoint", code: 2, symptom: "Used for relieving headaches, migraines, and eye discomfort. Massaging the temples helps relax head muscles, improve blood circulation, and alleviate tension.", lacation: "1502", detail: "Approximately 1 inch behind the temples, find the hollow area known as the Temples.", massageTime: "Using the index fingers of both hands, massage the temples on both sides in a clockwise and counterclockwise direction for 10-15 times."),
        
        Point(name: "Fengchi acupoint", code: 3, symptom: "Known for regulating blood pressure, relieving discomfort in the back of the head, and improving overall head and neck well-being.", lacation: "1502", detail: "On both sides of the neck, slightly below the level of the cervical vertebrae.", massageTime: "Place the thumbs of both hands on the Fengchi acupoints at the base of the neck, while the remaining four fingers lightly stroke the head. Use gentle to firm pressure with the thumbs on the Fengchi acupoints, repeating approximately 20-30 times."),
        
        Point(name: "Baihui acupoint", code: 4, symptom: " It is believed to be associated with regulating the nervous system, enhancing consciousness, and promoting overall harmony within the body's meridians and blood circulation.", lacation: "1502", detail: "At the top of the head, at the intersection point of the midline and the line connecting the anterior hairline and the midpoint of the head.", massageTime: "Place the palm of your right hand on the top of your head and gently massage in a clockwise direction for 1 minute. Then, switch to an anticlockwise direction and continue massaging for another 1 minute."),
    ]
    
    static let bexamples = [
        Point(name: "Tianshu acupoint", code: 5, symptom: "The Tianshu acupoint is commonly used to alleviate abdominal discomfort, pain, bloating, and other digestive issues. Massaging this acupoint is believed to promote blood circulation in the abdominal region, regulate gastrointestinal function, and relieve symptoms related to the digestive system.", lacation: "1502", detail: "Located on both sides of the abdomen, approximately three finger-widths away from the navel.", massageTime: "Massage the Tianzhu acupoint using the pad of the thumb or the base of the palm. Apply gentle pressure, ensuring it is not too heavy. Stop when you feel a slight soreness or discomfort."),
        
        Point(name: "Zhongwan acupoint", code: 6, symptom: "Zhongwan acupoint is an important point for regulating gastrointestinal function. Massaging Zhongwan is believed to help alleviate stomach discomfort, stomach pain, and loss of appetite. Additionally, it can be used to relieve symptoms related to the digestive system and promote the normal functioning of the digestive system.", lacation: "1502", detail: "Located on the abdomen, approximately four finger-widths above the navel. It can also be described as being about four horizontal fingers above the belly button.", massageTime: "Rub the area for approximately 2 to 5 minutes using fingertip or the base of the palm. Alternatively, gently massage with the palm or four fingers for about 5 to 10 minutes."),
        
        Point(name: "Yaoyan acupoint", code: 7, symptom: "Yaoyan acupoint is utilized for relieving discomfort and pain in the lumbar region. Massaging Yaoyan is believed to help relax the muscles in the lower back, alleviate tension around the lumbar vertebrae, and provide relief for issues such as lower back pain and stiffness.", lacation: "1502", detail: "Located in the lumbar region, approximately three horizontal fingers below the lower edge of the lumbar vertebrae. It is generally described as being beside the spine, about three horizontal fingers away from the lower edge of the lumbar vertebrae.", massageTime: "Rub the area using the knuckles of clenched fists. Press and rub in a clockwise direction for 9 times, then repeat in an anticlockwise direction for 9 times. Repeat this pressing and rubbing pattern for a total of 36 times."),
    ]
    static let haexamples = [
        Point(name: "Hegu acupoint", code: 8, symptom: "Hegu acupoint is part of the Hand Shaoyin meridian and is commonly used to alleviate pain in the hands, headaches, toothaches, and other discomfort. Massaging Hegu is believed to help relieve pain and improve blood circulation in the hands.", lacation: "1502", detail: "Located on the back of the hand, in the depression between the index finger and the thumb, precisely at the highest point of the webbed area between the fingers.", massageTime: "Press and rub Hegu acupoint towards the direction of the index finger rather than towards the palm. Pressing on Hegu acupoint may produce a sore and swollen feeling, and this sensation may sometimes be transmitted along the meridian to the index finger. Use the thumb to massage the opposite hand's Hegu acupoint, pressing for 3 to 5 seconds each time, and repeat the pressure 10 to 15 times. Alternate by pressing the Hegu acupoint on the other hand."),
        
        Point(name: "Xiangqiang acupoint", code: 9, symptom: "Effective in treating conditions such as numbness in the palm and fingers, inability to flex or extend muscles, and situations related to having a stiff neck.", lacation: "1502", detail: "located between the bones of the index and middle fingers, approximately one finger-width behind the knuckle.", massageTime: "Apply slow pressure with the fingertip against the acupoint, exerting force for approximately 3 seconds, and massage for about 2-3 minutes."),
        
        Point(name: "Waist and Leg Point", code: 10, symptom: "Described as an effective acupoint for treating lower back and leg pain, especially effective for acute sprains.", lacation: "1502", detail: "There are two points for Waist and Leg Point, located respectively on the back of the hand, in the middle of the joint between the bones of the index and middle fingers on the back of the hand, and in the middle of the joint between the bones of the ring and little fingers.", massageTime: "Massage the Waist and Leg Point on both left and right hands 2 to 3 times a day, for 1 to 2 minutes each time."),
        
        Point(name: "Neiguan acupoint", code: 11, symptom: "Neiguan acupoint is part of the Pericardium Meridian and is commonly used to alleviate discomfort related to the heart, such as palpitations, anxiety, and nausea. This acupoint is also widely utilized to relieve feelings of fear, calm emotions, and regulate heartbeat.", lacation: "1502", detail: "Located on the inner side of the arm, three fingers below the wrist crease, precisely in the depression between the tendons of the forearm muscles.", massageTime: "Merge the index and middle fingers, and massage the Neiguan acupoint 100-200 times. Each massage session should be controlled within 20-30 minutes. The optimal time to massage the Neiguan acupoint to regulate heart function is between 19:00 and 21:00. The pressure applied should be moderate, ensuring comfort during the massage."),
    ]
    static let fexamples = [
        Point(name: "Yongquan acupoint", code: 12, symptom: "The Yongquan acupoint is part of the Kidney Meridian and is believed to be beneficial for regulating kidney energy and promoting the flow of the kidney meridian. This acupoint is often used to alleviate symptoms such as insomnia, anxiety, headaches, and dizziness.", lacation: "1502", detail: "Located on the sole of the foot, in the depression between the second and third toes, about one-third from the front of the foot.", massageTime: "1. Grasp the foot with your fingers and use your thumb to press the Yongquan acupoint several times while simultaneously massaging in a circular motion.\n2. After washing the feet with hot water and drying them, use the thumb in a circular and spiral manner to press and knead the Yongquan acupoint.\n3. Stack the thumbs of both hands, press the Yongquan acupoint during exhalation, relax during inhalation, repeat 5-8 times, and pushing towards the toes can be more effective.\n4. Apply slightly more pressure with the thumbs to press the Yongquan acupoint, massage each foot 10 times, or use a golf ball for massage."),
        
        Point(name: "Zusanli acupoint", code: 13, symptom: "Zusanli acupoint is part of the Stomach Meridian in traditional Chinese medicine. It is believed to be beneficial for strengthening the spleen and stomach functions, regulating gastrointestinal digestion, and enhancing the immune system. Additionally, Zusanli acupoint is often used to alleviate fatigue, boost energy, and reduce stress.", lacation: "1502", detail: "Located below the knee, three fingers below the lower edge of the fibula head, approximately four fingers away from the knee joint. It is situated in the depression between the lower edge of the fibula head and the anterior margin of the tibia.", massageTime: "Press the Zusanli acupoint with the thumb or middle finger for five to ten minutes each time. The pressure should be moderate, creating a sensation similar to needle-like soreness and mild warmth."),
    ]
    
}

struct Symptom: Equatable, Identifiable {
    let id = UUID()
    var symptom: String
    var pointCode: String
    var image: String
    var exDetail: String
    
    static let hSymExamples = [
        Symptom(symptom: "headache", pointCode: "A", image: "29", exDetail: "Headaches can have various common causes, including tension-type headaches, which may result from prolonged stress and anxiety; migraines, which can be triggered by abnormal neurological activity; lifestyle factors, such as insufficient sleep, irregular eating habits, excessive alcohol consumption, or excessive intake of caffeine, may also cause headaches; eye problems, such as prolonged staring at computer screens or abnormal vision, can also be a cause of headaches.\n Methods to alleviate headaches may involve rest and relaxation, avoiding prolonged work or stress, and engaging in activities that promote relaxation. Additionally, maintaining good lifestyle habits, including regular sleep patterns, a balanced diet, and moderate exercise, is crucial for relieving headaches. Treatment for headaches may also involve avoiding potential triggers, such as specific foods, environments, or activities. "),
        
        Symptom(symptom: "stiff neck", pointCode: "B", image: "399", exDetail: "Stiff neck is often caused by poor posture, incorrect sleeping positions, maintaining the same neck position for an extended period, or muscle injuries in the neck or shoulders. Exposure to cold environments or sudden changes in sleeping positions can also contribute to a stiff neck.\n The relief of pain can be achieved through the following methods: warm compress, stretching exercises for the neck and shoulders, and massage of specific acupoints."),
    ]
    static let bSymExamples = [
        Symptom(symptom: "lower back pain/sore", pointCode: "C", image: "1023", exDetail: "The causes of lower back pain may include prolonged periods in a fixed posture, issues with the lumbar discs, muscle or tissue injuries, excessive weight or obesity, and improper sleeping positions. \nRelief methods can involve applying heat or cold, engaging in light activities to maintain flexibility, receiving massages or therapies, maintaining proper posture, and making lifestyle adjustments. "),
        
        Symptom(symptom: "stomach bloating and pain", pointCode: "D", image: "193", exDetail: "Indigestion and abdominal bloating can have various causes. Fast eating may lead to the ingestion of air, causing a bloated sensation. Indigestion may result from incomplete food digestion, leading to stomach discomfort and bloating. Food allergies or intolerances can also contribute to feelings of bloating. Additionally, constipation can result in the accumulation of gas in the colon, causing discomfort.\n Relief methods include eating slowly to reduce air intake and making dietary adjustments to avoid foods known to cause bloating, such as beans and high-fiber foods. Drinking peppermint tea may sometimes help alleviate bloating. Regular exercise contributes to promoting bowel movement and relieving discomfort."),
        
        Symptom(symptom: "palpitations", pointCode: "E", image: "191", exDetail: "Common causes of palpitations include anxiety and stress, excessive caffeine intake, and overexertion. To address these situations, the following relief methods can be adopted:\nDeep breathing and relaxation techniques help alleviate anxiety and stress. Additionally, limiting caffeine intake by reducing the consumption of caffeinated beverages such as coffee, tea, and energy drinks is recommended. Maintaining healthy lifestyle habits, including regular sleep patterns, a balanced diet, and moderate exercise, contributes to overall well-being. If palpitations persist or are accompanied by other symptoms, it is advisable to seek timely medical attention to identify potential underlying health issues."),
        
        Symptom(symptom: "strained lower back", pointCode: "K", image: "1022", exDetail: "Common causes of lower back strain include poor posture, improper lifting techniques, sudden twisting movements, and muscle inflexibility. To address these issues, the following relief methods can be implemented:\nRest and cold compress are crucial components of recovery, helping to reduce inflammation and alleviate pain. After initial cold compress application, heat therapy can be used to promote blood flow, accompanied by gentle stretching and exercise. Learning proper posture and lifting techniques is essential to minimize stress on the lower back. Additionally, seeking professional physical therapy can aid in recovery and strengthen the muscles in the lower back. If symptoms persist or worsen, timely consultation with a doctor is recommended."),
    ]
    static let oSymExamples = [
        Symptom(symptom: "Insomnia", pointCode: "F", image: "1030", exDetail: "Common causes of insomnia include psychological stress, lifestyle habits, environmental factors, and physiological factors. Psychological stress from work, academics, family, or personal life can contribute to insomnia. Irregular sleep patterns, unhealthy dietary habits, and excessive consumption of caffeine or alcohol can also impact sleep. Environmental factors such as light, noise, temperature, and an uncomfortable sleep environment may have negative effects on sleep. Physiological factors involve certain health conditions, chronic diseases, or hormonal changes that can lead to insomnia.\nRelief methods include establishing a regular sleep schedule with fixed bedtime and wake-up times. Creating a conducive sleep environment, maintaining a quiet, dark, and cool setting, and using comfortable bedding contribute to better sleep. Avoiding caffeine and stimulants in the evening, such as coffee, tea, and nicotine, is recommended. Relaxation techniques such as deep breathing, meditation, or yoga can help alleviate psychological stress. Moderate exercise is beneficial for sleep, but intense physical activity should be avoided a few hours before bedtime."),
        
        Symptom(symptom: "anxiety", pointCode: "G", image: "1447", exDetail: "Common causes of anxiety include life stressors (work, academics, financial, or family stress), health issues (certain health problems or chronic illnesses may lead to anxiety), social pressures (social situations, interpersonal relationships, or public performances), and hormonal changes (physiological hormonal fluctuations, especially during the menstrual cycle in women, may affect mood).\nRelief methods include learning deep breathing and meditation techniques to relax the mind and body, engaging in moderate exercise to release bodily tension, and ensuring an adequate amount of sleep to maintain emotional balance."),
        
        Symptom(symptom: "constipation", pointCode: "H", image: "192", exDetail: "Constipation can result from factors such as insufficient dietary fiber and water intake, lack of physical activity, irregular bowel habits, or neglecting the body's natural signals for bowel movements. \nTo address these issues, one can consider increasing fiber intake by including more vegetables, fruits, and whole grains in the diet, maintaining moderate physical activity to support healthy bowel movements, ensuring an ample intake of fluids to soften stool, establishing a regular bowel routine to encourage consistent bowel movements, and avoiding excessive use of laxatives to prevent dependency. "),
        
        Symptom(symptom: "nausea", pointCode: "I", image: "34", exDetail: "Nausea can be caused by various factors, including digestive issues such as indigestion, heartburn, or bloating. Additionally, dizziness or vertigo related to inner ear problems, heatstroke, or other balance issues may contribute to feelings of nausea. Emotional factors like stress, anxiety, or depression can also lead to nausea.\nMethods to alleviate nausea may include ensuring adequate rest for the body's recovery, adjusting the diet to avoid greasy, spicy, or excessive eating, and maintaining proper hydration. Avoiding exposure to strong, nauseating odors is another strategy to manage feelings of nausea."),
        
        Symptom(symptom: "muscle soreness", pointCode: "J", image: "1104", exDetail: "Muscle soreness can be caused by various factors, including post-exercise fatigue, muscle injuries, overuse of muscles, and prolonged periods of tension or high stress. \nRelief methods may involve giving the muscles sufficient rest for recovery, applying cold or hot compresses (cold compresses help reduce pain and swelling, while hot compresses aid in muscle relaxation), and engaging in light exercises such as gentle stretches and movements to promote blood circulation and alleviate muscle soreness."),
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
