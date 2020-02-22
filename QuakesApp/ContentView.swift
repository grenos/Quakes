//
//  ContentView.swift
//  QuakesApp
//
//  Created by Vasileios Gkreen on 22/02/2020.
//  Copyright © 2020 Vasileios Gkreen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkingManager()
    
    var body: some View {
        
        NavigationView{
            List(networkManager.dataList.features, id: \.properties) {
                 data in
                NavigationLink(destination: QuakeDetails(data: data)){
                      ListRow(data: data)
                }.navigationBarTitle("Quakes")
             }
        }
    }
}





func timeConverter(timeStamp: Double) -> String {
    
    // so we can get milliseconds
    let unixTimeStamp = timeStamp / 1000
    
    let date = Date(timeIntervalSince1970: unixTimeStamp)
    
    let dateFormater = DateFormatter()
    dateFormater.timeZone = TimeZone(abbreviation: "GMT")
    dateFormater.locale = NSLocale.current
    dateFormater.dateFormat = "dd MMM YY, hh:mm a"
    
    return dateFormater.string(from: date)
    
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
