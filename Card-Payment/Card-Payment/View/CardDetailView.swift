//
//  CardDetailView.swift
//  Card-Payment
//
//  Created by Arvind on 15/12/20.
//

import SwiftUI

struct CardDetailView: View {
    
    var body: some View {
        VStack {
            Spacer()
            ForEach(getCardDetailModels()) { card in
                CardRow(card: card)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 400)
        .background(Color.init(hex: "2B2B2B"))
        .cornerRadius(28)
    }
}

struct CardRow: View {
    var card: CardDetailModel
    var body: some View {
        HStack {
            Image(card.image)
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(Color.gray)
                .cornerRadius(20)
                .padding(.leading, 26)
            
            VStack(alignment: .leading) {
                Text(card.name)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                Text(card.name)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color.gray)
            }
            Spacer()
            Text("\(card.transactionCharge) Rs")
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                .padding(.trailing, 30)
        }
        .padding(.vertical, 8)
    }
}

struct CardDetailModel: Identifiable {
    var id = UUID()
    var name: String
    var transactionCharge: Int
    var image: String
}

func getCardDetailModels() -> [CardDetailModel] {
    return [
        CardDetailModel(name: "Apple Store", transactionCharge: 2000, image: "apple"),
        CardDetailModel(name: "Amazon Store", transactionCharge: 3000, image: "amazon"),
        CardDetailModel(name: "Super Market", transactionCharge: 4000, image: "shop"),
        CardDetailModel(name: "Nike Store", transactionCharge: 5000, image:   "nike"),
        CardDetailModel(name: "Nike Store", transactionCharge: 5000, image:   "flipkart"),
    ]
}
