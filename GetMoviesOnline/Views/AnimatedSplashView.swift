//
//  AnimatedSplashView.swift
//  GetMoviesOnline
//
//  Created by IACD-Air-3 on 2021/04/19.
//

import SwiftUI

struct AnimatedSplashView: View {
    //Create a State variable called Animate
    @State var animate = false
    @State var endAnimation = false
    var body: some View {
        ZStack{
            HomeView()
            ZStack{
                Color("background")
                Image("lg")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 230, height: animate ? nil : 234, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                
                //Scaling view
                    .scaleEffect(animate ? 4 : 1)
                //Setting the width to avoid over size
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animatedSplash)
            .opacity(endAnimation ? 0 : 1)
        }
    }
    //Creating the Animation Function
    func animatedSplash(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
            withAnimation(Animation.easeOut(duration: 0.45)){
                animate.toggle()
            }
            withAnimation(Animation.easeOut(duration: 0.45)){
                endAnimation.toggle()
            }
        }
    }
}

struct AnimatedSplashView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedSplashView()
    }
}
