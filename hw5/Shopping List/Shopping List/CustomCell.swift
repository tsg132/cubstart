//
//  CustomCell.swift
//  Shopping List
//
//  Created by Tony Hong on 3/12/22.
//

import SwiftUI

struct CustomCell: View {
    let imageName: String
    let itemName: String
    let quantity: Int
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
            Text(itemName)
            Spacer()
            Text("\(quantity)")
        }
    }
}
