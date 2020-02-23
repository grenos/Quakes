//
//  QuakeDetails.swift
//  QuakesApp
//
//  Created by Vasileios Gkreen on 22/02/2020.
//  Copyright © 2020 Vasileios Gkreen. All rights reserved.
//

import SwiftUI
import UIKit
import Foundation
import MapKit

struct QuakeDetails: View {
    
    var data: Features
    
    var body: some View {
        ZStack(alignment: .top){
            
            MapView(data: data)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(alignment: .center, spacing: 9){
                Text(String(data.properties.mag))
                    .font(.largeTitle)
                
                Text(data.properties.place)
                
            }.clipShape(Rectangle())
                .frame(width: nil, height: nil)
                .padding(.all, 20)
                .background(Color.green)
                .shadow(radius: 9)
                .cornerRadius(9)
                .opacity(0.8)
        }
    }
}


struct MapView: UIViewRepresentable {
    var data: Features
    
    // create view wherer map will be show
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    // create map inside view
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        let annotation = MKPointAnnotation()
        
        let coordinates = CLLocationCoordinate2D(
            latitude: data.geometry.coordinates[1], longitude: data.geometry.coordinates[0])
        
        let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
        
        let region = MKCoordinateRegion(center: coordinates, span: span)
        
        uiView.setRegion(region, animated: true)
        
        annotation.coordinate = coordinates
        annotation.title = data.properties.place
        annotation.subtitle = "Magnitude: \(data.properties.mag)"
        
        uiView.addAnnotation(annotation)
        
    }
}






//struct QuakeDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        QuakeDetails()
//    }
//}
