//
//  handPointView.swift
//  SelfPointMassageApp
//
//  Created by 許君愷 on 2024/1/23.
//

import SwiftUI

struct handPointView: View {
    @State private var handPoint = Point.haexamples
    @State private var showSheet = false
    @State private var showPopover = false
    @State private var showPopovera = false
    @State private var showPopoverb = false
    @State private var showPopoverc = false
    @State private var showPopoverd = false
    @Environment (\.colorScheme) var colorScaheme
    
    @State private var selected: Point?
    
    var body: some View {
        GeometryReader { geometry in
            //ScrollView{
                let shouldVStack = geometry.size.width <= geometry.size.height
                
                let layout = shouldVStack ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
            
                layout {
                    ScrollView{
                        VStack{
                            ZStack {
                                Image("15061")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 600)
                                .navigationTitle("Hand Point")
                                VStack {
                                    Color.clear
                                        .frame(height: 200)
                                        .frame(maxWidth: 600)
                                    HStack {
                                        Color.clear
                                            .frame(height: 100)
                                            .frame(width: 100)
                                        Button{
                                            showPopovera = true
                                        } label:{
                                            Text("8")
                                                .font(.title3.bold())
                                                .frame(width: 30, height: 30)
                                                .background(Color.red)
                                                .cornerRadius(50)
                                        }.popover(isPresented: $showPopovera, content: {
                                            VStack(alignment: .leading) {
                                                Text("Point name:")
                                                Text("Hegu acupoint (合谷穴)")
                                                    .font(.title3)
                                                Text("symptom:")
                                                Text("Hegu acupoint is part of the Hand Shaoyin meridian and is commonly used to alleviate pain in the hands, headaches, toothaches, and other discomfort. Massaging Hegu is believed to help relieve pain and improve blood circulation in the hands.")
                                                    .font(.title3)
                                                Text("detail:")
                                                Text("Located on the back of the hand, in the depression between the index finger and the thumb, precisely at the highest point of the webbed area between the fingers.")
                                                    .font(.title3)
                                            }.padding()
                                                .frame(width: 600)
                                    })
                                    }
                                }
                                VStack {
                                    HStack {
                                        Button{
                                            showPopoverb = true
                                        } label:{
                                            Text("9")
                                                .font(.title3.bold())
                                                .frame(width: 30, height: 30)
                                                .background(Color.red)
                                                .cornerRadius(50)
                                        }.popover(isPresented: $showPopoverb, content: {
                                            VStack(alignment: .leading) {
                                                Text("Point name:")
                                                Text("Xiangqiang acupoint (項強穴)")
                                                    .font(.title3)
                                                Text("symptom:")
                                                Text("Effective in treating conditions such as numbness in the palm and fingers, inability to flex or extend muscles, and situations related to having a stiff neck.")
                                                    .font(.title3)
                                                Text("detail:")
                                                Text("located between the bones of the index and middle fingers, approximately one finger-width behind the knuckle.")
                                                    .font(.title3)
                                            }.padding()
                                                .frame(width: 600)
                                    })
                                        Color.clear
                                            .frame(height: 100)
                                            .frame(width: 10)
                                    }
                                }
                                VStack {
                                    Color.clear
                                        .frame(height: 200)
                                        .frame(maxWidth: 600)
                                    HStack {
                                        Color.clear
                                            .frame(height: 200)
                                            .frame(width: 100)
                                        Button{
                                            showPopoverc = true
                                        } label:{
                                            Text("10")
                                                .font(.title3.bold())
                                                .frame(width: 30, height: 30)
                                                .background(Color.red)
                                                .cornerRadius(50)
                                        }.popover(isPresented: $showPopoverc, content: {
                                            VStack(alignment: .leading) {
                                                Text("Point name:")
                                                Text("Waist and Leg Point (腰腿點穴)")
                                                    .font(.title3)
                                                Text("symptom:")
                                                Text("Described as an effective acupoint for treating lower back and leg pain, especially effective for acute sprains.")
                                                    .font(.title3)
                                                Text("detail:")
                                                Text("There are two points for Waist and Leg Point, located respectively on the back of the hand, in the middle of the joint between the bones of the index and middle fingers on the back of the hand, and in the middle of the joint between the bones of the ring and little fingers.")
                                                    .font(.title3)
                                            }.padding()
                                                .frame(width: 600)
                                    })
                                        Color.clear
                                            .frame(height: 200)
                                            .frame(width: 100)
                                        Button{
                                            showPopover = true
                                        } label:{
                                            Text("10")
                                                .font(.title3.bold())
                                                .frame(width: 30, height: 30)
                                                .background(Color.red)
                                                .cornerRadius(50)
                                        }.popover(isPresented: $showPopover, content: {
                                            VStack(alignment: .leading) {
                                                Text("Point name:")
                                                Text("Waist and Leg Point (腰腿點穴)")
                                                    .font(.title3)
                                                Text("symptom:")
                                                Text("Described as an effective acupoint for treating lower back and leg pain, especially effective for acute sprains.")
                                                    .font(.title3)
                                                Text("detail:")
                                                Text("There are two points for Waist and Leg Point, located respectively on the back of the hand, in the middle of the joint between the bones of the index and middle fingers on the back of the hand, and in the middle of the joint between the bones of the ring and little fingers.")
                                                    .font(.title3)
                                            }.padding()
                                                .frame(width: 600)
                                    })
                                        Color.clear
                                            .frame(height: 200)
                                            .frame(width: 200)
                                    }
                                }
                            }
                            ZStack {
                                Image("15071")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 600)
                                .navigationTitle("Head Point")
                                VStack {
                                    Color.clear
                                        .frame(height: 300)
                                        .frame(maxWidth: 600)
                                    Button{
                                        showPopoverd = true
                                    } label:{
                                        Text("11")
                                            .font(.title3.bold())
                                            .frame(width: 30, height: 30)
                                            .background(Color.red)
                                            .cornerRadius(50)
                                    }.popover(isPresented: $showPopoverd, content: {
                                        VStack(alignment: .leading) {
                                            Text("Point name:")
                                            Text("Neiguan acupoint (內關穴)")
                                                .font(.title3)
                                            Text("symptom:")
                                            Text("Neiguan acupoint is part of the Pericardium Meridian and is commonly used to alleviate discomfort related to the heart, such as palpitations, anxiety, and nausea. This acupoint is also widely utilized to relieve feelings of fear, calm emotions, and regulate heartbeat.")
                                                .font(.title3)
                                            Text("detail:")
                                            Text("Located on the inner side of the arm, three fingers below the wrist crease, precisely in the depression between the tendons of the forearm muscles.")
                                                .font(.title3)
                                        }.padding()
                                            .frame(width: 600)
                                    })
                                }
                            }
                        }.frame(maxWidth: .infinity)
                            .font(.title3.bold())
                    }
                    VStack(alignment: .leading) {
                        if shouldVStack{
                            VStack{
                            ScrollView{
                                ForEach($handPoint){ $handPoint in
                                    Button{
                                        selected = handPoint
                                    } label: {
                                        HStack {
                                            Text("\(handPoint.code): \(handPoint.name)")
                                                .padding()
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .cornerRadius(6)
                                                .foregroundColor(colorScaheme == .dark ? .white : .black)
                                                .background(Color.white)
                                        }
                                    }.sheet(item: $selected){handPoint in
                                        ZStack {
                                            Color.gray
                                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .cornerRadius(10)
                                                .padding(.top, 15)
                                        }
                                        HStack {
                                            Spacer()
                                            Text(handPoint.name)
                                                .lineLimit(1)
                                                .minimumScaleFactor(0.1)
                                                .font(.title.bold())
                                                .padding(.bottom, -5)
                                            Spacer()
                                        }
                                        ScrollView{
                                            HStack {
                                                VStack(alignment: .leading) {
                                                    if handPoint.code == 8{
                                                        CodeEig
                                                    }else if handPoint.code == 9{
                                                        CodeNin
                                                    }else if handPoint.code == 10{
                                                        CodeTen
                                                    }else if handPoint.code == 11{
                                                        CodeEle
                                                    }
                                                    Divider()
                                                        .padding(.horizontal, 20)
                                                        .padding(.bottom, 10)
                                                    Text("symptom:")
                                                        .font(.title2.bold())
                                                    Text("\(handPoint.symptom)")
                                                        .font(.headline)
                                                    Divider()
                                                        .padding(.horizontal, 20)
                                                        .padding(.bottom, 10)
                                                    Text("point detail:")
                                                        .font(.title2.bold())
                                                    Text("\(handPoint.detail)")
                                                        .font(.headline)
                                                    Divider()
                                                        .padding(.horizontal, 20)
                                                        .padding(.bottom, 10)
                                                    Text("massage detail:")
                                                        .font(.title2.bold())
                                                    Text("\(handPoint.massageTime)")
                                                        .font(.headline)
                                                }.padding(.leading, 20)
                                                Spacer()
                                            }
                                        }.padding(.top)
                                            .presentationDetents([.medium])
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical, -3)
                            }
                            }.frame(height: 250)
                                .padding()
                        }else{
                            List(){
                                Section("head"){
                                    ForEach($handPoint){ $handPoint in
                                        Button{
                                            selected = handPoint
                                        } label: {
                                            HStack {
                                                Text("\(handPoint.code): \(handPoint.name)")
                                                    .padding()
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .cornerRadius(6)
                                                    .foregroundColor(colorScaheme == .dark ? .white : .black)
                                            }
                                        }.sheet(item: $selected){handPoint in
                                            ZStack {
                                                Color.gray
                                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                    .cornerRadius(10)
                                                .padding(.top, 15)
                                            }
                                            HStack {
                                                Spacer()
                                                Text(handPoint.name)
                                                    .lineLimit(1)
                                                    .minimumScaleFactor(0.1)
                                                    .font(.title.bold())
                                                    .padding(.bottom, -5)
                                                Spacer()
                                            }
                                            ScrollView{
                                                HStack {
                                                    VStack(alignment: .leading) {
                                                        if handPoint.code == 8{
                                                            CodeEig
                                                        }else if handPoint.code == 9{
                                                            CodeNin
                                                        }else if handPoint.code == 10{
                                                            CodeTen
                                                        }else if handPoint.code == 11{
                                                            CodeEle
                                                        }
                                                        Divider()
                                                            .padding(.horizontal, 20)
                                                            .padding(.bottom, 10)
                                                        Text("symptom:")
                                                            .font(.title2.bold())
                                                        Text("\(handPoint.symptom)")
                                                            .font(.headline)
                                                        Divider()
                                                            .padding(.horizontal, 20)
                                                            .padding(.bottom, 10)
                                                        Text("point detail:")
                                                            .font(.title2.bold())
                                                        Text("\(handPoint.detail)")
                                                            .font(.headline)
                                                        Divider()
                                                            .padding(.horizontal, 20)
                                                            .padding(.bottom, 10)
                                                        Text("massage detail:")
                                                            .font(.title2.bold())
                                                        Text("\(handPoint.massageTime)")
                                                            .font(.headline)
                                                    }.padding(.leading, 20)
                                                    Spacer()
                                                }
                                            }.padding(.top)
                                            .presentationDetents([.medium])
                                        }
                                    }
                                }
                            }.padding(.trailing)
                        }
                    }
                }.frame(maxWidth: .infinity)
            }.background(Color(.secondarySystemBackground))
        }
    //}
}

private extension handPointView{
    @ViewBuilder var CodeEig: some View{
        VStack {
            ZStack {
                HStack {
                    Color.clear
                        .frame(height: 100)
                        .frame(width: 100)
                    Image("15061")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 400)
                }
                VStack {
                    Color.clear
                        .frame(height: 130)
                        .frame(maxWidth: 600)
                    HStack {
                        Color.clear
                            .frame(height: 100)
                            .frame(width: 190)
                        Button{
                            //showPopoverb = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }
                    }
                }
            }
        }
    }
    @ViewBuilder var CodeNin: some View{
        VStack(alignment: .leading) {
            ZStack {
                HStack {
                    Color.clear
                        .frame(height: 100)
                        .frame(width: 140)
                    Image("15061")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 400)
                }
                VStack {
                    HStack {
                        Color.clear
                            .frame(height: 100)
                            .frame(width: 140)
                        Button{
                            //showPopovera = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }
                        Color.clear
                            .frame(height: 100)
                            .frame(width: 10)
                    }
                }
            }
        }
    }
    @ViewBuilder var CodeTen: some View{
        VStack(alignment: .leading) {
            ZStack {
                HStack {
                    Color.clear
                        .frame(height: 200)
                        .frame(width: 100)
                    Image("15061")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 400)
                }
                VStack {
                    Color.clear
                        .frame(height: 120)
                        .frame(maxWidth: 600)
                    HStack {
                        Color.clear
                            .frame(height: 200)
                            .frame(width: 160)
                        Button{
                            //showPopovera = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }
                        Color.clear
                            .frame(height: 200)
                            .frame(width: 70)
                        Button{
                            //showPopover = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }
                        Color.clear
                            .frame(height: 200)
                            .frame(width: 110)
                    }
                }
            }
        }
    }
    @ViewBuilder var CodeEle: some View{
        VStack(alignment: .leading) {
            ZStack {
                HStack {
                    Color.clear
                        .frame(height: 300)
                        .frame(width: 60)
                    Image("15071")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 400)
                }
                VStack {
                    Color.clear
                        .frame(height: 200)
                        .frame(maxWidth: 600)
                    HStack {
                        Color.clear
                            .frame(height: 1)
                            .frame(width: 60)
                        Button{
                            //showPopoverd = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }
                    }
                }
            }
        }
    }

}

#Preview {
    handPointView()
}
