import SwiftUI

struct SplashScreen: View {
    @Binding var isShowingSplash: Bool
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                Image("onePieceText")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .padding(.top, 50)
                    .opacity(isAnimating ? 1 : 0)
                
                Spacer()
                
                GIFImageView(gifName: "coverPage1")
                    .frame(height: 300)
                    .opacity(isAnimating ? 1 : 0)
                
                Spacer()
            }
        }
        .onAppear {
            withAnimation(.easeIn(duration: 2)) {
                isAnimating = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    isShowingSplash = false
                }
            }
        }
    }
}
