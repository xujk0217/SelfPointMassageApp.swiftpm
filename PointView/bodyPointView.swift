//
//  bodyPointView.swift
//  SelfPointMassageApp
//
//  Created by 許君愷 on 2024/1/23.
//

import SwiftUI

struct bodyPointView: View {
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
}

#Preview {
    bodyPointView()
}
