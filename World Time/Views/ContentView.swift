//
//  ContentView.swift
//  World Time
//
//  Created by Beatrice Totanes on 1/18/22.
//

import SwiftUI

struct ContentView: View {
  @State private var city = "Manila, Philippines"
  @State private var timeNow = ""
  let timer = Timer.publish(
    every: 1,
    on: .main,
    in: .common
  ).autoconnect()
  var timeFormatter: DateFormatter{
    let fmtr = DateFormatter()
    fmtr.dateFormat = "hh:mm:ss"
    return fmtr
  }
  var dateFormatter: DateFormatter{
    let fmtr = DateFormatter()
    fmtr.dateFormat = "MMMM dd, yyyy"
    return fmtr
  }
  @State private var date = ""
  @State private var currDate = Date()
  
  var body: some View {
    ZStack {
      BackgroundView(city: $city, currDate: $currDate)
      VStack {
        RoundedeRectText(text: city)
        MainText(text: timeNow, color: "TextColor")
          .onReceive(timer, perform: { _ in
            self.timeNow = timeFormatter.string(from: currDate)
          })
          .padding(.top, 10)
          .padding(.bottom, 5)
        SmallTextSemiBold(text: date)
          .onReceive(timer, perform: { _ in
            self.date = dateFormatter.string(from: currDate)
          })
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
