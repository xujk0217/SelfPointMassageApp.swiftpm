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
    
    @State private var selected: Point?
    
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
                                    Text("Point name:")
                                    Text("Baihui acupoint")
                                        .font(.title3)
                                    Text("symptom:")
                                    Text("It is believed to be associated with regulating the nervous system, enhancing consciousness, and promoting overall harmony within the body's meridians and blood circulation.")
                                        .font(.title3)
                                    Text("detail:")
                                    Text("At the top of the head, at the intersection point of the midline and the line connecting the anterior hairline and the midpoint of the head.")
                                        .font(.title3)
                                }.padding()
                                    .frame(width: 600)
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
                                        Text("Point name:")
                                        Text("Yintang acupoint")
                                            .font(.title3)
                                        Text("symptom:")
                                        Text("Commonly used to alleviate forehead discomfort, promote mental clarity, and is believed to benefit relaxation and relieve stress.")
                                            .font(.title3)
                                        Text("detail:")
                                        Text("In the center between the eyebrows, precisely at the midpoint of the forehead.")
                                            .font(.title3)
                                    }.padding()
                                        .frame(width: 600)
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
                                            Text("Point name:")
                                            Text("temples acupoint")
                                                .font(.title3)
                                            Text("symptom:")
                                            Text("Used for relieving headaches, migraines, and eye discomfort. Massaging the temples helps relax head muscles, improve blood circulation, and alleviate tension.")
                                                .font(.title3)
                                            Text("detail:")
                                            Text("Approximately 1 inch behind the temples, find the hollow area known as the Temples.")
                                                .font(.title3)
                                        }.padding()
                                            .frame(width: 600)
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
                                        Text("Point name:")
                                        Text("Fengchi acupoint")
                                            .font(.title3)
                                        Text("symptom:")
                                        Text("Known for regulating blood pressure, relieving discomfort in the back of the head, and improving overall head and neck well-being.")
                                            .font(.title3)
                                        Text("detail:")
                                        Text("On both sides of the neck, slightly below the level of the cervical vertebrae.")
                                            .font(.title3)
                                    }.padding()
                                        .frame(width: 600)
                            })
                            }
                            Color.clear
                                .frame(width: 100, height: 90)
                        }.font(.title3.bold())
                        
                    }
                    VStack(alignment: .leading) {
                        if shouldVStack{
                            ForEach($headPoint){ $headPoint in
                                Button{
                                    selected = headPoint
                                } label: {
                                    HStack {
                                        Text("\(headPoint.code): \(headPoint.name)")
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .cornerRadius(6)
                                            .foregroundColor(colorScaheme == .dark ? .white : .black)
                                            .background(Color.white)
                                    }
                                }.sheet(item: $selected){headPoint in
                                    ZStack {
                                        Color.gray
                                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .cornerRadius(10)
                                        .padding(.top, 15)
                                    }
                                    HStack {
                                        //Text("")
                                        //    .frame(width: 50)
                                        Spacer()
                                        Text(headPoint.name)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.1)
                                            .font(.title.bold())
                                            .padding(.bottom, -5)
                                        Spacer()
                                        /*
                                        Button{
                                            dismiss()
                                        }label: {
                                            Text("close")
                                                .padding(.horizontal)
                                        }
                                         */
                                    }
                                    ScrollView{
                                        HStack {
                                            VStack(alignment: .leading) {
                                                if headPoint.code == 1{
                                                    CodeOne
                                                }else if headPoint.code == 2{
                                                    CodeTwo
                                                }else if headPoint.code == 3{
                                                    CodeThree
                                                }else if headPoint.code == 4{
                                                    CodeFour
                                                }
                                                Divider()
                                                    .padding(.horizontal, 20)
                                                    .padding(.bottom, 10)
                                                Text("symptom:")
                                                    .font(.title2.bold())
                                                Text("\(headPoint.symptom)")
                                                    .font(.headline)
                                                Divider()
                                                    .padding(.horizontal, 20)
                                                    .padding(.bottom, 10)
                                                Text("point detail:")
                                                    .font(.title2.bold())
                                                Text("\(headPoint.detail)")
                                                    .font(.headline)
                                                Divider()
                                                    .padding(.horizontal, 20)
                                                    .padding(.bottom, 10)
                                                Text("massage detail:")
                                                    .font(.title2.bold())
                                                Text("\(headPoint.massageTime)")
                                                    .font(.headline)
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
                                            selected = headPoint
                                        } label: {
                                            HStack {
                                                Text("\(headPoint.code): \(headPoint.name)")
                                                    .padding()
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .cornerRadius(6)
                                                    .foregroundColor(colorScaheme == .dark ? .white : .black)
                                            }
                                        }.sheet(item: $selected){headPoint in
                                            ZStack {
                                                Color.gray
                                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                    .cornerRadius(10)
                                                .padding(.top, 15)
                                            }
                                            HStack {
                                                //Text("")
                                                //    .frame(width: 50)
                                                Spacer()
                                                Text(headPoint.name)
                                                    .lineLimit(1)
                                                    .minimumScaleFactor(0.1)
                                                    .font(.title.bold())
                                                    .padding(.bottom, -5)
                                                Spacer()
                                                /*
                                                Button{
                                                    dismiss()
                                                }label: {
                                                    Text("close")
                                                        .padding(.horizontal)
                                                }
                                                Image(systemName: "xmark.circle.fill")
                                                    .padding(.horizontal)
                                                    .onTapGesture {
                                                        dismiss()
                                                    }
                                                 */
                                            }
                                            ScrollView{
                                                HStack {
                                                    VStack(alignment: .leading) {
                                                        if headPoint.code == 1{
                                                            CodeOne
                                                        }else if headPoint.code == 2{
                                                            CodeTwo
                                                        }else if headPoint.code == 3{
                                                            CodeThree
                                                        }else if headPoint.code == 4{
                                                            CodeFour
                                                        }
                                                        Divider()
                                                            .padding(.horizontal, 20)
                                                            .padding(.bottom, 10)
                                                        Text("symptom:")
                                                            .font(.title2.bold())
                                                        Text("\(headPoint.symptom)")
                                                            .font(.headline)
                                                        Divider()
                                                            .padding(.horizontal, 20)
                                                            .padding(.bottom, 10)
                                                        Text("point detail:")
                                                            .font(.title2.bold())
                                                        Text("\(headPoint.detail)")
                                                            .font(.headline)
                                                        Divider()
                                                            .padding(.horizontal, 20)
                                                            .padding(.bottom, 10)
                                                        Text("massage detail:")
                                                            .font(.title2.bold())
                                                        Text("\(headPoint.massageTime)")
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
    }
}

private extension headPointView{
    @ViewBuilder var CodeOne: some View{
        VStack() {
            ZStack {
                HStack {
                    Color.clear
                        .frame(height: 10)
                        .frame(width: 70)
                    Image("195")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 400)
                }
                VStack {
                    HStack {
                        Color.clear
                            .frame(height: 10)
                            .frame(width: 60)
                        Button{
                            //showPopovera = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }
                    }
                    Color.clear
                        .frame(height: 100)
                        .frame(maxWidth: 600)
                }
            }
        }.padding(.top, -50)
    }
    @ViewBuilder var CodeTwo: some View{
        VStack(alignment: .leading) {
            ZStack {
                HStack {
                    Color.clear
                        .frame(height: 1)
                        .frame(width: 50)
                    Image("194")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 400)
                }
                VStack {
                    HStack {
                        Button{
                            //showPopoverb = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }
                    }
                    Color.clear
                        .frame(height: 40)
                        .frame(maxWidth: 600)
                }
            }
        }.padding(.top, -50)
    }
    @ViewBuilder var CodeThree: some View{
        VStack(alignment: .leading) {
            ZStack {
                HStack {
                    Color.clear
                        .frame(height: 1)
                        .frame(width: 120)
                    Image("194")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 400)
                }
                VStack {
                    Color.clear
                        .frame(height: 100)
                        .frame(maxWidth: 60)
                    HStack {
                        Color.clear
                            .frame(height: 100)
                            .frame(width: 180)
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
        }.padding(.top, -50)
    }
    @ViewBuilder var CodeFour: some View{
        VStack(alignment: .leading) {
            ZStack {
                HStack {
                    Color.clear
                        .frame(height: 1)
                        .frame(width: 50)
                    Image("194")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 400)
                }
                VStack {
                    HStack {
                        Color.clear
                            .frame(height: 1)
                            .frame(width: 30)
                        Button{
                            //showPopoverb = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }
                    }
                    Color.clear
                        .frame(height: 200)
                        .frame(maxWidth: 600)
                }
            }
        }.padding(.top, -50)
    }
}



#Preview {
    headPointView()
}
