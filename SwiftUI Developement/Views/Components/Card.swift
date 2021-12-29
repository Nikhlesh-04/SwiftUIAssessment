//
//  CardView.swift
//  SwiftUI Developement
//
//  Created by Nikhlesh on 29/12/21.
//

import SwiftUI

struct Card: View {
    var cardNumber: String
    var expireDate: String
    
    var body: some View {
        VStack {
            ZStack {
                Image("Rectangle")
                    .overlay(ImageOverlay(cardNumber: cardNumber, expireDate: expireDate), alignment: .bottomTrailing)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Card(cardNumber: "9901", expireDate: "12/23")
        }
        
        Group {
            ForEach(Constants.typeSizes, id: \.self) { size in
                Card(cardNumber: "9901", expireDate: "12/23")
                    .environment(\.dynamicTypeSize, size)
                    .previewDisplayName("\(size)")
            }
            Card(cardNumber: "9901", expireDate: "12/23")
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("dark")
        }.previewLayout(.sizeThatFits)
    }
}

struct ImageOverlay: View {
    var cardNumber: String
    var expireDate: String
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                VStack {
                    Image(ConstantImage.birdLogo)
                }
                Spacer()
                VStack(alignment: .leading)  {
                    Text("**** \(cardNumber)")
                        .font(.title)
                        .bold()
                        .padding(.bottom,10)
                    Text("Expiration Date")
                        .font(.footnote)
                    Text(expireDate)
                        .bold()
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            .foregroundColor(.white)
            
            Image(ConstantImage.visaLogo)
        }
        .padding(10)
    }
}
