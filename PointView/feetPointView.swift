//
//  feetPointView.swift
//  SelfPointMassageApp
//
//  Created by 許君愷 on 2024/1/23.
//

import SwiftUI

struct feetPointView: View {
    @State private var feetPoint = Point.fexamples
    @State private var showSheet = false
    @State private var showPopovera = false
    @State private var showPopoverb = false
    @State private var showPopoverc = false
    @State private var showPopoverd = false
    @Environment (\.colorScheme) var colorScaheme
    
    var body: some View {
        GeometryReader { geometry in
                let shouldVStack = geometry.size.width <= geometry.size.height
                
                let layout = shouldVStack ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
                layout {
                    ScrollView{
                        VStack{
                            ZStack {
                                Image("1502")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 600)
                                .navigationTitle("Feet Point")
                                VStack {
                                    Button{
                                        showPopoverc = true
                                    } label:{
                                        Text("12")
                                            .font(.title3.bold())
                                            .frame(width: 30, height: 30)
                                            .background(Color.red)
                                            .cornerRadius(50)
                                    }.popover(isPresented: $showPopoverc, content: {
                                        VStack(alignment: .leading) {
                                            Text("Point name: Yongquan acupoint (湧泉穴)")
                                            Text("symptom: The Yongquan acupoint is part of the Kidney Meridian and is believed to be beneficial for regulating kidney energy and promoting the flow of the kidney meridian. This acupoint is often used to alleviate symptoms such as insomnia, anxiety, headaches, and dizziness.")
                                            Text("detail: Located on the sole of the foot, in the depression between the second and third toes, about one-third from the front of the foot.")
                                        }.padding()
                                            .frame(width: 600)
                                    })
                                    Color.clear
                                        .frame(height: 100)
                                        .frame(maxWidth: 600)
                                }
                            }
                            ZStack {
                                Image("15081")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 600)
                                VStack {
                                    HStack {
                                        Color.clear
                                            .frame(height: 50)
                                            .frame(width: 320)
                                        Button{
                                            showPopovera = true
                                        } label:{
                                            Text("13")
                                                .font(.title3.bold())
                                                .frame(width: 30, height: 30)
                                                .background(Color.red)
                                                .cornerRadius(50)
                                        }.popover(isPresented: $showPopovera, content: {
                                            VStack(alignment: .leading) {
                                                Text("Point name: Zusanli acupoint (足三里穴)")
                                                Text("symptom: Zusanli acupoint is part of the Stomach Meridian in traditional Chinese medicine. It is believed to be beneficial for strengthening the spleen and stomach functions, regulating gastrointestinal digestion, and enhancing the immune system. Additionally, Zusanli acupoint is often used to alleviate fatigue, boost energy, and reduce stress.")
                                                Text("detail: Located below the knee, three fingers below the lower edge of the fibula head, approximately four fingers away from the knee joint. It is situated in the depression between the lower edge of the fibula head and the anterior margin of the tibia.")
                                            }.padding()
                                                .frame(width: 600)
                                    })
                                    }
                                    Color.clear
                                        .frame(height: 50)
                                        .frame(maxWidth: 600)
                                }
                            }
                        }.frame(maxWidth: .infinity)
                    }
                    VStack(alignment: .leading) {
                        if shouldVStack{
                            VStack{
                            ScrollView{
                            ForEach($feetPoint){ $feetPoint in
                                Button{
                                    showSheet = true
                                } label: {
                                    HStack {
                                        Text("\(feetPoint.code): \(feetPoint.name)")
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .cornerRadius(6)
                                            .foregroundColor(colorScaheme == .dark ? .white : .black)
                                            .background(Color.white)
                                    }
                                }.sheet(isPresented: $showSheet){
                                    ZStack {
                                        Color.gray
                                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .cornerRadius(10)
                                        .padding(.top, 15)
                                    }
                                    HStack {
                                        Text("")
                                            .frame(width: 50)
                                        Spacer()
                                        Text(feetPoint.name)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.1)
                                            .font(.title.bold())
                                            .padding(.bottom, -5)
                                        Spacer()
                                        Button{
                                            showSheet = false
                                        }label: {
                                            Text("close")
                                                .padding(.horizontal)
                                        }
                                    }
                                    ScrollView{
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Text("symptom: \(feetPoint.symptom)")
                                                Text("point detail: \(feetPoint.detail)")
                                                Text("massage detail: \(feetPoint.massageTime)")
                                            }.padding(.leading, 20)
                                            Spacer()
                                        }
                                    }.padding(.top)
                                    .presentationDetents([.medium])
                                }
                            }.padding(.horizontal)
                                .padding(.vertical, -3)
                            }
                            }.frame(height: 130)
                                .padding()
                        }else{
                            List(){
                                Section("head"){
                                    ForEach($feetPoint){ $feetPoint in
                                        Button{
                                            showSheet = true
                                        } label: {
                                            HStack {
                                                Text("\(feetPoint.code): \(feetPoint.name)")
                                                    .padding()
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .cornerRadius(6)
                                                    .foregroundColor(colorScaheme == .dark ? .white : .black)
                                            }
                                        }.sheet(isPresented: $showSheet){
                                            ZStack {
                                                Color.gray
                                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                    .cornerRadius(10)
                                                .padding(.top, 15)
                                            }
                                            HStack {
                                                Text("")
                                                    .frame(width: 50)
                                                Spacer()
                                                Text(feetPoint.name)
                                                    .lineLimit(1)
                                                    .minimumScaleFactor(0.1)
                                                    .font(.title.bold())
                                                    .padding(.bottom, -5)
                                                Spacer()
                                                Button{
                                                    showSheet = false
                                                }label: {
                                                    Text("close")
                                                        .padding(.horizontal)
                                                }
                                            }
                                            ScrollView{
                                                HStack {
                                                    VStack(alignment: .leading) {
                                                        Text("symptom: \(feetPoint.symptom)")
                                                        Text("point detail: \(feetPoint.detail)")
                                                        Text("massage detail: \(feetPoint.massageTime)")
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

#Preview {
    feetPointView()
}
