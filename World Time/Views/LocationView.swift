//
//  LocationView.swift
//  World Time
//
//  Created by Beatrice Totanes on 1/18/22.
//

import SwiftUI

struct LocationView: View {
  static private var text = Binding.constant("Philippines")
  var body: some View {
    VStack (alignment: .leading) {
      HStack {
        Spacer()
        Button(action: {}) {
          RoundedImageViewFilled(icon: "xmark")
        }
        .padding(.trailing, 30)
      }
      MainText(text: "Location", color: "TextColorLocationView")
        .padding(.leading, 20)
      SearchBar(text: LocationView.text)
        .padding(.bottom, 10)
      CountryList()
      Spacer()
    }
  }
}

struct LocationPreview: View {
  static private var text = Binding.constant("Wut")
  
  var body: some View{
    VStack{
      LocationView()
      //SearchBar(text: LocationPreview.text)
    }
  }
}

struct LocationView_Previews: PreviewProvider {
  
  static var previews: some View {
    LocationPreview()
  }
}

struct SearchBar: View {
  @Binding var text: String
  @State private var isEditing = false
  
  var body: some View{
    HStack{
      TextField("Search", text: $text)
        .padding(15)
        .padding(.horizontal, 10) // padding of text inside
        //        .background(Color(.systemGray6))
        //        .cornerRadius(8)
        //        .padding(.horizontal, 10) // how long is the search bar
        .overlay(
          HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
              .padding(.trailing, 30)
              .font(.headline)
              .foregroundColor(.black)
          }
        )
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .stroke()
            .padding(.horizontal, 10)
        )
        .padding(.horizontal, 10)
        .onTapGesture {
          isEditing = true
        }
      //      if isEditing {
      //        Button(action: {
      //          isEditing = false
      //          text = ""
      //        }) {
      //          Text("Cancel")
      //        }
      //        .padding(.leading, 20)
      //        .transition(.move(edge: .trailing))
      //        .animation(.default)
      //      }
    }
  }
}

struct CountryList: View {
  private var countries = [
    "Philippines", "America", "Mexico", "Philippines", "America", "Mexico", "Philippines", "America", "Mexico", "Philippines", "America", "Mexico", "Philippines", "America", "Mexico", "Philippines", "America", "Mexico", "Philippines", "America", "Mexico", "Philippines", "America", "Mexico", "Philippines", "America", "Mexico"
  ]
  
  var body: some View{
    List {
      ForEach(countries, id: \.self) {
        myRow in
        Button(action: {}) {
          Text(myRow)
          //.listStyle(Color(.black)) xcode13
        }
        
      }
    }
    .padding(.horizontal, 10)
  }
}
