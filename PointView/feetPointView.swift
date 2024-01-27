//
//  feetPointView.swift
//  SelfPointMassageApp
//
//  Created by 許君愷 on 2024/1/23.
//

import SwiftUI

struct feetPointView: View {
    var body: some View {
        ScrollView{
            VStack {
                Image("1502")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 900)
                    .navigationTitle("Feet Point")
            }.frame(maxWidth: .infinity)
        }.background(Color(.secondarySystemBackground))
    }
}

#Preview {
    feetPointView()
}
