//
//  headPointView.swift
//  SelfPointMassageApp
//
//  Created by 許君愷 on 2024/1/23.
//

import SwiftUI

struct headPointView: View {
    @State private var headPoint = Point.hexamples
    @Environment (\.colorScheme) var colorScaheme
    
    var body: some View {
        ScrollView{
            HStack {
                Image("194")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 900)
                    .navigationTitle("Head Point")
                VStack(alignment: .leading) {
                    List(){
                        Section("head"){
                            ForEach($headPoint){ $headPoint in
                                NavigationLink{
                                    
                                } label: {
                                    HStack {
                                        Text(headPoint.name)
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .cornerRadius(6)
                                            .foregroundColor(colorScaheme == .dark ? .white : .black)
                                    }
                                }
                            }
                        }
                    }
                }
            }.frame(maxWidth: .infinity)
        }.background(Color(.secondarySystemBackground))
    }
}

#Preview {
    headPointView()
}
