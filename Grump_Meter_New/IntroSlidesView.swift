//
//  IntroSlides.swift
//  Grump_Meter_New
//
//  Created by Drew Peppley on 1/22/24.
//

import SwiftUI

struct IntroSlidesView: View {
    @State private var selection: Int
    
    public init(selection: Int) {
        self.selection = selection
    }
    
    var body: some View {
        NavigationView {
            TabView (selection: $selection){
                Image("Intro1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .tag(1)
                Image("Intro2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .tag(2)
                Image("Intro3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .tag(3)
                Image("Intro4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .tag(4)
                ZStack {
                    Image("Intro5")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    NavigationLink(destination: DrawViewNew()) {
                        Image("Next")
                            .padding()
                            .position(x: UIScreen.main.bounds.size.width * 0.95, y: UIScreen.main.bounds.size.height * 0.9)
                    }
                }
                .tag(5)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .navigationTitle("IntroSlides")
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct IntroSlides_Previews: PreviewProvider {
    static var previews: some View {
        IntroSlidesView(selection: 1)
    }
}
