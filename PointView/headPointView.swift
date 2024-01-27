//
//  headPointView.swift
//  SelfPointMassageApp
//
//  Created by 許君愷 on 2024/1/23.
//

import SwiftUI

struct headPointView: View {
    var body: some View {
        ScrollView{
            VStack {
                Image("194")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 900)
                    .navigationTitle("Head Point")
            }.frame(maxWidth: .infinity)
        }.background(Color(.secondarySystemBackground))
    }
}

#Preview {
    headPointView()
}
