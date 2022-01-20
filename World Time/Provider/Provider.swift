//
//  PostFetcher.swift
//  SwiftUINetworking
//
//  Created by Beatrice Totanes on 1/19/22.
//

import Foundation
import SwiftUI

//{
//  "abbreviation": "PST",
//  "client_ip": "54.86.50.139",
//  "datetime": "2022-01-19T16:26:32.706824+08:00",
//  "day_of_week": 3,
//  "day_of_year": 19,
//  "dst": false,
//  "dst_from": null,
//  "dst_offset": 0,
//  "dst_until": null,
//  "raw_offset": 28800,
//  "timezone": "Asia/Manila",
//  "unixtime": 1642580792,
//  "utc_datetime": "2022-01-19T08:26:32.706824+00:00",
//  "utc_offset": "+08:00",
//  "week_number": 3


struct TimeFormat: Decodable {
  let year: Int
  let month: Int
  let day: Int
  let hour: Int
  let minute: Int
  let seconds: Int
  let milliSeconds: Int
  let dateTime: String
  let date: String
  let time: String
  let timeZone: String
  let dayOfWeek: String
  let dstActive: Bool
}

//class for networking
// ObservableObject is the type of this class because other views can subscribe to this class to observe the exchanges this class is going to make
class TimeFetcher: ObservableObject {
  // published variable is required
  // Whenever this variable changes, it's going to  publish it's new data so that a view that is subscribed to this ObservableObject can catch the data and show it in the view
  @State var posts: TimeFormat?
  @Binding var currDate: Date
  var area: String
  var date: Date
  
  init(area: String, currDate: Binding<Date>) {
    self.date = Date()
    self.area = area
    self._currDate = currDate
    networking()
  }
  // Function for URL Session
  func networking() {
    let url = URL(string: "https://www.timeapi.io/api/Time/current/zone?timeZone=\(self.area)")!
    var dateString: String = ""
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSS"
    
    print(self.posts?.dateTime ?? "NULL")
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      
      do {
        let tempPosts = try JSONDecoder().self.decode(TimeFormat.self, from: data!)
        print("temp: \(tempPosts)")
        DispatchQueue.main.async {
          self.posts = tempPosts
          print("Datetime: \(self.posts?.dateTime ?? "")")
          dateString = self.posts?.dateTime ?? ""
          self.date = dateFormatter.date(from: dateString)!
          print("Converted: \(self.date)")
          self.currDate = self.date
        }
      }
      catch {
        print("Error")
      }
      
    }.resume()
    
  }
  
}
//
//class GetLocationList: ObservableObject {
//  // published variable is required
//  // Whenever this variable changes, it's going to  publish it's new data so that a view that is subscribed to this ObservableObject can catch the data and show it in the view
//  @Published var posts: [String]?
//
//  init() {
//    networking()
//  }
//  // Function for URL Session
//  func networking() {
//    let url = URL(string: "https://www.timeapi.io/api/TimeZone/AvailableTimeZones")!
//
//
//    URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//      do {
//        let tempPosts = try JSONDecoder().self.decode([String].self, from: data!)
//        print(tempPosts)
//        DispatchQueue.main.async {
//          self.posts = tempPosts
//        }
//      }
//      catch {
//        print("Error")
//      }
//
//    }.resume()
//
//  }
//}
