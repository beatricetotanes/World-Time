//
//  TextView.swift
//  World Time
//
//  Created by Beatrice Totanes on 1/18/22.
//

import SwiftUI

struct RoundedeRectText: View {
  var text: String
  
  var body: some View {
    SmallTextSemiBold(text: text)
      .font(.headline)
      .overlay(
        RoundedRectangle(cornerRadius: 10)
          .stroke(lineWidth: 1.0)
          .frame(width: 124, height: 39)
      )
  }
}

struct SmallTextSemiBold: View {
  var text: String
  
  var body: some View {
    Text(text)
      .font(.headline)
  }
}


struct SmallText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .font(.body)
  }
}

struct MainText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .font(.system(size: 70))
      .fontWeight(.bold)
  }
}

struct TextView: View {
  var body: some View {
    VStack{
      RoundedeRectText(text: "Philippines")
      MainText(text: "10:00 PM")
      SmallText(text: "Greece")
    }
  }
}

struct TextView_Previews: PreviewProvider {
  static var previews: some View {
    TextView()
  }
}
