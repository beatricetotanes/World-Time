import SwiftUI
import Combine

struct Clock : View {
  @State var date = Date()
  
  
  var body: some View{
    VStack {
      Text("\(timeString(date: date))")
        .onAppear(perform: {
          let _ = self.updateTimer
        })
      Text("hello1")
    }
    
  }
  
  var timeFormat: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm:ss a"
    formatter.timeZone = TimeZone(abbreviation: "Europe/Amsterdam")
    return formatter
  }
  
  func timeString(date: Date) -> String{
    let time = timeFormat.string(from: date)
    return time
  }
  
  var updateTimer: Timer{
    Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
      self.date = Date()
    })
  }
  
}
struct TestTime_Previews: PreviewProvider {
  static var previews: some View {
    Clock()
  }
}
