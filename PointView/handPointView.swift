//
//  handPointView.swift
//  SelfPointMassageApp
//
//  Created by 許君愷 on 2024/1/23.
//

import SwiftUI

struct handPointView: View {
    var body: some View {
        ScrollView{
            VStack {
                Image("1342")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 900)
                    .navigationTitle("Hand Point")
            }.frame(maxWidth: .infinity)
            //.background(Color(.secondarySystemBackground))
        }.background(Color(.secondarySystemBackground))
    }
}

#Preview {
    handPointView()
}
