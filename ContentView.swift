import SwiftUI

struct ContentView: View {
    @State private var whichView = 1
    @State private var hpoint = HeadPoint.examples
    
    var body: some View {
        VStack {
            Apptitle
            
            barButton
            
            ScrollView{
                Text("What's bothering you today?")
                    .font(.title3.bold())
                ForEach($hpoint) { $hpoint in
                    Text(hpoint.symptom).padding(.vertical, 10)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .contentShape(Rectangle())
                }
                .padding(.horizontal)
                .listStyle(.sidebar)
            }
        }.background(Color(.secondarySystemBackground))
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
                        .padding(.horizontal, 20)
                        .foregroundColor(whichView == 1 ? .accentColor : .gray)
                }
            }
            
            Button{
                whichView = 2
            }label: {
                VStack {
                    Text("point")
                        .font(.headline)
                        .padding(.horizontal, -10)
                        .foregroundColor(whichView == 2 ? .accentColor : .gray)
                }
            }
            
            Button{
                whichView = 3
            }label: {
                VStack {
                    Text("test")
                        .font(.headline)
                        .padding(.horizontal, 20)
                        .foregroundColor(whichView == 3 ? .accentColor : .gray)
                }
            }
            Spacer()
        }
        Divider().padding(.horizontal, 20)
    }
}
