//
//  DrawViewCanvas.swift
//  Grump_Meter_New
//
//  Created by Drew Peppley on 3/11/24.
//

import SwiftUI

struct DrawViewCanvas: View {
    @State public var lines = [Line]()
    
    @State private var currentWidth: CGFloat = 10
    @State private var drawing = true
    
    @State private var alertVisible = false
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Button {
                        currentWidth = 30
                    } label: {
                        Image("Brush")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    .padding()
                    Button {
                        currentWidth = 24
                    } label: {
                        Image("Brush")
                            .resizable()
                            .frame(width: 26, height: 26)
                    }
                    .padding()
                    Button {
                        currentWidth = 18
                    } label: {
                        Image("Brush")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    .padding()
                    Button {
                        currentWidth = 14
                    } label: {
                        Image("Brush")
                            .resizable()
                            .frame(width: 16, height: 16)
                    }
                    .padding()
                    Button {
                        currentWidth = 10
                    } label: {
                        Image("Brush")
                            .resizable()
                            .frame(width: 12, height: 12)
                    }
                    .padding()
                }
                Canvas { context, size in
                    for line in lines {
                        var path = Path()
                        path.addLines(line.points)
                        
                        context.blendMode = (line.isDrawing ? .normal : .clear)
                        context.stroke(path, with: .color(line.color), lineWidth: line
                            .lineWidth)
                    }
                }
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
                    let newPoint = value.location
                    if value.translation.width + value.translation.height == 0 {
                        lines.append(Line(points: [newPoint], color: .blue, lineWidth: currentWidth, isDrawing: drawing))
                    } else {
                        let index = lines.count - 1
                        lines[index].points.append(newPoint)
                    }
                }))
                .frame(width: UIScreen.main.bounds.size.width * 0.8, height: UIScreen.main.bounds.size.height * 0.5)
                .background(.white)
            }
            
            HStack {
                Button {
                    drawing = true
                } label: {
                    Image("Draw")
                        .padding()
                }
                
                Button {
                    drawing = false
                } label: {
                    Image("Erase")
                        .padding()
                }
                
                Button {
                    if lines.count > 0 {
                        lines.removeLast()
                    }
                } label: {
                    Image("Undo")
                        .padding()
                }
                
                Button {
                    alertVisible = true
                } label: {
                    Image("ClearAll")
                        .padding()
                }
                
                Button {
                    
                } label: {
                    Image("Save")
                        .padding()
                }
            }
            
        }
        .alert("Start Over?", isPresented: $alertVisible) {
                Button(role: .destructive) {
                    lines = []
                } label: {
                    Text("Start Over")
                }
            } message: {
                Text("This will erase your entire drawing. Are you sure?")
            }
    }
}

#Preview {
    DrawViewCanvas()
}
