//
//  bodyPointView.swift
//  SelfPointMassageApp
//
//  Created by 許君愷 on 2024/1/23.
//

import SwiftUI

struct bodyPointView: View {
    @State private var bodyPoint = Point.bexamples
    @State private var showSheet = false
    @State private var showPopover = false
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
                        VStack {
                            ZStack {
                                Image("15041")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 600)
                                    .navigationTitle("Body Point")
                                VStack {
                                    Color.clear
                                        .frame(height: 450)
                                        .frame(maxWidth: 600)
                                    HStack {
                                        Button{
                                            showPopover = true
                                        } label:{
                                            Text("5")
                                                .font(.title3.bold())
                                                .frame(width: 30, height: 30)
                                                .background(Color.red)
                                                .cornerRadius(50)
                                        }.popover(isPresented: $showPopover, content: {
                                            VStack(alignment: .leading) {
                                                Text("Point name: Tianshu acupoint (天樞穴)")
                                                Text("symptom: Insomnia")
                                                Text("detail: wwwwwww")
                                            }.padding()
                                        })
                                        Color.clear
                                            .frame(height: 10)
                                            .frame(width: 120)
                                        Button{
                                            showPopoverb = true
                                        } label:{
                                            Text("5")
                                                .font(.title3.bold())
                                                .frame(width: 30, height: 30)
                                                .background(Color.red)
                                                .cornerRadius(50)
                                        }.popover(isPresented: $showPopoverb, content: {
                                            VStack(alignment: .leading) {
                                                Text("Point name: Tianshu acupoint (天樞穴)")
                                                Text("symptom: Insomnia")
                                                Text("detail: wwwwwww")
                                            }.padding()
                                        })
                                        Color.clear
                                            .frame(height: 10)
                                            .frame(width: 2)
                                    }
                                }
                                VStack {
                                    Color.clear
                                        .frame(height: 200)
                                        .frame(maxWidth: 600)
                                    Button{
                                        showPopoverc = true
                                    } label:{
                                        Text("6")
                                            .font(.title3.bold())
                                            .frame(width: 30, height: 30)
                                            .background(Color.red)
                                            .cornerRadius(50)
                                    }.popover(isPresented: $showPopoverc, content: {
                                        VStack(alignment: .leading) {
                                            Text("Point name: Zhongwan acupoint (中脘穴)")
                                            Text("symptom: Insomnia")
                                            Text("detail: wwwwwww")
                                        }.padding()
                                    })
                                }
                            }
                    ZStack {
                        Image("15051")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 600)
                        VStack {
                            Color.clear
                                .frame(height: 400)
                                .frame(maxWidth: 600)
                            HStack {
                                Button{
                                    showPopovera = true
                                } label:{
                                    Text("7")
                                        .font(.title3.bold())
                                        .frame(width: 30, height: 30)
                                        .background(Color.red)
                                        .cornerRadius(50)
                                }.popover(isPresented: $showPopovera, content: {
                                    VStack(alignment: .leading) {
                                        Text("Point name: Yaoyan acupoint (腰眼穴)")
                                        Text("symptom: Insomnia")
                                        Text("detail: wwwwwww")
                                    }.padding()
                            })
                                Color.clear
                                    .frame(height: 400)
                                    .frame(width: 170)
                                Button{
                                    showPopoverd = true
                                } label:{
                                    Text("7")
                                        .font(.title3.bold())
                                        .frame(width: 30, height: 30)
                                        .background(Color.red)
                                        .cornerRadius(50)
                                }.popover(isPresented: $showPopoverd, content: {
                                    VStack(alignment: .leading) {
                                        Text("Point name: Yaoyan acupoint (腰眼穴)")
                                        Text("symptom: Insomnia")
                                        Text("detail: wwwwwww")
                                    }.padding()
                            })
                            }
                        }
                    }
                }.frame(maxWidth: .infinity)
                    }
                    VStack(alignment: .leading) {
                        if shouldVStack{
                            VStack{
                            ScrollView{
                            ForEach($bodyPoint){ $bodyPoint in
                                Button{
                                    showSheet = true
                                } label: {
                                    HStack {
                                        Text("\(bodyPoint.code): \(bodyPoint.name)")
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
                                        Text(bodyPoint.name)
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
                                                Text("symptom: \(bodyPoint.symptom)")
                                                Text("point detail: \(bodyPoint.detail)")
                                                Text("massage detail: \(bodyPoint.massageTime)")
                                            }.padding(.leading, 20)
                                            Spacer()
                                        }
                                    }.padding(.top)
                                    .presentationDetents([.medium])
                                }
                            }.padding(.horizontal)
                                .padding(.vertical, -3)
                            }
                            }.frame(height: 200)
                                .padding()
                        }else{
                            List(){
                                Section("head"){
                                    ForEach($bodyPoint){ $bodyPoint in
                                        Button{
                                            showSheet = true
                                        } label: {
                                            HStack {
                                                Text("\(bodyPoint.code): \(bodyPoint.name)")
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
                                                Text(bodyPoint.name)
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
                                                        Text("symptom: \(bodyPoint.symptom)")
                                                        Text("point detail: \(bodyPoint.detail)")
                                                        Text("massage detail: \(bodyPoint.massageTime)")
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
    /*
    var body: some View {
        ScrollView{
            VStack {
                Image("896")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 900)
                    .navigationTitle("Body Point")
            }.frame(maxWidth: .infinity)
        }.background(Color(.secondarySystemBackground))
    }
     */
}

#Preview {
    bodyPointView()
}
