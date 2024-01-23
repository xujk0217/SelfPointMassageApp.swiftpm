import SwiftUI

struct ContentView: View {
    @State private var whichView = 2
    @State private var hpoint = Point.hexamples
    @State private var bpoint = Point.bexamples
    @State private var opoint = Point.oexamples
    
    @State var selectedSym = Set<Point.ID>()
    
    @Environment (\.colorScheme) var colorScaheme
    
    var body: some View {
        NavigationStack{
            VStack {
                Apptitle
                
                barButton
                
                if whichView == 1{
                    symptomView
                }else if whichView == 2{
                    pointView
                }else{
                    ScrollView{
                        
                    }
                }
            }.background(Color(.secondarySystemBackground))
        }
    }
}


// MARK: - Subview
private extension ContentView{
    var Apptitle: some View{
        Text("Self Point Massage")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
    
    @ViewBuilder var barButton: some View{
        HStack(alignment: .top) {
            Button() {
                whichView = 1
            }label: {
                VStack {
                    Text("symptom")
                        .font(.headline)
                        .padding(.horizontal, 10)
                        .foregroundColor(whichView == 1 ? .accentColor : .gray)
                }
            }
            
            Button{
                whichView = 2
            }label: {
                VStack {
                    Text("point")
                        .font(.headline)
                        .padding(.horizontal, 10)
                        .foregroundColor(whichView == 2 ? .accentColor : .gray)
                }
            }
            
            Button{
                whichView = 3
            }label: {
                VStack {
                    Text("test")
                        .font(.headline)
                        .padding(.horizontal, 10)
                        .foregroundColor(whichView == 3 ? .accentColor : .gray)
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
            List(/*selection: $selectedSym*/) {
                Section("Head"){
                    ForEach($hpoint) { $hpoint in
                        NavigationLink {
                            ScrollView{
                                VStack {
                                    VStack{
                                        Text("Point name: \(hpoint.name)")
                                        Text("Point location: \(hpoint.lacation)")
                                            .padding(.vertical)
                                        Text("Healing part: \(hpoint.healPart)")
                                    }
                                        .padding()
                                        .font(.headline)
                                        
                                    Text("\(hpoint.image)")
                                    Text("Detail: \(hpoint.detail)")
                                        .font(.headline)
                                    Spacer()
                                }
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                .padding()
                            }
                            .background(Color(.secondarySystemBackground))
                            .navigationTitle(hpoint.symptom)
                        } label: {
                            HStack {
                                Text(hpoint.symptom)
                                    .padding(.vertical, 10)
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                    .background(colorScaheme == .dark ? Color(red: 1, green: 1, blue: 1, opacity: 0.1) : Color(red: 1, green: 1, blue: 1, opacity: 1))
                                    .cornerRadius(6)
                                    .foregroundColor(colorScaheme == .dark ? .white : .black)
                            }.padding(.vertical, -3)
                        }
                    }
                }
                Section("Body"){
                    ForEach($bpoint) { $bpoint in
                        NavigationLink {
                            
                        } label: {
                            HStack {
                                Text(bpoint.symptom)
                                    .padding(.vertical, 10)
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                    .background(colorScaheme == .dark ? Color(red: 1, green: 1, blue: 1, opacity: 0.1) : Color(red: 1, green: 1, blue: 1, opacity: 1))
                                    .cornerRadius(6)
                                    .foregroundColor(colorScaheme == .dark ? .white : .black)
                            }.padding(.vertical, -3)
                        }
                    }
                }
                Section("Other"){
                    ForEach($opoint) { $opoint in
                        NavigationLink {
                            
                        } label: {
                            HStack {
                                Text(opoint.symptom)
                                    .padding(.vertical, 10)
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                    .background(colorScaheme == .dark ? Color(red: 1, green: 1, blue: 1, opacity: 0.1) : Color(red: 1, green: 1, blue: 1, opacity: 1))
                                    .cornerRadius(6)
                                    .foregroundColor(colorScaheme == .dark ? .white : .black)
                            }.padding(.vertical, -3)
                        }
                    }
                }
            }.listStyle(.sidebar)
        }
    }
    
    @ViewBuilder var pointView: some View{
        ScrollView{
            VStack {
                HStack {
                    Button{
                        
                    }label: {
                        VStack {
                            Text("head")
                                .font(.system(size: 20))
                                .frame(width: 150, height: 150)
                                .background(Color.accentColor.opacity(0.8))
                                .cornerRadius(100)
                            Text("head")
                        }
                    }
                }
                HStack(alignment: .top) {
                    Spacer()
                    Button{
                        
                    }label: {
                        VStack {
                            Text("")
                                .font(.system(size: 50))
                                .frame(width: 50, height: 220)
                                .background(Color.accentColor.opacity(0.8))
                                .cornerRadius(6)
                            Text("other")
                        }
                    }
                    Button{
                        
                    }label: {
                        VStack {
                            Text("")
                                .font(.system(size: 100))
                                .frame(width: 150, height: 200)
                                .background(Color.accentColor.opacity(0.8))
                            .cornerRadius(6)
                            Text("body")
                        }
                    }
                    Button{
                        
                    }label: {
                        VStack {
                            Text("")
                                .font(.system(size: 50))
                                .frame(width: 50, height: 220)
                                .background(Color.accentColor.opacity(0.8))
                                .cornerRadius(6)
                            Text("other")
                        }
                    }
                    Spacer()
                }
                
                HStack(alignment: .top) {
                    Spacer()
                    Button{
                        
                    }label: {
                        VStack {
                            Text("")
                                .font(.system(size: 50))
                                .frame(width: 70, height: 250)
                                .background(Color.accentColor.opacity(0.8))
                                .cornerRadius(6)
                            Text("other")
                        }
                    }
                    Button{
                        
                    }label: {
                        VStack {
                            Text("")
                                .font(.system(size: 50))
                                .frame(width: 70, height: 250)
                                .background(Color.accentColor.opacity(0.8))
                                .cornerRadius(6)
                            Text("other")
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}
