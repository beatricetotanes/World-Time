//
//  ContentView.swift
//  World Time
//
//  Created by Beatrice Totanes on 1/18/22.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      BackgroundView()
      VStack {
        RoundedeRectText(text: "Philippines")
        MainText(text: "10:00 PM", color: "TextColor")
          .padding(.top, 10)
          .padding(.bottom, 5)
        SmallTextSemiBold(text: "January 18, 2022")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
