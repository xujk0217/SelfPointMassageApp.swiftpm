import SwiftUI

struct ContentView: View {
    @State private var whichView = 1
    @State private var whichView2 = 1
    @State private var hsym = Symptom.hSymExamples
    @State private var bsym = Symptom.bSymExamples
    @State private var osym = Symptom.oSymExamples
    @State private var showPopovera = false
    @State private var showPopoverb = false
    @State private var showPopoverc = false
    @State private var showPopoverd = false
    @State private var showPopover = false
    
    @State private var shouldSmallImage = false
    
    @State private var shouldShowTips = false
    @State private var shouldShowArr = false
    
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
                shouldShowArr = true
            } label: {
                Image(systemName: "exclamationmark.triangle.fill")
                    .padding(.horizontal)
                    .font(.title2)
            }
            .sheet(isPresented: $shouldShowArr){
                VStack {
                    Color.gray
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                        .padding(.top, 15)
                    HStack {
                        Text("")
                            .frame(width: 50)
                        Spacer()
                        Text("Precautions for Acupressure Massage")
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                            .font(.title.bold())
                            .padding(.bottom, -5)
                        Spacer()
                        Button{
                            shouldShowArr = false
                        }label: {
                            Text("skip")
                                .padding(.horizontal)
                        }
                    }
                    arrView
                }
            }
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
    
    @ViewBuilder var barButton2: some View{
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Button() {
                    whichView2 = 1
                }label: {
                    VStack {
                        Text("Symptom")
                            .font(.headline)
                            .frame(width: 100, height: 50)
                            .foregroundColor(whichView2 == 1 ? .white : .gray)
                            .background(whichView2 == 1 ? Color.accentColor : Color.clear)
                            .cornerRadius(20)
                    }
                }
                
                Button{
                    whichView2 = 2
                }label: {
                    VStack {
                        Text("Point")
                            .font(.headline)
                            .frame(width: 100, height: 50)
                            .foregroundColor(whichView2 == 2 ? .white : .gray)
                            .background(whichView2 == 2 ? Color.accentColor : Color.clear)
                            .cornerRadius(20)
                    }
                }
                
                Button{
                    whichView2 = 3
                }label: {
                    VStack {
                        Text("AR")
                            .font(.headline)
                            .frame(width: 100, height: 50)
                            .foregroundColor(whichView2 == 3 ? .white : .gray)
                            .background(whichView2 == 3 ? Color.accentColor : Color.clear)
                            .cornerRadius(20)
                    }
                }
            }.padding(.horizontal)
        }
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
                                                    HStack {
                                                        Image(hsym.image)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(maxWidth: 120)
                                                        Text("\(hsym.symptom)")
                                                            .font(.title2.bold())
                                                            .padding(.bottom)
                                                        Spacer()
                                                    }
                                                    Divider()
                                                        .padding(.horizontal, 20)
                                                        .padding(.bottom, 10)
                                                    Text("symptom detail:")
                                                        .font(.title2.bold())
                                                    Text("\(hsym.exDetail)")
                                                        .font(.headline)
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
                                        .font(.title2.bold())
                                        .background(Color.white)
                                        .cornerRadius(30)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                            }
                            .background(Color(.secondarySystemBackground))
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
                                                    HStack {
                                                        Image(bsym.image)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(maxWidth: 120)
                                                        Text("\(bsym.symptom)")
                                                            .font(.title2.bold())
                                                            .padding(.bottom)
                                                        Spacer()
                                                    }
                                                    Divider()
                                                        .padding(.horizontal, 20)
                                                        .padding(.bottom, 10)
                                                    Text("symptom detail: ")
                                                        .font(.title2.bold())
                                                    Text("\(bsym.exDetail)")
                                                        .font(.headline)
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
                                        if bsym.pointCode == "K"{
                                            VStack {
                                                CodeTen
                                            }
                                        }
                                    }
                                        .padding()
                                        .font(.title2.bold())
                                        .background(Color.white)
                                        .cornerRadius(30)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                            }
                            .background(Color(.secondarySystemBackground))
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
                                                    HStack {
                                                        Image(osym.image)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(maxWidth: 120)
                                                        Text("\(osym.symptom)")
                                                            .font(.title2.bold())
                                                            .padding(.bottom)
                                                        Spacer()
                                                    }
                                                    Divider()
                                                        .padding(.horizontal, 20)
                                                        .padding(.bottom, 10)
                                                    Text("symptom detail: ")
                                                        .font(.title2.bold())
                                                    Text("\(osym.exDetail)")
                                                        .font(.headline)
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
                                        if osym.pointCode == "F"{
                                            VStack {
                                                CodeEig
                                                CodeEle
                                                CodeTwe
                                            }
                                        }
                                    }
                                        .padding()
                                        .font(.title2.bold())
                                        .background(Color.white)
                                        .cornerRadius(30)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                            }
                            .background(Color(.secondarySystemBackground))
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
        VStack {
            barButton2
            ScrollView{
                if whichView2 == 1{
                    symTipView
                }else if whichView2 == 2{
                    pointTipView
                }else if whichView2 == 3{
                    arTipView
                }
            }
        }
    }
    
    @ViewBuilder var symTipView: some View{
        VStack {
            Image("896")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }.padding()
    }
    
    @ViewBuilder var pointTipView: some View{
        VStack {
            Image("image1")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }.padding()
    }
    
    @ViewBuilder var arTipView: some View{
        VStack {
            Image("1434")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }.padding()
    }
    
    @ViewBuilder var CodeOne: some View{
        VStack(alignment: .leading) {
            Divider()
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            Text("Point name: Yintang acupoint (印堂穴)")
            ZStack {
                Image("195")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    HStack {
                        Button{
                            showPopovera = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }.popover(isPresented: $showPopovera, content: {
                            VStack(alignment: .leading) {
                                Text("Point name: Yintang acupoint (印堂穴)")
                                Text("symptom: Commonly used to alleviate forehead discomfort, promote mental clarity, and is believed to benefit relaxation and relieve stress.")
                                Text("detail: In the center between the eyebrows, precisely at the midpoint of the forehead.")
                            }.padding()
                                .frame(width: 600)
                    })
                        Color.clear
                            .frame(height: 10)
                            .frame(width: 10)
                    }
                    Color.clear
                        .frame(height: 100)
                        .frame(maxWidth: 600)
                }
            }
        }
    }
    @ViewBuilder var CodeTwo: some View{
        VStack(alignment: .leading) {
            Divider()
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            Text("Point name: temples acupoint (太陽穴)")
            ZStack {
                Image("194")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    HStack {
                        Button{
                            showPopoverb = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }.popover(isPresented: $showPopoverb, content: {
                            VStack(alignment: .leading) {
                                Text("Point name: temples acupoint (太陽穴)")
                                Text("symptom: Used for relieving headaches, migraines, and eye discomfort. Massaging the temples helps relax head muscles, improve blood circulation, and alleviate tension.")
                                Text("detail: Approximately 1 inch behind the temples, find the hollow area known as the Temples.")
                            }.padding()
                                .frame(width: 600)
                    })
                        Color.clear
                            .frame(height: 40)
                            .frame(width: 120)
                    }
                    Color.clear
                        .frame(height: 40)
                        .frame(maxWidth: 600)
                }
            }
        }
    }
    @ViewBuilder var CodeThree: some View{
        VStack(alignment: .leading) {
            Divider()
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            Text("Point name: Fengchi acupoint (風池穴)")
            ZStack {
                Image("194")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Color.clear
                        .frame(height: 110)
                        .frame(maxWidth: 60)
                    HStack {
                        Color.clear
                            .frame(height: 100)
                            .frame(width: 180)
                        Button{
                            showPopoverc = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }.popover(isPresented: $showPopoverc, content: {
                            VStack(alignment: .leading) {
                                Text("Point name: Fengchi acupoint (風池穴)")
                                Text("symptom: Known for regulating blood pressure, relieving discomfort in the back of the head, and improving overall head and neck well-being.")
                                Text("detail: On both sides of the neck, slightly below the level of the cervical vertebrae.")
                            }.padding()
                                .frame(width: 600)
                    })
                    }
                }
            }
        }
    }
    @ViewBuilder var CodeFour: some View{
        VStack(alignment: .leading) {
            Divider()
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            Text("Point name: Baihui acupoint (百會穴)")
            ZStack {
                Image("194")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Button{
                        showPopoverb = true
                    } label:{
                        Text("")
                            .frame(width: 20, height: 20)
                            .background(Color.red)
                            .cornerRadius(50)
                    }.popover(isPresented: $showPopoverb, content: {
                        VStack(alignment: .leading) {
                            Text("Point name: Baihui acupoint (百會穴)")
                            Text("symptom: It is believed to be associated with regulating the nervous system, enhancing consciousness, and promoting overall harmony within the body's meridians and blood circulation.")
                            Text("detail: At the top of the head, at the intersection point of the midline and the line connecting the anterior hairline and the midpoint of the head.")
                        }.padding()
                            .frame(width: 600)
                    })
                    Color.clear
                        .frame(height: 320)
                        .frame(maxWidth: 600)
                }
            }
        }
    }
    @ViewBuilder var CodeFif: some View{
        VStack(alignment: .leading) {
            Divider()
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            Text("Point name: Tianshu acupoint (天樞穴)")
            ZStack {
                Image("15041")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Color.clear
                        .frame(height: 450)
                        .frame(maxWidth: 600)
                    HStack {
                        Button{
                            showPopovera = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }.popover(isPresented: $showPopovera, content: {
                            VStack(alignment: .leading) {
                                Text("Point name: Tianshu acupoint (天樞穴)")
                                Text("symptom: The Tianshu acupoint is commonly used to alleviate abdominal discomfort, pain, bloating, and other digestive issues. Massaging this acupoint is believed to promote blood circulation in the abdominal region, regulate gastrointestinal function, and relieve symptoms related to the digestive system.")
                                Text("detail: Located on both sides of the abdomen, approximately three finger-widths away from the navel.")
                            }.padding()
                                .frame(width: 600)
                    })
                        Color.clear
                            .frame(height: 10)
                            .frame(width: 120)
                        Button{
                            showPopoverb = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }.popover(isPresented: $showPopoverb, content: {
                            VStack(alignment: .leading) {
                                Text("Point name: Tianshu acupoint (天樞穴)")
                                Text("symptom: The Tianshu acupoint is commonly used to alleviate abdominal discomfort, pain, bloating, and other digestive issues. Massaging this acupoint is believed to promote blood circulation in the abdominal region, regulate gastrointestinal function, and relieve symptoms related to the digestive system.")
                                Text("detail: Located on both sides of the abdomen, approximately three finger-widths away from the navel.")
                            }.padding()
                                .frame(width: 600)
                        })
                        Color.clear
                            .frame(height: 10)
                            .frame(width: 2)
                    }
                }
            }
        }
    }
    @ViewBuilder var CodeSix: some View{
        VStack(alignment: .leading) {
            Divider()
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            Text("Point name: Zhongwan acupoint (中脘穴)")
            ZStack {
                Image("15041")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Color.clear
                        .frame(height: 200)
                        .frame(maxWidth: 600)
                    Button{
                        showPopoverc = true
                    } label:{
                        Text("")
                            .frame(width: 20, height: 20)
                            .background(Color.red)
                            .cornerRadius(50)
                    }.popover(isPresented: $showPopoverc, content: {
                        VStack(alignment: .leading) {
                            Text("Point name: Zhongwan acupoint (中脘穴)")
                            Text("symptom: Zhongwan acupoint is an important point for regulating gastrointestinal function. Massaging Zhongwan is believed to help alleviate stomach discomfort, stomach pain, and loss of appetite. Additionally, it can be used to relieve symptoms related to the digestive system and promote the normal functioning of the digestive system.")
                            Text("detail: Located on the abdomen, approximately four finger-widths above the navel. It can also be described as being about four horizontal fingers above the belly button.")
                        }.padding()
                            .frame(width: 600)
                    })
                }
            }
        }
    }
    @ViewBuilder var CodeSev: some View{
        VStack(alignment: .leading) {
            Divider()
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            Text("Point name: Yaoyan acupoint (腰眼穴)")
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
                            showPopoverb = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }.popover(isPresented: $showPopoverb, content: {
                            VStack(alignment: .leading) {
                                Text("Point name: Yaoyan acupoint (腰眼穴)")
                                Text("symptom: Yaoyan acupoint is utilized for relieving discomfort and pain in the lumbar region. Massaging Yaoyan is believed to help relax the muscles in the lower back, alleviate tension around the lumbar vertebrae, and provide relief for issues such as lower back pain and stiffness.")
                                Text("detail: Located in the lumbar region, approximately three horizontal fingers below the lower edge of the lumbar vertebrae. It is generally described as being beside the spine, about three horizontal fingers away from the lower edge of the lumbar vertebrae.")
                            }.padding()
                                .frame(width: 600)
                    })
                        Color.clear
                            .frame(height: 400)
                            .frame(width: 170)
                        Button{
                            showPopoverc = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }.popover(isPresented: $showPopoverc, content: {
                            VStack(alignment: .leading) {
                                Text("Point name: Yaoyan acupoint (腰眼穴)")
                                Text("symptom: Yaoyan acupoint is utilized for relieving discomfort and pain in the lumbar region. Massaging Yaoyan is believed to help relax the muscles in the lower back, alleviate tension around the lumbar vertebrae, and provide relief for issues such as lower back pain and stiffness.")
                                Text("detail: Located in the lumbar region, approximately three horizontal fingers below the lower edge of the lumbar vertebrae. It is generally described as being beside the spine, about three horizontal fingers away from the lower edge of the lumbar vertebrae.")
                            }.padding()
                                .frame(width: 600)
                    })
                    }
                }
            }
        }
    }
    @ViewBuilder var CodeEig: some View{
        VStack(alignment: .leading) {
            Divider()
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            Text("Point name: Hegu acupoint (合谷穴)")
            ZStack {
                Image("15061")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Color.clear
                        .frame(height: 200)
                        .frame(maxWidth: 600)
                    HStack {
                        Color.clear
                            .frame(height: 100)
                            .frame(width: 100)
                        Button{
                            showPopoverb = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }.popover(isPresented: $showPopoverb, content: {
                            VStack(alignment: .leading) {
                                Text("Point name: Hegu acupoint (合谷穴)")
                                Text("symptom: Hegu acupoint is part of the Hand Shaoyin meridian and is commonly used to alleviate pain in the hands, headaches, toothaches, and other discomfort. Massaging Hegu is believed to help relieve pain and improve blood circulation in the hands.")
                                Text("detail: Located on the back of the hand, in the depression between the index finger and the thumb, precisely at the highest point of the webbed area between the fingers.")
                            }.padding()
                                .frame(width: 600)
                    })
                    }
                }
            }
        }
    }
    @ViewBuilder var CodeNin: some View{
        VStack(alignment: .leading) {
            Divider()
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            Text("Point name: Xiangqiang acupoint (項強穴)")
            ZStack {
                Image("15061")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    HStack {
                        Button{
                            showPopovera = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }.popover(isPresented: $showPopovera, content: {
                            VStack(alignment: .leading) {
                                Text("Point name: Xiangqiang acupoint (項強穴)")
                                Text("symptom: Effective in treating conditions such as numbness in the palm and fingers, inability to flex or extend muscles, and situations related to having a stiff neck.")
                                Text("detail: located between the bones of the index and middle fingers, approximately one finger-width behind the knuckle.")
                            }.padding()
                                .frame(width: 600)
                    })
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
            Divider()
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            Text("Point name: Waist and Leg Point (腰腿點穴)")
            ZStack {
                Image("15061")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Color.clear
                        .frame(height: 200)
                        .frame(maxWidth: 600)
                    HStack {
                        Color.clear
                            .frame(height: 200)
                            .frame(width: 100)
                        Button{
                            showPopovera = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }.popover(isPresented: $showPopovera, content: {
                            VStack(alignment: .leading) {
                                Text("Point name: Waist and Leg Point (腰腿點穴)")
                                Text("symptom: Described as an effective acupoint for treating lower back and leg pain, especially effective for acute sprains.")
                                Text("detail: There are two points for Waist and Leg Point, located respectively on the back of the hand, in the middle of the joint between the bones of the index and middle fingers on the back of the hand, and in the middle of the joint between the bones of the ring and little fingers.")
                            }.padding()
                                .frame(width: 600)
                    })
                        Color.clear
                            .frame(height: 200)
                            .frame(width: 100)
                        Button{
                            showPopover = true
                        } label:{
                            Text("")
                                .frame(width: 20, height: 20)
                                .background(Color.red)
                                .cornerRadius(50)
                        }.popover(isPresented: $showPopover, content: {
                            VStack(alignment: .leading) {
                                Text("Point name: Waist and Leg Point (腰腿點穴)")
                                Text("symptom: Described as an effective acupoint for treating lower back and leg pain, especially effective for acute sprains.")
                                Text("detail: There are two points for Waist and Leg Point, located respectively on the back of the hand, in the middle of the joint between the bones of the index and middle fingers on the back of the hand, and in the middle of the joint between the bones of the ring and little fingers.")
                            }.padding()
                                .frame(width: 600)
                    })
                        Color.clear
                            .frame(height: 200)
                            .frame(width: 200)
                    }
                }
            }
        }
    }
    @ViewBuilder var CodeEle: some View{
        VStack(alignment: .leading) {
            Divider()
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            Text("Point name: Neiguan acupoint (內關穴)")
            ZStack {
                Image("15071")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Color.clear
                        .frame(height: 300)
                        .frame(maxWidth: 600)
                    Button{
                        showPopoverd = true
                    } label:{
                        Text("")
                            .frame(width: 20, height: 20)
                            .background(Color.red)
                            .cornerRadius(50)
                    }.popover(isPresented: $showPopoverd, content: {
                        VStack(alignment: .leading) {
                            Text("Point name: Neiguan acupoint (內關穴)")
                            Text("symptom: Neiguan acupoint is part of the Pericardium Meridian and is commonly used to alleviate discomfort related to the heart, such as palpitations, anxiety, and nausea. This acupoint is also widely utilized to relieve feelings of fear, calm emotions, and regulate heartbeat.")
                            Text("detail: Located on the inner side of the arm, three fingers below the wrist crease, precisely in the depression between the tendons of the forearm muscles.")
                        }.padding()
                            .frame(width: 600)
                    })
                }
            }
        }
    }
    @ViewBuilder var CodeTwe: some View{
        VStack(alignment: .leading) {
            Divider()
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            Text("Point name: Yongquan acupoint (湧泉穴)")
            ZStack {
                Image("1502")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 600)
                VStack {
                    Button{
                        showPopoverc = true
                    } label:{
                        Text("")
                            .frame(width: 20, height: 20)
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
        }
    }
    @ViewBuilder var CodeTtr: some View{
        VStack(alignment: .leading) {
            Divider()
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            Text("Point name: Zusanli acupoint (足三里穴)")
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
                            Text("")
                                .frame(width: 20, height: 20)
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
        }
    }
    @ViewBuilder var arrView: some View{
        ScrollView{
            VStack(alignment: .leading){
                Text("Massages can be beneficial in many situations for providing relaxation and relief. However, it is advisable to avoid massaging in the following circumstances:")
                    .padding()
                Text("1.Fever or Cold: ")
                Text("If experiencing a fever or symptoms of a cold, massaging may worsen discomfort. It is recommended to rest and consider massage once symptoms subside.")
                    .padding(.bottom)
                    .font(.title3)
                Text("2.Acute Injuries or Inflammation:")
                Text("Avoid massaging during the acute stage of injuries or inflammation, such as immediately after an injury occurs.")
                    .padding(.bottom)
                    .font(.title3)
                Text("3.Skin Issues: ")
                Text("If there are skin infections, eczema, herpes, or other skin problems, refrain from massaging the affected area to prevent worsening symptoms or spreading infection.")
                    .padding(.bottom)
                    .font(.title3)
                Text("4.Cardiovascular Problems:")
                Text("Individuals with cardiovascular issues or high blood pressure should consult a professional before getting a massage to avoid discomfort or unforeseen complications.")
                    .padding(.bottom)
                    .font(.title3)
                Text("5.Fractures or Severe Joint Problems: ")
                Text(" Avoid massaging areas with fractures or severe joint problems to prevent exacerbating injuries.")
                    .padding(.bottom)
                    .font(.title3)
                Text("6.Early Pregnancy:")
                Text("In the early stages of pregnancy, especially during the first trimester, it is advisable to avoid excessive massage, particularly in the abdominal and lumbar areas. It is recommended to consult with a healthcare professional before receiving a massage during pregnancy.")
                    .padding(.bottom)
                    .font(.title3)
                Text("In the above situations, if there is a need for massage, it is best to seek advice from a healthcare professional to ensure safety and suitability. During massage, use appropriate techniques and pressure to avoid discomfort or injury.")
                    .padding()
            }
            .font(.title2.bold())
            .padding()
            .padding(.horizontal)
        }
    }
}

