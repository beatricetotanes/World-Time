//
//  LocationView.swift
//  World Time
//
//  Created by Beatrice Totanes on 1/18/22.
//

import SwiftUI

struct LocationView: View {
  @Binding var locationViewIsShowing: Bool
  @Binding var city: String
  @Binding var currDate: Date
  
  var body: some View {
    ZStack {
      VStack {
        HStack {
          Spacer()
          Button(action: {
            locationViewIsShowing = false
          }) {
            RoundedImageViewFilled(icon: "xmark")
          }
          .padding(.trailing, 30)
          .padding(.top, 30)
        }
        Spacer()
        //.padding(.to)
      }
      VStack (alignment: .leading) {
        MainText(text: "Location", color: "TextColorLocationView")
          .padding(.leading, 20)
          .padding(.top, 80)
        LocationList(city: $city, currDate: $currDate, locationViewIsShowing: $locationViewIsShowing)
        Spacer()
      }
    }
  }
}


struct LocationList: View {
  @Binding var city: String
  @Binding var currDate: Date
  @State private var text = ""
  @Binding var locationViewIsShowing: Bool
  
  var countries = [
    "Helsinki, Finland" : "Europe/Helsinki",
    "Copenhagen, Denmark": "Europe/Copenhagen",
    "Oslo, Norway": "Europe/Oslo",
    "Brussels, Belgium": "Europe/Brussels",
    "Stockholm, Sweden": "Europe/Stockholm",
    "Zurich, Switzerland": "Europe/Zurich",
    "Amsterdam, Netherlands": "Europe/Amsterdam",
    "Paris, France": "Europe/Paris",
    "Berlin, Germany": "Europe/Berlin",
    "Tokyo, Japan": "Asia/Tokyo",
    "London, United Kingdom": "Europe/London",
    "Toronto, Canada": "America/Toronto",
    "Seoul, South Korea": "Asia/Seoul",
    "Los Angeles, United States": "America/Los_Angeles",
    "Taipei, Taiwan": "Asia/Taipei",
    "Vienna, Austria": "Europe/Vienna",
    "Sydney, Australia": "Australia/Sydney",
    "Dublin, Ireland": "Europe/Dublin",
    "Singapore, Singapore": "Asia/Singapore",
    "Madrid, Spain": "Europe/Madrid",
    "Manila, Philippines": "Asia/Manila"
  ]
  
  
  var body: some View{
    //let displayCities = Array(countries.keys).sorted()
    
    VStack {
      SearchBar(text: $text)
        .padding(.bottom, 10)
      List {
        ForEach(searchResults, id: \.self) {
          myRow in
          Button(action: {
            self.city = myRow
            TimeFetcher(area: countries[myRow]!, currDate: $currDate)
            locationViewIsShowing = false
          }) {
            Text(myRow)
            //.listStyle(Color(.black)) xcode13
          }
          
        }
      }
    }
  }
  
  var searchResults: [String] {
    let displayCities = Array(countries.keys).sorted()
    
    if text.isEmpty {
      return displayCities
    } else {
      return displayCities.filter{$0.contains(text)}
    }
  }
}


struct LocationPreview: View {
  static private var text = Binding.constant("Wut")
  static private var showing = Binding.constant(true)
  
  var body: some View{
    VStack{
      LocationView(locationViewIsShowing: LocationPreview.showing, city: .constant("Manila"), currDate: .constant(Date()))
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
    }
  }
}
