
import SwiftUI

struct ContentView: View {
    
    let characters = Array("CodeWithArvind")
    @State private var enable = false
    @State private var dragValue = CGSize.zero
    
    var body: some View {
        
        HStack(spacing: 0) {
            ForEach(0..<characters.count) { num in
                Text(String(characters[num]))
                    .padding(6)
                    .font(.title)
                    .background(enable ?
                                    Color.getDefaultColor1() :
                                    Color.getDefaultColor2())
                    .offset(dragValue)
                    .foregroundColor(.white)
                    .animation(Animation.default
                    .delay(Double(num) / 10))
            }
        }.gesture(DragGesture()
                    .onChanged { dragValue = $0.translation }
                    .onEnded { _ in
                        dragValue = .zero
                        enable.toggle()
                    }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    
    static
    func getDefaultColor1() -> Color {
        return Color.init(red: 0.40, green: 0.49, blue: 0.92)
    }

    static
    func getDefaultColor2() -> Color {
        return Color.init(red: 0.84, green: 0.43, blue: 0.46)
    }
}
