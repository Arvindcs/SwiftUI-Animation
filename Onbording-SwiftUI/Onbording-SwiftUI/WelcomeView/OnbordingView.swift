//
//  OnbordingView.swift
//  Onbording-SwiftUI
//
//  Created by Arvind on 26/11/20.
//

import SwiftUI

struct OnbordingView: View {
    
    @State var isAnimation = false
    var prodcut: Model
    var body: some View {
        ZStack {
            VStack {
                Image(prodcut.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 320, height: 320, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .offset(y: 80.0)
                    .scaleEffect(isAnimation ? 1.0 : 0.5)
                Spacer(minLength: 0)
                Text(prodcut.productName)
                    .foregroundColor(Color.getTextColor())
                    .font(.custom("Helvetica Neue", size: 25))
                    .offset(y: -160)
                Text(prodcut.productDiscription)
                    .foregroundColor(Color.gray)
                    .font(.custom("Helvetica Neue", size: 17))
                    .frame(maxWidth: 400)
                    .offset(y: -150)
                TextShimmer()
                    .offset(y: -50)
            }.background(Color.getBGColor2())
            .onAppear {
                withAnimation(Animation.default.speed(0.15).delay(0)) {
                    isAnimation = true
                }
            }
        }
        .cornerRadius(20)
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 70, trailing: 20))
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
        .shadow(color: Color.gray.opacity(0.7), radius: 5, x: -2.5, y: -2.5)
        .background(Color.getBGColor().ignoresSafeArea())
    }
}



extension Color {

    static
    func getBGColor() -> LinearGradient {
        let colors = [Color.init(red: 0.40, green: 0.49, blue: 0.92), Color.init(red: 0.46, green: 0.29, blue: 0.64)]
        return LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
    }
    
    static
    func getBGColor2() -> Color {
        return  Color(UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00))
    }
    
    static
    func getTextColor() -> Color {
        return Color(UIColor(red: 0.22, green: 0.82, blue: 0.71, alpha: 1.00))
    }
    
    static
    func getSwipeTextColor() -> Color {
        return Color(UIColor(red: 0.37, green: 0.36, blue: 0.49, alpha: 1.00))
    }
    
    
}

struct OnbordingView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
