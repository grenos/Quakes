//
//  ListRow.swift
//  QuakesApp
//
//  Created by Vasileios Gkreen on 22/02/2020.
//  Copyright © 2020 Vasileios Gkreen. All rights reserved.
//

import SwiftUI

struct ListRow: View {
    
    var data: Features
    
    var body: some View {
        HStack(alignment: .center, spacing: 9){
            
            VStack(alignment: .leading){
                
                VStack{
                    Text(String(data.properties.mag))
                        .bold()
                        .foregroundColor(.white)
                        .font(.headline)
                }.frame(width: 100, height: 100)
                    .background(Color.green)
                
            }.clipShape(Circle())
                .overlay(Circle()
                .stroke(Color.gray, lineWidth: 2))
                .shadow(radius: 10)
            
            VStack(){
                Text(data.properties.place)
                    .foregroundColor(.gray)
                    .bold()
                
                Text("Time: \(timeConverter(timeStamp: data.properties.time))")
                    .italic()
                    .foregroundColor(.orange)
                    .font(.subheadline)
                    .padding(.top, 2)
            }
        }
    }
}

//struct ListRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRow(data: NetworkingManager().dataList.features[0])
//    }
//}
