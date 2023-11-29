//
//  SplashScreen.swift
//  NoteApp
//
//  Created by Devasis KC on 29/11/2023.
//

import Foundation
import SwiftUI

struct SplashScreen: View {
    @State private var scale = 0.7
    @Binding var isActive: Bool
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "scribble.variable")
                    .font(.system(size: 100))
                    .foregroundColor(.blue)
                Text("Note App")
                    .font(.system(size: 20))
            }.scaleEffect(scale)
            .onAppear{
                withAnimation(.easeIn(duration: 0.7)) {
                    self.scale = 0.9
                }
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}
