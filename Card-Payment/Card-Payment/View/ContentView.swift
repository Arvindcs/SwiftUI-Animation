//
//  ContentView.swift
//  Card-Payment
//
//  Created by Arvind on 15/12/20.
//

import SwiftUI

struct ContentView: View {
    @State var isAnimatonCard = false
    @State var index: Int = 0
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            TabView(selection: $isAnimatonCard) {
                
                ForEach(bankCard) { item in
                    VStack(alignment: .center) {
                        
                        Text("Statement")
                            .font(.system(size: 35, weight: .bold))
                            .foregroundColor(.white)
                            .opacity(isAnimatonCard ? 1 : 0).padding(.top, 100)
                        
                        Text("Availble Credit Limit")
                            .foregroundColor(Color.white)
                            .font(.system(size: 20, weight: .medium))
                            .opacity(isAnimatonCard ? 0 : 1)
                            .padding(.leading, -20)
                        
                        Text("\(item.limit)")
                            .foregroundColor(.white)
                            .font(.system(size: 35, weight: .bold))
                            .opacity(isAnimatonCard ? 0 : 1)
                            .padding(.leading, -20)
                  
                        HStack() {
                            GeometryReader { geometry in
                                CardView(isAnimatonCard: self.$isAnimatonCard,
                                         cardModel: item).rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 20) / 30),
                                                                           axis: (x: 10, y: -20, z: 0))
                                    .padding(.top, isAnimatonCard ? -50 : 50)
                            }
                        }
                    }.padding(.leading, 30)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            CardDetailView()
                .offset(y: isAnimatonCard ? 250 : 1000)
                .animation(.spring())
        }
        .animation(.spring())
        .onTapGesture {
            isAnimatonCard.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().onTapGesture {
           
        }
    }
}
