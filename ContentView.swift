import SwiftUI

struct ContentView: View {
    @State private var whichView = 1
    @State private var hpoint = Point.hexamples
    @State private var bpoint = Point.bexamples
    @State private var opoint = Point.oexamples
    
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
            List() {
                Section("Head"){
                    ForEach($hpoint) { $hpoint in
                        NavigationLink {
                            ScrollView{
                                VStack {
                                    VStack(alignment: .leading){
                                        Image("\(hpoint.image)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        Text("Point name: \(hpoint.name)")
                                        Text("Point location: \(hpoint.lacation)")
                                            .padding(.vertical)
                                        Text("Healing part: \(hpoint.healPart)")
                                    }
                                        .padding()
                                        .font(.headline)
                                    Text("Detail: \(hpoint.detail)")
                                        .font(.headline)
                                    Spacer()
                                }
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                .padding()
                            }
                            //.background(Color(.secondarySystemBackground))
                            .navigationTitle(hpoint.symptom)
                        } label: {
                            HStack {
                                Image(hpoint.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
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
                                Image("119")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
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
                                Image("120")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
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
            ZStack {
                Image("1091")
                VStack {
                    HStack {
                        Button{
                            
                        }label: {
                            VStack {
                                Text("head")
                                    .font(.system(size: 20))
                                    .frame(width: 170, height: 230)
                                    .background(Color.secondary.opacity(0.1))
                                    .cornerRadius(100)
                                    .foregroundColor(.secondary.opacity(0))
                            }
                        }
                    }
                    HStack(alignment: .top) {
                        Spacer()
                        Button{
                            
                        }label: {
                            VStack {
                                Text("hand")
                                    .font(.system(size: 20))
                                    .frame(width: 50, height: 370)
                                    .background(Color.secondary.opacity(0.1))
                                    .cornerRadius(6)
                                    .foregroundColor(.secondary.opacity(0))
                                    .padding(.top, 20)
                                    .padding(.trailing, -20)
                            }
                        }
                        VStack {
                            Button{
                                
                            }label: {
                                VStack {
                                    Text("body")
                                        .font(.system(size: 20))
                                        .frame(width: 200, height: 320)
                                        .background(Color.secondary.opacity(0.1))
                                    .cornerRadius(8)
                                    .foregroundColor(.secondary.opacity(0))
                                    //.padding(.horizontal)
                                }
                            }
                            HStack(alignment: .bottom) {
                                Button{
                                    
                                }label: {
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
                                Button{
                                    
                                }label: {
                                    VStack {
                                        Text("feet")
                                            .font(.system(size: 20))
                                            .frame(width: 70, height: 430)
                                            .background(Color.secondary.opacity(0.1))
                                            .cornerRadius(6)
                                            .foregroundColor(.secondary.opacity(0))
                                    }
                                }
                                Button{
                                    
                                }label: {
                                    VStack {
                                        Text("feet")
                                            .font(.system(size: 20))
                                            .frame(width: 70, height: 430)
                                            .background(Color.secondary.opacity(0.1))
                                            .cornerRadius(6)
                                            .foregroundColor(.secondary.opacity(0))
                                    }
                                }
                                Button{
                                    
                                }label: {
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
                            }.padding(.horizontal, 5)
                        }
                        Button{
                            
                        }label: {
                            VStack {
                                Text("hand")
                                    .font(.system(size: 20))
                                    .frame(width: 50, height: 370)
                                    .background(Color.secondary.opacity(0.1))
                                    .cornerRadius(6)
                                    .foregroundColor(.secondary.opacity(0))
                                    .padding(.top, 20)
                                    .padding(.leading, -20)
                            }
                        }
                        Spacer()
                    }
                }.padding(.top, -40)
            }.padding(.top, -70)
        }.background(Color(.systemBackground))
    }
}
