//
//  AnimatedDots.swift
//  SimpleActivityLoading
//
//  Created by Arvind on 10/09/20.
//  Copyright © 2020 Arvind. All rights reserved.
//

import SwiftUI

struct AnimatedDots: View {
    
    @State var xOffset: CGFloat = 0
    @State var yOffset: CGFloat = 0
    @State var xOffsetForDifferentDot: CGFloat = 0
    
    var animationTime: Double = 0.8
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: self.spaceBetweenDots(geo.size)) {
                ForEach(0..<3) { i in
                    Circle().fill(Color.getSecondBallColor())
                        .frame(width: self.getwidthForDot(geo.size), height: self.getwidthForDot(geo.size))
                        .offset(self.offsetForDotAtIndex(i, in: geo.size))
                }
            }
            .offset(self.offsetIn(geo.size))
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: Double(self.animationTime) * 1.2, repeats: true) { (_) in
                    DispatchQueue.main.async {
                        withAnimation(
                            .easeInOut(duration: Double(self.animationTime)/4)) {
                            self.xOffset = 0
                            self.yOffset = -(self.getwidthForDot(geo.size) + self.spaceBetweenDots(geo.size))
                        }
                    }
                    DispatchQueue.main
                        .asyncAfter(deadline: .now() + Double(self.animationTime)/4 + 0.04) {
                            withAnimation(Animation
                                            .easeInOut(duration: Double(self.animationTime)/2)) {
                                self.xOffset = (self.getwidthForDot(geo.size) + self.spaceBetweenDots(geo.size)) * 2
                                self.yOffset = -(self.getwidthForDot(geo.size) + self.spaceBetweenDots(geo.size))
                                self.xOffsetForDifferentDot = -(self.getwidthForDot(geo.size) + self.spaceBetweenDots(geo.size))
                            }
                        }
                    DispatchQueue.main
                        .asyncAfter(deadline: .now() + Double(self.animationTime) * 0.75 + 0.04) {
                            withAnimation(Animation
                                            .easeInOut(duration: Double(self.animationTime)/4)) {
                                self.xOffset = (self.getwidthForDot(geo.size) + self.spaceBetweenDots(geo.size)) * 2
                                self.yOffset = 0
                            }
                        }
                    DispatchQueue.main
                        .asyncAfter(deadline: .now() + Double(self.animationTime) + 0.04) {
                            self.xOffsetForDifferentDot = 0
                            self.xOffset = 0
                            self.yOffset = 0                    }
                }
            }
        }
    }
    
    func getwidthForDot(_ size: CGSize) -> CGFloat {
        min(size.width * 0.3, size.height / 2.05)
    }
    
    func spaceBetweenDots(_ size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.05
    }
    
    func offsetForDotAtIndex(_ index: Int, in size: CGSize) -> CGSize {
        index == 0 ? CGSize(width: xOffset, height: yOffset) : CGSize(width: xOffsetForDifferentDot, height: 0)
    }
    
    func offsetIn(_ size: CGSize) -> CGSize {
        CGSize(width: (size.width / 2) - (1.5 * getwidthForDot(size) + spaceBetweenDots(size)),
               height: (size.height - getwidthForDot(size))/2 + (getwidthForDot(size) + spaceBetweenDots(size))/2)
    }
}
