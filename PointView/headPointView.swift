//
//  headPointView.swift
//  SelfPointMassageApp
//
//  Created by 許君愷 on 2024/1/23.
//

import SwiftUI

struct headPointView: View {
    @State private var headPoint = Point.hexamples
    @State private var showSheet = false
    @State private var showPopovera = false
    @State private var showPopoverb = false
    @State private var showPopoverc = false
    @State private var showPopoverd = false
    @Environment (\.colorScheme) var colorScaheme
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView{
                let shouldVStack = geometry.size.width <= geometry.size.height
                
                let layout = shouldVStack ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
                layout {
                    ZStack {
                        Image("194")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 600)
                        .navigationTitle("Head Point")
                        VStack {
                            Button{
                                showPopoverd = true
                            } label:{
                                Text("4")
                                    .font(.title3.bold())
                                    .frame(width: 30, height: 30)
                                    .background(Color.red)
                                    .cornerRadius(50)
                            }.popover(isPresented: $showPopoverd, content: {
                                VStack(alignment: .leading) {
                                    Text("Point name: Baihui acupoint (百會穴)")
                                    Text("symptom: Insomnia")
                                    Text("detail: wwwwwww")
                                }.padding()
                            })
                            Color.clear
                                .frame(width: 200, height: 50)
                            HStack {
                                Button{
                                    showPopovera = true
                                } label:{
                                    Text("1")
                                        .font(.title3.bold())
                                        .frame(width: 30, height: 30)
                                        .background(Color.red)
                                        .cornerRadius(50)
                                }.popover(isPresented: $showPopovera, content: {
                                    VStack(alignment: .leading) {
                                        Text("Point name: Yintang acupoint (印堂穴)")
                                        Text("symptom: Insomnia")
                                        Text("detail: wwwwwww")
                                    }.padding()
                                })
                                Color.clear
                                    .frame(width: 70, height: 50)
                                VStack {
                                    Color.clear
                                        .frame(width: 10, height: 10)
                                    Button{
                                        showPopoverb = true
                                    } label:{
                                        Text("2")
                                            .font(.title3.bold())
                                            .frame(width: 30, height: 30)
                                            .background(Color.red)
                                            .cornerRadius(50)
                                    }.popover(isPresented: $showPopoverb, content: {
                                        VStack(alignment: .leading) {
                                            Text("Point name: temples acupoint (太陽穴)")
                                            Text("symptom: Insomnia")
                                            Text("detail: wwwwwww")
                                        }.padding()
                                })
                                }
                                Color.clear
                                    .frame(width: 200, height: 50)
                            }
                            Color.clear
                                .frame(width: 100, height: 70)
                            HStack {
                                Color.clear
                                    .frame(width: 100, height: 30)
                                Button{
                                    showPopoverc = true
                                } label:{
                                    Text("3")
                                        .font(.title3.bold())
                                        .frame(width: 30, height: 30)
                                        .background(Color.red)
                                        .cornerRadius(50)
                                }.popover(isPresented: $showPopoverc, content: {
                                    VStack(alignment: .leading) {
                                        Text("Point name: Fengchi acupoint (風池穴)")
                                        Text("symptom: Insomnia")
                                        Text("detail: wwwwwww")
                                    }.padding()
                            })
                            }
                            Color.clear
                                .frame(width: 100, height: 90)
                        }
                        
                    }
                    VStack(alignment: .leading) {
                        if shouldVStack{
                            ForEach($headPoint){ $headPoint in
                                Button{
                                    showSheet = true
                                } label: {
                                    HStack {
                                        Text("\(headPoint.code): \(headPoint.name)")
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
                                        Text(headPoint.name)
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
                                                Text("symptom: \(headPoint.symptom)")
                                                Text("point detail: \(headPoint.detail)")
                                                Text("massage detail: \(headPoint.massageTime)")
                                            }.padding(.leading, 20)
                                            Spacer()
                                        }
                                    }.padding(.top)
                                    .presentationDetents([.medium])
                                }
                            }.padding(.horizontal)
                                .padding(.vertical, -3)
                        }else{
                            List(){
                                Section("head"){
                                    ForEach($headPoint){ $headPoint in
                                        Button{
                                            showSheet = true
                                        } label: {
                                            HStack {
                                                Text("\(headPoint.code): \(headPoint.name)")
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
                                                Text(headPoint.name)
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
                                                        Text("symptom: \(headPoint.symptom)")
                                                        Text("point detail: \(headPoint.detail)")
                                                        Text("massage detail: \(headPoint.massageTime)")
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
    }
}

#Preview {
    headPointView()
}
