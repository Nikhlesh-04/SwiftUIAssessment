//
//  Transaction.swift
//  SwiftUI Developement
//
//  Created by Nikhlesh on 29/12/21.
//

import SwiftUI

struct Transaction: View {
    var inReward: Bool
    var name:String
    var date:String
    var balance:String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(name)
                        .bold()
                        .padding(.vertical,3)
                    if inReward {
                        Image(ConstantImage.birdColor)
                    }
                }
                Text(date)
                    .bold()
                    .font(.footnote)
                    .foregroundColor(Color(.systemGray))
            }
            Spacer(minLength: 32)
            Text(balance)
                .bold()
                .lineLimit(1)
        }
    }
}

struct Transaction_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Constants.typeSizes, id: \.self) { size in
                Transaction(inReward: true, name: "Starbucks", date: "Dec 29, 2021", balance: "-$10.54")
                    .environment(\.dynamicTypeSize, size)
                    .previewDisplayName("\(size)")
            }
            Transaction(inReward: true, name: "Starbucks", date: "Dec 29, 2021", balance: "-$10.54")
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("dark")
        }.previewLayout(.sizeThatFits)
    }
}
