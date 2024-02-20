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
    
    @State private var selected: Point?
    
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
                                                Text("Point name:")
                                                Text("Tianshu acupoint")
                                                    .font(.title3)
                                                Text("symptom:")
                                                Text("The Tianshu acupoint is commonly used to alleviate abdominal discomfort, pain, bloating, and other digestive issues. Massaging this acupoint is believed to promote blood circulation in the abdominal region, regulate gastrointestinal function, and relieve symptoms related to the digestive system.")
                                                    .font(.title3)
                                                Text("detail:")
                                                Text("Located on both sides of the abdomen, approximately three finger-widths away from the navel.")
                                                    .font(.title3)
                                            }.padding()
                                                .frame(width: 600)
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
                                                Text("Point name:")
                                                Text("Tianshu acupoint")
                                                    .font(.title3)
                                                Text("symptom:")
                                                Text("The Tianshu acupoint is commonly used to alleviate abdominal discomfort, pain, bloating, and other digestive issues. Massaging this acupoint is believed to promote blood circulation in the abdominal region, regulate gastrointestinal function, and relieve symptoms related to the digestive system.")
                                                    .font(.title3)
                                                Text("detail:")
                                                Text("Located on both sides of the abdomen, approximately three finger-widths away from the navel.")
                                                    .font(.title3)
                                            }.padding()
                                                .frame(width: 600)
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
                                            Text("Point name:")
                                            Text("Zhongwan acupoint")
                                                .font(.title3)
                                            Text("symptom:")
                                            Text("Zhongwan acupoint is an important point for regulating gastrointestinal function. Massaging Zhongwan is believed to help alleviate stomach discomfort, stomach pain, and loss of appetite. Additionally, it can be used to relieve symptoms related to the digestive system and promote the normal functioning of the digestive system.")
                                                .font(.title3)
                                            Text("detail:")
                                            Text("Located on the abdomen, approximately four finger-widths above the navel. It can also be described as being about four horizontal fingers above the belly button.")
                                                .font(.title3)
                                        }.padding()
                                            .frame(width: 600)
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
                                        Text("Point name:")
                                        Text("Yaoyan acupoint")
                                            .font(.title3)
                                        Text("symptom:")
                                        Text("Yaoyan acupoint is utilized for relieving discomfort and pain in the lumbar region. Massaging Yaoyan is believed to help relax the muscles in the lower back, alleviate tension around the lumbar vertebrae, and provide relief for issues such as lower back pain and stiffness.")
                                            .font(.title3)
                                        Text("detail:")
                                        Text("Located in the lumbar region, approximately three horizontal fingers below the lower edge of the lumbar vertebrae. It is generally described as being beside the spine, about three horizontal fingers away from the lower edge of the lumbar vertebrae.")
                                            .font(.title3)
                                    }.padding()
                                        .frame(width: 600)
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
                                        Text("Point name:")
                                        Text("Yaoyan acupoint")
                                            .font(.title3)
                                        Text("symptom:")
                                        Text("Yaoyan acupoint is utilized for relieving discomfort and pain in the lumbar region. Massaging Yaoyan is believed to help relax the muscles in the lower back, alleviate tension around the lumbar vertebrae, and provide relief for issues such as lower back pain and stiffness.")
                                            .font(.title3)
                                        Text("detail:")
                                        Text("Located in the lumbar region, approximately three horizontal fingers below the lower edge of the lumbar vertebrae. It is generally described as being beside the spine, about three horizontal fingers away from the lower edge of the lumbar vertebrae.")
                                            .font(.title3)
                                    }.padding()
                                        .frame(width: 600)
                            })
                            }
                        }
                    }
                }.frame(maxWidth: .infinity)
                            .font(.title3.bold())
                    }
                    VStack(alignment: .leading) {
                        if shouldVStack{
                            VStack{
                            ScrollView{
                            ForEach($bodyPoint){ $bodyPoint in
                                Button{
                                    selected = bodyPoint
                                } label: {
                                    HStack {
                                        Text("\(bodyPoint.code): \(bodyPoint.name)")
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .cornerRadius(6)
                                            .foregroundColor(colorScaheme == .dark ? .white : .black)
                                            .background(Color.white)
                                    }
                                }.sheet(item: $selected){bodyPoint in
                                    ZStack {
                                        Color.gray
                                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .cornerRadius(10)
                                        .padding(.top, 15)
                                    }
                                    HStack {
                                        Spacer()
                                        Text(bodyPoint.name)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.1)
                                            .font(.title.bold())
                                            .padding(.bottom, -5)
                                        Spacer()
                                    }
                                    ScrollView{
                                        HStack {
                                            VStack(alignment: .leading) {
                                                if bodyPoint.code == 5{
                                                    CodeFif
                                                }else if bodyPoint.code == 6{
                                                    CodeSix
                                                }else if bodyPoint.code == 7{
                                                    CodeSev
                                                }
                                                Divider()
                                                    .padding(.horizontal, 20)
                                                    .padding(.bottom, 10)
                                                Text("symptom: ")
                                                    .font(.title2.bold())
                                                Text("\(bodyPoint.symptom)")
                                                    .font(.headline)
                                                Divider()
                                                    .padding(.horizontal, 20)
                                                    .padding(.bottom, 10)
                                                Text("point detail:")
                                                    .font(.title2.bold())
                                                Text("\(bodyPoint.detail)")
                                                    .font(.headline)
                                                Divider()
                                                    .padding(.horizontal, 20)
                                                    .padding(.bottom, 10)
                                                Text("massage detail:")
                                                    .font(.title2.bold())
                                                Text("\(bodyPoint.massageTime)")
                                                    .font(.headline)
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
                                            selected = bodyPoint
                                        } label: {
                                            HStack {
                                                Text("\(bodyPoint.code): \(bodyPoint.name)")
                                                    .padding()
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .cornerRadius(6)
                                                    .foregroundColor(colorScaheme == .dark ? .white : .black)
                                            }
                                        }.sheet(item: $selected){bodyPoint in
                                            ZStack {
                                                Color.gray
                                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                    .cornerRadius(10)
                                                .padding(.top, 15)
                                            }
                                            HStack {
                                                Spacer()
                                                Text(bodyPoint.name)
                                                    .lineLimit(1)
                                                    .minimumScaleFactor(0.1)
                                                    .font(.title.bold())
                                                    .padding(.bottom, -5)
                                                Spacer()
                                            }
                                            ScrollView{
                                                HStack {
                                                    VStack(alignment: .leading) {
                                                        if bodyPoint.code == 5{
                                                            CodeFif
                                                        }else if bodyPoint.code == 6{
                                                            CodeSix
                                                        }else if bodyPoint.code == 7{
                                                            CodeSev
                                                        }
                                                        Divider()
                                                            .padding(.horizontal, 20)
                                                            .padding(.bottom, 10)
                                                        Text("symptom: ")
                                                            .font(.title2.bold())
                                                        Text("\(bodyPoint.symptom)")
                                                            .font(.headline)
                                                        Divider()
                                                            .padding(.horizontal, 20)
                                                            .padding(.bottom, 10)
                                                        Text("point detail:")
                                                            .font(.title2.bold())
                                                        Text("\(bodyPoint.detail)")
                                                            .font(.headline)
                                                        Divider()
                                                            .padding(.horizontal, 20)
                                                            .padding(.bottom, 10)
                                                        Text("massage detail:")
                                                            .font(.title2.bold())
                                                        Text("\(bodyPoint.massageTime)")
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

private extension bodyPointView {
    @ViewBuilder var CodeFif: some View{
        VStack(alignment: .leading) {
            ZStack {
                HStack {
                    Color.clear
                        .frame(height: 10)
                        .frame(width: 30)
                    Image("15041")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 400)
                }
                VStack {
                    Color.clear
                        .frame(height: 300)
                        .frame(maxWidth: 600)
                    HStack {
                        Color.clear
                            .frame(height: 10)
                            .frame(width: 30)
                        Button{
                            //showPopovera = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }
                        Color.clear
                            .frame(height: 10)
                            .frame(width: 70)
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
    @ViewBuilder var CodeSix: some View{
        VStack(alignment: .leading) {
            ZStack {
                HStack {
                    Color.clear
                        .frame(height: 10)
                        .frame(width: 30)
                    Image("15041")
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
                            .frame(height: 10)
                            .frame(width: 30)
                        Button{
                            //showPopoverc = true
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
    @ViewBuilder var CodeSev: some View{
        VStack(alignment: .leading) {
            ZStack {
                HStack {
                    Color.clear
                        .frame(height: 10)
                        .frame(width: 120)
                    Image("15051")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 400)
                }
                VStack {
                    Color.clear
                        .frame(height: 270)
                        .frame(width: 30)
                    HStack {
                        Color.clear
                            .frame(height: 10)
                            .frame(width: 130)
                        Button{
                            //showPopoverb = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }
                        Color.clear
                            .frame(height: 10)
                            .frame(width: 110)
                        Button{
                            //showPopoverc = true
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
    bodyPointView()
}
