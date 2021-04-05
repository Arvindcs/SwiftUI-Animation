//
//  ContentView.swift
//  NikeAppUI

import SwiftUI

struct ContentView: View {
    
    //MARK: States
    @State var more = false
    @State var selectedSize = 7
    @State var isAddedInCart = false
    @State var isAddedInWishList = false
    @State var selectedColor: Int = 0
    
    //MARK: variables
    let black = Color.black.opacity(0.7)
    
    //MARK: body
    var body: some View {
        VStack {
            ZStack {
                HStack {
                   
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(Color("red"))
                            .cornerRadius(4)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        isAddedInWishList.toggle()
                    }) {
                        Image(systemName: "suit.heart")
                            .font(.system(size: 22))
                            .foregroundColor(isAddedInWishList ? Color.white : Color("red"))
                            .frame(width: 40, height: 40)
                            .background(isAddedInWishList ? Color("red") : Color.white)
                            .cornerRadius(4)
                    }
                }
                
                Image("nike")
                    .resizable()
                    .frame(width: 55, height: 55)
                
            }
            .padding()
            
        
            Image(selectedColor == 0 ? "blue" : (selectedColor == 1 ? "black" : (selectedColor == 2 ? "silver" : "blue")))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width - (more ? 200 : 150))
                .padding(.top, -70)
            
            VStack {
                
                VStack(alignment: .leading) {
                 
                    HStack {
                        Text("$100")
                            .font(.system(size: 28, weight: .bold, design: .monospaced))
                            .foregroundColor(Color("red"))
                        
                        Text("$150")
                            .font(.system(size: 15, weight: .bold, design: .monospaced))
                            .foregroundColor(Color.gray)
                            .padding(.top, 10)
                                                
                    }
                    Text("Revolution 5 Lace-up Sport Shoes")
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                        .foregroundColor(black)
                        .padding(.top, 10)
                }
                .padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 10))
                
                VStack(alignment: .leading){
                 
                    Text("Powerful, strong, durable – every athlete and their clothes. With innovative sportswear designed to bring optimum comfort and support, Nike brings to you the best you’ll ever get. Shop for Nike sports shoes , clothing and accessories now with AJIO!")
                        .font(.system(size: 15, weight: .bold, design: .monospaced))
                        .lineLimit(more ? nil : 3)
                    
                    Button(action: {
                        withAnimation {
                            more.toggle()
                        }
                    }) {
                        Text("Read More")
                            .font(.system(size: 15, weight: .bold, design: .monospaced))
                            .foregroundColor(Color("red"))
                    }
                    
                } //.padding([.leading, .trailing])
                
                
                HStack( spacing: 15) {
                        
                    Text("Color")
                        .font(.system(size: 22, weight: .bold, design: .monospaced))
                        .foregroundColor(black)
                        .frame(width: 75, alignment: .leading)
                    
                    ColorButton(index: $selectedColor)
                    
                    Spacer(minLength: 0)
                }.padding(.leading)
                .padding(.top, 10)
                
                HStack( spacing: 15) {
                        
                    Text("Size")
                        .font(.system(size: 22, weight: .bold, design: .monospaced))
                        .foregroundColor(black)
                        .frame(width: 75, alignment: .leading)
                    
                    ForEach(sizes, id: \.self) { title in
                        SizeButton(size: $selectedSize, title: title)
                    }
                    
                    Spacer(minLength: 0)
                    
                }.padding(.leading)
                .padding(.top, 10)
                
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        isAddedInCart.toggle()
                    }
                }) {
                    
                    Label(
                        title: {
                            
                            Text(isAddedInCart ? "Added" : "Add To Cart")
                            .font(.system(size: 22, weight: .bold, design: .monospaced))
                            .foregroundColor(.white)
                            
                        },
                        icon: {
                            Image(systemName: isAddedInCart ? "checkmark.circle.fill" : "card.fill")
                                .font(.system(size: 22, weight: .bold, design: .monospaced))
                                .foregroundColor(.white)
                        })
                        .padding(.vertical, 12)
                        .frame( width: UIScreen.main.bounds.width - 75)
                        .background(isAddedInCart ? Color.green : Color("red"))
                        .clipShape(Capsule())
                        .padding(.bottom, 40)
                    
                    
                 
                }
                
            }.padding(.leading, 20)
            .background(Color.white)
            .shadow(radius: 0)
            .shadow(color: Color/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.15), radius: 5, x: -5, y: -10 )

            
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
