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
                                                Text("Point name: Hegu acupoint (合谷穴)")
                                                Text("symptom: Insomnia")
                                                Text("detail: wwwwwww")
                                            }.padding()
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
                                                Text("Point name: Xiangqiang acupoint (項強穴)")
                                                Text("symptom: Insomnia")
                                                Text("detail: wwwwwww")
                                            }.padding()
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
                                                Text("Point name: acupoints for the lower back and legs (腰腿點穴)")
                                                Text("symptom: Insomnia")
                                                Text("detail: wwwwwww")
                                            }.padding()
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
                                                Text("Point name: acupoints for the lower back and legs (腰腿點穴)")
                                                Text("symptom: Insomnia")
                                                Text("detail: wwwwwww")
                                            }.padding()
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
                                            Text("Point name: Neiguan acupoint (內關穴)")
                                            Text("symptom: Insomnia")
                                            Text("detail: wwwwwww")
                                        }.padding()
                                    })
                                }
                            }
                        }.frame(maxWidth: .infinity)
                    }
                    VStack(alignment: .leading) {
                        if shouldVStack{
                            VStack{
                            ScrollView{
                                ForEach($handPoint){ $handPoint in
                                    Button{
                                        showSheet = true
                                    } label: {
                                        HStack {
                                            Text("\(handPoint.code): \(handPoint.name)")
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
                                            Text(handPoint.name)
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
                                                    Text("symptom: \(handPoint.symptom)")
                                                    Text("point detail: \(handPoint.detail)")
                                                    Text("massage detail: \(handPoint.massageTime)")
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
                                            showSheet = true
                                        } label: {
                                            HStack {
                                                Text("\(handPoint.code): \(handPoint.name)")
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
                                                Text(handPoint.name)
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
                                                        Text("symptom: \(handPoint.symptom)")
                                                        Text("point detail: \(handPoint.detail)")
                                                        Text("massage detail: \(handPoint.massageTime)")
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
    handPointView()
}
