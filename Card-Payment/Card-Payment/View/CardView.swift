//
//  CardView.swift
//  Card-Payment
//
//  Created by Arvind on 15/12/20.
//

import SwiftUI

struct CardView: View {
    @Binding var isAnimatonCard: Bool
    public var cardModel: CardModel
    
    var body: some View {
        ZStack {
            cardModel.bgImage
            VStack {
                HStack {
                    Text("Premium")
                        .font(.system(size: 25, weight: .medium))
                        .foregroundColor(.white)
                        .offset(x: 10)
                    Spacer()
                    Image("sbi.card")
                        .resizable()
                        .frame(width: 150, height: 150)
                }
                .padding(.leading, 20)
                .padding(.trailing, 8)
                .offset(y: -20)
                
                HStack(alignment: .center) {
                    HStack (spacing: 5) {
                        ForEach((1...4).reversed(), id: \.self) {
                            NumberDot(num: $0)
                        }
                    }
                    .padding(.trailing, 10)
                    
                    HStack (spacing: 5) {
                        ForEach((1...4).reversed(), id: \.self) {
                            NumberDot(num: $0)
                        }
                    }.padding(.trailing, 10)
                    
                    HStack (spacing: 5) {
                        ForEach((1...4).reversed(), id: \.self) {
                            NumberDot(num: $0)
                        }
                    }.padding(.trailing, 10)
                    
                    Text(cardModel.number)
                        .foregroundColor(.white).opacity(0.7)
                        .font(.system(size: 25, weight: .bold))
                    
                }.offset(y: -35)
                
                HStack() {
                    Text("VALID THRU")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                    
                    Text("05/20")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                    
                    Spacer()
                } .padding(.leading, 20)
                
                HStack {
                                      
                    Text(cardModel.name.capitalized)
                        .font(.system(size: 22, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                    Spacer()
                    Image("visa")
                        .resizable()
                        .frame(width: 70, height: 70)
                    ZStack {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white).opacity(0.7)
                            .padding(.trailing, 40)
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white).opacity(0.7)
                    }
                }.offset(y: -20)
            }
        }
        .frame(width: 370, height: 250)
        .cornerRadius(25)
        .rotationEffect(.degrees(isAnimatonCard ? 0 : 90))
        .animation(.spring())        
    }
}

struct NumberDot: View {
    var num : Int
    var body: some View {
        Circle()
            .frame(width: 13, height: 13)
            .foregroundColor(.white).opacity(0.6)
    }
}

struct CardModel: Identifiable {
    var id = UUID()
    var number: String
    var name: String
    var total: String
    var limit: Int
    var bgImage: LinearGradient
}

let bankCard = [
    CardModel(number: "5523", name: "Arvind Patel", total: "80000", limit: 100000, bgImage: Color.getGradientColor1()),
    CardModel(number: "6776", name: "Arvind Patel", total: "70000", limit: 150000, bgImage: Color.getGradientColor2()),
    CardModel(number: "9090", name: "Arvind Patel", total: "90000", limit: 130000, bgImage: Color.getGradientColor1()),
    CardModel(number: "0202", name: "Arvind Patel", total: "50000", limit: 140000, bgImage: Color.getGradientColor1()),
    CardModel(number: "5252", name: "Arvind Patel", total: "90000", limit: 140000, bgImage: Color.getGradientColor1())
]
