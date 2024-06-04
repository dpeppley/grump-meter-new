//
//  DrawViewNew.swift
//  Grump_Meter_New
//
//  Created by Drew Peppley on 3/11/24.
//

import SwiftUI

enum Colors {
    case blue
    case green
    case yellow
    case orange
    case red
}

struct DrawViewNew: View {
    
    @State private var blueLines = [Line]()
    @State private var grenLines = [Line]()
    @State private var yellowLines = [Line]()
    @State private var orangeLines = [Line]()
    @State private var redLines = [Line]()
    
    var blueCanvas: some View {
        DrawViewCanvas()
    }
    var greenCanvas: some View {
        DrawViewCanvas()
    }
    var yellowCanvas: some View {
        DrawViewCanvas()
    }
    var orangeCanvas: some View {
        DrawViewCanvas()
    }
    var redCanvas: some View {
        DrawViewCanvas()
    }
    
    let canvasList: [Colors] = [.blue, .green, .yellow, .orange, .red]
    
    @State var colorIndex = 0
    let blueCanvasIndex = 0
    let greenCanvasIndex = 1
    let yellowCanvasIndex = 2
    let orangeCanvasIndex = 3
    let redCanvasIndex = 4
    
    @State var currentBackground: String = "BlueBG"

    var body: some View {
        VStack {
            switch colorIndex {
            case blueCanvasIndex:
                blueCanvas
                    .onAppear(perform: {
                        currentBackground = "BlueBG"
                        print(blueCanvas.canvas.lines)
                    })
            case greenCanvasIndex:
                greenCanvas
                    .onAppear(perform: {
                        currentBackground = "GreenBG"
                    })
            case yellowCanvasIndex:
                yellowCanvas
                    .onAppear(perform: {
                        currentBackground = "YellowBG"
                    })
            case orangeCanvasIndex:
                orangeCanvas
                    .onAppear(perform: {
                        currentBackground = "OrangeBG"
                    })
            case redCanvasIndex:
                redCanvas
                    .onAppear(perform: {
                        currentBackground = "RedBG"
                    })
            default:
                Text("Color index invalid")
            }
            HStack {
                if (colorIndex > 0) {
                    Button {
                        colorIndex -= 1
                        print(colorIndex)
                    } label: {
                        Image("Previous")
                            .padding()
                    }
                } else {
                    NavigationLink(destination: IntroSlidesView(selection: 5)) {
                        Image("Previous")
                            .padding()
                    }
                }
                if (colorIndex < 4) {
                    Button {
                        colorIndex += 1
                    } label: {
                        Image("Next")
                            .padding()
                    }
                } else {
                    Image("Next")
                        .padding()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        /*.onAppear {
            ChangeColor(color: Colors.Blue)
        }*/
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image(currentBackground)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

#Preview {
    DrawViewNew()
}
