//
//  QuakeDetails.swift
//  QuakesApp
//
//  Created by Vasileios Gkreen on 22/02/2020.
//  Copyright © 2020 Vasileios Gkreen. All rights reserved.
//

import SwiftUI

struct QuakeDetails: View {
    
    var data: Features
    
    var body: some View {
        VStack(){
            Text(data.properties.place)
        }
    }
}

//struct QuakeDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        QuakeDetails()
//    }
//}
