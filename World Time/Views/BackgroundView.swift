//
//  BackgroundView.swift
//  World Time
//
//  Created by Beatrice Totanes on 1/18/22.
//

import SwiftUI

struct BackgroundView: View {
  @State private var locationViewIsShowing = false
  @Binding var city: String
  @Binding var currDate: Date
  
    var body: some View {
      ZStack {
        VStack{
          HStack {
            Spacer()
            Button(action: {
              locationViewIsShowing = true
            }) {
              RoundedImageViewFilled(icon: "magnifyingglass")
            }
            .padding(.trailing, 30)
            .padding(.top, 30)
            .fullScreenCover(isPresented: $locationViewIsShowing,onDismiss: {},content:{ LocationView(locationViewIsShowing: $locationViewIsShowing,city: $city, currDate: $currDate)})
          }
          Spacer()
        }
        Circle()
          .frame(width: 350, height: 350)
      }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(city: .constant("Manila"), currDate: .constant(Date()))
    }
}
