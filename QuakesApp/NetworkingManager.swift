//
//  NetworkingManager.swift
//  QuakesApp
//
//  Created by Vasileios Gkreen on 22/02/2020.
//  Copyright © 2020 Vasileios Gkreen. All rights reserved.
//

import Foundation


class NetworkingManager: ObservableObject {
    @Published var dataList = QuakeAPIList(features:[])
    
    init(){
        guard let url = URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_week.geojson")
            else { return }
        
        URLSession.shared.dataTask(with: url){
            (data, _, _) in
            guard let data = data else { return }
            
            let dataResponse = try! JSONDecoder().decode(QuakeAPIList.self, from: data)
            
            
            DispatchQueue.main.async {
                self.dataList = dataResponse
                
                print(self.dataList.features)
            }
            
        }.resume()
    }
}
