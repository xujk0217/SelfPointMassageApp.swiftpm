import SwiftUI

struct ContentView: View {
    @State private var whichView = 1
    @State private var hsym = Symptom.hSymExamples
    @State private var bsym = Symptom.bSymExamples
    @State private var osym = Symptom.oSymExamples
    @State private var showPopover = false
    
    @State private var shouldShowTips = false
    
    @Environment (\.colorScheme) var colorScaheme
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack{
                VStack {
                    Apptitle
                    barButton
                    if whichView == 1{
                        symptomView
                    }else if whichView == 2{
                        pointView
                    }else if whichView == 3{
                        ScrollView{
                            VStack{
                            Image("1434")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 600)
                                NavigationLink(destination: ARDetailView()){
                                    Text("Start AR point map!!")
                                        .font(geometry.size.width >= 400 ? .title.bold(): .title2.bold())
                                        .frame(width: geometry.size.width >= 400 ? geometry.size.width-100: geometry.size.width-50, height: 100, alignment: .center)
                                        .frame(maxWidth: 700)
                                        .foregroundColor(.white)
                                        .background(Color.accentColor.opacity(0.8))
                                        .cornerRadius(50)
                                        .padding()
                                }
                            }.frame(maxWidth: .infinity)
                        }
                    }else if whichView == 4{
                        Text("How to use this app?")
                            .font(.title2.bold())
                        tipsView
                    }
                    
                }.background(Color(.secondarySystemBackground))
            }
        }
    }
}


// MARK: - Subview
private extension ContentView{
    var Apptitle: some View{
        HStack {
            Text("Self Point Massage")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            Button{
                shouldShowTips = true
                if whichView == 4{
                    whichView = 1
                }
            } label: {
                Image(systemName: "questionmark.circle.fill")
                    .padding(.horizontal)
                    .font(.title2)
            }
            .sheet(isPresented: $shouldShowTips){
                VStack {
                    Color.gray
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                        .padding(.top, 15)
                    HStack {
                        Text("")
                            .frame(width: 50)
                        Spacer()
                        Text("How to use this app?")
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                            .font(.title.bold())
                            .padding(.bottom, -5)
                        Spacer()
                        Button{
                            shouldShowTips = false
                        }label: {
                            Text("skip")
                                .padding(.horizontal)
                        }
                    }
                    tipsView
                }
            }
        }
    }
    
    @ViewBuilder var barButton: some View{
        HStack(alignment: .top) {
            Button() {
                whichView = 1
            }label: {
                VStack {
                    Text("Symptom")
                        .font(.headline)
                        .padding(.horizontal, 10)
                        .foregroundColor(whichView == 1 ? .accentColor : .gray)
                }
            }
            
            Button{
                whichView = 2
            }label: {
                VStack {
                    Text("Point")
                        .font(.headline)
                        .padding(.horizontal, 10)
                        .foregroundColor(whichView == 2 ? .accentColor : .gray)
                }
            }
            
            Button{
                whichView = 3
            }label: {
                VStack {
                    Text("AR")
                        .font(.headline)
                        .padding(.horizontal, 10)
                        .foregroundColor(whichView == 3 ? .accentColor : .gray)
                }
            }
            Button{
                whichView = 4
            }label: {
                VStack {
                    Text("Tips")
                        .font(.headline)
                        .padding(.horizontal, 10)
                        .foregroundColor(whichView == 4 ? .accentColor : .gray)
                }
            }
            Spacer()
        }.padding(.horizontal)
        Divider().padding(.horizontal, 20)
    }
    
    @ViewBuilder var symptomView: some View{
        Text("What's bothering you today?")
            .font(.title3.bold())
            .padding(.top)
        VStack(alignment: .leading) {
            List() {
                Section("Head"){
                    ForEach($hsym) { $hsym in
                        NavigationLink {
                            ScrollView{
                                VStack {
                                    VStack(alignment: .leading){
                                        HStack(alignment: .center) {
                                                VStack(alignment: .leading){
                                                    Text("name: \(hsym.symptom)")
                                                        .padding(.bottom)
                                                    Text("symptom detail: \(hsym.exDetail)")
                                                        .padding(.bottom)
                                                }
                                            }
                                        if hsym.pointCode == "A"{
                                            VStack {
                                                CodeOne
                                                CodeTwo
                                                CodeThree
                                            }
                                        }
                                        if hsym.pointCode == "B"{
                                            VStack {
                                                CodeNin
                                            }
                                        }
                                    }
                                        .padding()
                                        .font(.headline)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                            }
                            //.background(Color(.secondarySystemBackground))
                            .navigationTitle(hsym.symptom)
                        } label: {
                            HStack {
                                Image(hsym.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 150)
                                Text(hsym.symptom)
                                    .padding(.vertical, 10)
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                    //.background(colorScaheme == .dark ? Color(red: 1, green: 1, blue: 1, opacity: 0.1) : Color(red: 1, green: 1, blue: 1, opacity: 1))
                                    .cornerRadius(6)
                                    .foregroundColor(colorScaheme == .dark ? .white : .black)
                            }.padding(.vertical, -5)
                        }
                    }
                }
                Section("Body"){
                    ForEach($bsym) { $bsym in
                        NavigationLink {
                            ScrollView{
                                VStack {
                                    VStack(alignment: .leading){
                                        HStack(alignment: .center) {
                                                VStack(alignment: .leading){
                                                    Text("name: \(bsym.symptom)")
                                                        .padding(.bottom)
                                                    Text("symptom detail: \(bsym.exDetail)")
                                                        .padding(.bottom)
                                                }
                                            }
                                        if bsym.pointCode == "C"{
                                            VStack {
                                                CodeSev
                                                CodeTen
                                            }
                                        }
                                        if bsym.pointCode == "D"{
                                            VStack {
                                                CodeSix
                                                CodeEle
                                                CodeTtr
                                            }
                                        }
                                        if bsym.pointCode == "E"{
                                            VStack {
                                                CodeEle
                                            }
                                        }
                                        if bsym.pointCode == "F"{
                                            VStack {
                                                CodeEig
                                                CodeEle
                                                CodeTwe
                                            }
                                        }
                                    }
                                        .padding()
                                        .font(.headline)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                            }
                            //.background(Color(.secondarySystemBackground))
                            .navigationTitle(bsym.symptom)
                        } label: {
                            HStack {
                                Image(bsym.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 150)
                                Text(bsym.symptom)
                                    .padding(.vertical, 10)
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                    //.background(colorScaheme == .dark ? Color(red: 1, green: 1, blue: 1, opacity: 0.1) : Color(red: 1, green: 1, blue: 1, opacity: 1))
                                    .cornerRadius(6)
                                    .foregroundColor(colorScaheme == .dark ? .white : .black)
                            }.padding(.vertical, -3)
                        }
                    }
                }
                Section("Other"){
                    ForEach($osym ) { $osym in
                        NavigationLink {
                            ScrollView{
                                VStack {
                                    VStack(alignment: .leading){
                                        HStack(alignment: .center) {
                                                VStack(alignment: .leading){
                                                    Text("name: \(osym.symptom)")
                                                        .padding(.bottom)
                                                    Text("symptom detail: \(osym.exDetail)")
                                                        .padding(.bottom)
                                                }
                                            }
                                        if osym.pointCode == "G"{
                                            VStack {
                                                CodeOne
                                                CodeFour
                                                CodeEle
                                                CodeTwe
                                            }
                                        }
                                        if osym.pointCode == "H"{
                                            VStack {
                                                CodeFif
                                            }
                                        }
                                        if osym.pointCode == "I"{
                                            VStack {
                                                CodeSix
                                                CodeEle
                                            }
                                        }
                                        if osym.pointCode == "J"{
                                            VStack {
                                                CodeEig
                                                CodeEle
                                                CodeTtr
                                            }
                                        }
                                        if osym.pointCode == "K"{
                                            VStack {
                                                CodeTen
                                            }
                                        }
                                    }
                                        .padding()
                                        .font(.headline)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                            }
                            //.background(Color(.secondarySystemBackground))
                            .navigationTitle(osym.symptom)
                        } label: {
                            HStack {
                                Image(osym.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 150)
                                Text(osym.symptom)
                                    .padding(.vertical, 10)
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                    //.background(colorScaheme == .dark ? Color(red: 1, green: 1, blue: 1, opacity: 0.1) : Color(red: 1, green: 1, blue: 1, opacity: 1))
                                    .cornerRadius(6)
                                    .foregroundColor(colorScaheme == .dark ? .white : .black)
                            }.padding(.vertical, -3)
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder var pointView: some View{
        VStack {
            Text("Choose the place of the point you want to know!!")
                .font(.title3.bold())
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
            ScrollView{
                VStack {
                    ZStack {
                        Image("1091")
                        VStack {
                            HStack {
                                headPointButton
                            }
                            HStack(alignment: .top) {
                                Spacer()
                                handPointButton
                                VStack {
                                    bodyPointButton
                                    HStack(alignment: .bottom) {
                                        feetOutPointButton
                                        feetPointButton
                                        feetPointButton
                                        feetOutPointButton
                                    }.padding(.horizontal, 5)
                                }
                                .padding(.horizontal, -20)
                                handPointButton
                                Spacer()
                            }
                        }.padding(.top, -40)
                    }.padding(.top, -70)
                }.frame(maxWidth: .infinity)
            }
        }.background(Color(.secondarySystemBackground))
    }
    
    @ViewBuilder var handPointButton: some View{
        NavigationLink(destination: handPointView()){
            VStack {
                Text("hand")
                    .font(.system(size: 20))
                    .frame(width: 50, height: 370)
                    .background(Color.secondary.opacity(0.05))
                    .cornerRadius(50)
                    .foregroundColor(.secondary.opacity(0))
                    .padding(.top, 20)
            }
        }
    }
    
    @ViewBuilder var bodyPointButton: some View{
        NavigationLink(destination: bodyPointView()){
            VStack {
                Text("body")
                    .font(.system(size: 20))
                    .frame(width: 200, height: 320)
                    .background(Color.secondary.opacity(0.1))
                .cornerRadius(8)
                .foregroundColor(.secondary.opacity(0))
            }
        }
    }
    @ViewBuilder var headPointButton: some View{
        NavigationLink(destination: headPointView()){
            VStack {
                Text("head")
                    .font(.system(size: 20))
                    .frame(width: 140, height: 230)
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(100)
                    .foregroundColor(.secondary.opacity(0))
            }
        }
    }
    @ViewBuilder var feetOutPointButton: some View{
        NavigationLink(destination: feetPointView()){
            VStack {
                Text("feet")
                    .font(.system(size: 20))
                    .frame(width: 50, height: 50)
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(6)
                    .foregroundColor(.secondary.opacity(0))
                    .padding(.horizontal, -10)
            }
        }
    }
    @ViewBuilder var feetPointButton: some View{
        NavigationLink(destination: feetPointView()){
            VStack {
                Text("feet")
                    .font(.system(size: 20))
                    .frame(width: 70, height: 430)
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(6)
                    .foregroundColor(.secondary.opacity(0))
            }
        }
    }
    
    @ViewBuilder var tipsView: some View{
        ScrollView{
            VStack(alignment: .leading) {
                Text("1. when you ...")
                    .font(shouldShowTips ? .title3 :.subheadline)
                Image("896")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }.padding()
        }
    }
    
    @ViewBuilder var CodeOne: some View{
        VStack(alignment: .leading) {
            Text("Point name: Yongquan acupoint (印堂穴)")
            ZStack {
                Image("195")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Button{
                        showPopover = true
                    } label:{
                        Text("")
                            .frame(width: 10, height: 10)
                            .background(Color.red)
                            .cornerRadius(50)
                    }.popover(isPresented: $showPopover, content: {
                        VStack(alignment: .leading) {
                            Text("Point name: Yongquan acupoint (印堂穴)")
                            Text("symptom: Insomnia")
                            Text("detail: wwwwwww")
                        }.padding()
                    })
                    Color.clear
                        .frame(height: 100)
                        .frame(maxWidth: 600)
                }
            }
        }
    }
    @ViewBuilder var CodeTwo: some View{
        VStack(alignment: .leading) {
            Text("Point name: Yongquan acupoint (太陽穴)")
            ZStack {
                Image("194")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Button{
                        showPopover = true
                    } label:{
                        Text("")
                            .frame(width: 10, height: 10)
                            .background(Color.red)
                            .cornerRadius(50)
                    }.popover(isPresented: $showPopover, content: {
                        VStack(alignment: .leading) {
                            Text("Point name: Yongquan acupoint (太陽穴)")
                            Text("symptom: Insomnia")
                            Text("detail: wwwwwww")
                        }.padding()
                    })
                    Color.clear
                        .frame(height: 100)
                        .frame(maxWidth: 600)
                }
            }
        }
    }
    @ViewBuilder var CodeThree: some View{
        VStack(alignment: .leading) {
            Text("Point name: Yongquan acupoint (風池穴)")
            ZStack {
                Image("194")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Button{
                        showPopover = true
                    } label:{
                        Text("")
                            .frame(width: 10, height: 10)
                            .background(Color.red)
                            .cornerRadius(50)
                    }.popover(isPresented: $showPopover, content: {
                        VStack(alignment: .leading) {
                            Text("Point name: Yongquan acupoint (風池穴)")
                            Text("symptom: Insomnia")
                            Text("detail: wwwwwww")
                        }.padding()
                    })
                    Color.clear
                        .frame(height: 100)
                        .frame(maxWidth: 600)
                }
            }
        }
    }
    @ViewBuilder var CodeFour: some View{
        VStack(alignment: .leading) {
            Text("Point name: Yongquan acupoint (百會穴)")
            ZStack {
                Image("194")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Button{
                        showPopover = true
                    } label:{
                        Text("")
                            .frame(width: 10, height: 10)
                            .background(Color.red)
                            .cornerRadius(50)
                    }.popover(isPresented: $showPopover, content: {
                        VStack(alignment: .leading) {
                            Text("Point name: Yongquan acupoint (百會穴)")
                            Text("symptom: Insomnia")
                            Text("detail: wwwwwww")
                        }.padding()
                    })
                    Color.clear
                        .frame(height: 100)
                        .frame(maxWidth: 600)
                }
            }
        }
    }
    @ViewBuilder var CodeFif: some View{
        VStack(alignment: .leading) {
            Text("Point name: Yongquan acupoint (天樞穴)")
            ZStack {
                Image("15041")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Button{
                        showPopover = true
                    } label:{
                        Text("")
                            .frame(width: 10, height: 10)
                            .background(Color.red)
                            .cornerRadius(50)
                    }.popover(isPresented: $showPopover, content: {
                        VStack(alignment: .leading) {
                            Text("Point name: Yongquan acupoint (天樞穴)")
                            Text("symptom: Insomnia")
                            Text("detail: wwwwwww")
                        }.padding()
                    })
                    Color.clear
                        .frame(height: 100)
                        .frame(maxWidth: 600)
                }
            }
        }
    }
    @ViewBuilder var CodeSix: some View{
        VStack(alignment: .leading) {
            Text("Point name: Yongquan acupoint (中脘穴)")
            ZStack {
                Image("15041")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Button{
                        showPopover = true
                    } label:{
                        Text("")
                            .frame(width: 10, height: 10)
                            .background(Color.red)
                            .cornerRadius(50)
                    }.popover(isPresented: $showPopover, content: {
                        VStack(alignment: .leading) {
                            Text("Point name: Yongquan acupoint (中脘穴)")
                            Text("symptom: Insomnia")
                            Text("detail: wwwwwww")
                        }.padding()
                    })
                    Color.clear
                        .frame(height: 100)
                        .frame(maxWidth: 600)
                }
            }
        }
    }
    @ViewBuilder var CodeSev: some View{
        VStack(alignment: .leading) {
            Text("Point name: Yongquan acupoint (腰眼穴)")
            ZStack {
                Image("15051")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Button{
                        showPopover = true
                    } label:{
                        Text("")
                            .frame(width: 10, height: 10)
                            .background(Color.red)
                            .cornerRadius(50)
                    }.popover(isPresented: $showPopover, content: {
                        VStack(alignment: .leading) {
                            Text("Point name: Yongquan acupoint (腰眼穴)")
                            Text("symptom: Insomnia")
                            Text("detail: wwwwwww")
                        }.padding()
                    })
                    Color.clear
                        .frame(height: 100)
                        .frame(maxWidth: 600)
                }
            }
        }
    }
    @ViewBuilder var CodeEig: some View{
        VStack(alignment: .leading) {
            Text("Point name: Yongquan acupoint (合谷穴)")
            ZStack {
                Image("15061")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Button{
                        showPopover = true
                    } label:{
                        Text("")
                            .frame(width: 10, height: 10)
                            .background(Color.red)
                            .cornerRadius(50)
                    }.popover(isPresented: $showPopover, content: {
                        VStack(alignment: .leading) {
                            Text("Point name: Yongquan acupoint (合谷穴)")
                            Text("symptom: Insomnia")
                            Text("detail: wwwwwww")
                        }.padding()
                    })
                    Color.clear
                        .frame(height: 100)
                        .frame(maxWidth: 600)
                }
            }
        }
    }
    @ViewBuilder var CodeNin: some View{
        VStack(alignment: .leading) {
            Text("Point name: Yongquan acupoint (落枕穴)")
            ZStack {
                Image("15061")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Button{
                        showPopover = true
                    } label:{
                        Text("")
                            .frame(width: 10, height: 10)
                            .background(Color.red)
                            .cornerRadius(50)
                    }.popover(isPresented: $showPopover, content: {
                        VStack(alignment: .leading) {
                            Text("Point name: Yongquan acupoint (落枕穴)")
                            Text("symptom: Insomnia")
                            Text("detail: wwwwwww")
                        }.padding()
                    })
                    Color.clear
                        .frame(height: 100)
                        .frame(maxWidth: 600)
                }
            }
        }
    }
    @ViewBuilder var CodeTen: some View{
        VStack(alignment: .leading) {
            Text("Point name: Yongquan acupoint (腰腿點穴)")
            ZStack {
                Image("15061")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Button{
                        showPopover = true
                    } label:{
                        Text("")
                            .frame(width: 10, height: 10)
                            .background(Color.red)
                            .cornerRadius(50)
                    }.popover(isPresented: $showPopover, content: {
                        VStack(alignment: .leading) {
                            Text("Point name: Yongquan acupoint (腰腿點穴)")
                            Text("symptom: Insomnia")
                            Text("detail: wwwwwww")
                        }.padding()
                    })
                    Color.clear
                        .frame(height: 100)
                        .frame(maxWidth: 600)
                }
            }
        }
    }
    @ViewBuilder var CodeEle: some View{
        VStack(alignment: .leading) {
            Text("Point name: Yongquan acupoint (內關穴)")
            ZStack {
                Image("15071")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Button{
                        showPopover = true
                    } label:{
                        Text("")
                            .frame(width: 10, height: 10)
                            .background(Color.red)
                            .cornerRadius(50)
                    }.popover(isPresented: $showPopover, content: {
                        VStack(alignment: .leading) {
                            Text("Point name: Yongquan acupoint (內關穴)")
                            Text("symptom: Insomnia")
                            Text("detail: wwwwwww")
                        }.padding()
                    })
                    Color.clear
                        .frame(height: 100)
                        .frame(maxWidth: 600)
                }
            }
        }
    }
    @ViewBuilder var CodeTwe: some View{
        VStack(alignment: .leading) {
            Text("Point name: Yongquan acupoint (湧泉穴)")
            ZStack {
                Image("1502")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Button{
                        showPopover = true
                    } label:{
                        Text("")
                            .frame(width: 10, height: 10)
                            .background(Color.red)
                            .cornerRadius(50)
                    }.popover(isPresented: $showPopover, content: {
                        VStack(alignment: .leading) {
                            Text("Point name: Yongquan acupoint (湧泉穴)")
                            Text("symptom: Insomnia")
                            Text("detail: wwwwwww")
                        }.padding()
                    })
                    Color.clear
                        .frame(height: 100)
                        .frame(maxWidth: 600)
                }
            }
        }
    }
    @ViewBuilder var CodeTtr: some View{
        VStack(alignment: .leading) {
            Text("Point name: Yongquan acupoint (足三里穴)")
            ZStack {
                Image("15081")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Button{
                        showPopover = true
                    } label:{
                        Text("")
                            .frame(width: 10, height: 10)
                            .background(Color.red)
                            .cornerRadius(50)
                    }.popover(isPresented: $showPopover, content: {
                        VStack(alignment: .leading) {
                            Text("Point name: Yongquan acupoint (足三里穴)")
                            Text("symptom: Insomnia")
                            Text("detail: wwwwwww")
                        }.padding()
                    })
                    Color.clear
                        .frame(height: 100)
                        .frame(maxWidth: 600)
                }
            }
        }
    }
}

