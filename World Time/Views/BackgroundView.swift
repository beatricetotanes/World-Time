//
//  BackgroundView.swift
//  World Time
//
//  Created by Beatrice Totanes on 1/18/22.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
      VStack{
        HStack {
          Spacer()
          Button(action: {}) {
            RoundedImageViewFilled(icon: "magnifyingglass")
          }
            .padding(.trailing, 30)
        }
        Spacer()
        Circle()
          .frame(width: 350, height: 350)
        Spacer()
      }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
