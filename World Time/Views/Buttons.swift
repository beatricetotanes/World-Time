//
//  Buttons.swift
//  World Time
//
//  Created by Beatrice Totanes on 1/18/22.
//

import SwiftUI


struct RoundedImageViewFilled: View {
  var icon: String
  
  var body: some View {
    Image(systemName: icon)
      .font(.title)
      .foregroundColor(.white)
      .frame(width: Constants.General.buttonSize, height: Constants.General.buttonSize)
      .background(
        Circle()
          .fill(Color(.black))
      )
  }
}

struct RoundedImageViewFilledView: View {
  
  var body: some View {
    VStack{
      RoundedImageViewFilled(icon: "xmark")
      RoundedImageViewFilled(icon: "magnifyingglass")
    }
  }
}


struct Button_Previews: PreviewProvider {
  static var previews: some View {
    RoundedImageViewFilledView()
  }
}
