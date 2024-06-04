////
////  DrawVC.swift
////  Grump_Meter_New
////
////  Created by Drew Peppley on 1/22/24.
////
//
//import SwiftUI
//
//struct DrawView: View {
//    enum Colors {
//        case Blue, Green, Yellow, Orange, Red
//    }
//    /*let drawingColors = [
//        Colors.Blue: DrawingColor(header: "Draw something that reminds you of calmness.", background: "BlueBG", drawingColor: Color(red: 34, green: 72, blue: 153), nextColor: Colors.Green),
//        Colors.Green: DrawingColor(header: "Think of being grumpy, or a little on edge. Draw that here.", background: "GreenBG", drawingColor: Color(red: 86, green: 170, blue: 59), previousColor: Colors.Blue, nextColor: Colors.Yellow),
//        Colors.Yellow: DrawingColor(header: "Draw a road sign to remind you to slow down.", background: "YellowBG", drawingColor: Color(red: 222, green: 210, blue: 0), previousColor: Colors.Green, nextColor: Colors.Orange),
//        Colors.Orange: DrawingColor(header: "Draw a picture that reminds you to stop. (Red is next!)", background: "OrangeBG", drawingColor: Color(red: 228, green: 94, blue: 0), previousColor: Colors.Yellow, nextColor: Colors.Red),
//        Colors.Red: DrawingColor(header: "How do you imagine an explosion of feeling? Draw it here.", background: "RedBG", drawingColor: Color(red: 205, green: 23, blue: 25), previousColor: Colors.Orange)
//    ]*/
//    
////    @State private var currentCanvas: [Line] = []
//    @State private var blueLines: [Line] = []
////    @State private var greenLines: [Line] = []
////    @State private var yellowLines: [Line] = []
////    @State private var orangeLines: [Line] = []
////    @State private var redLines: [Line] = []
//    
//    var drawingColors = [
//        Colors.Blue: DrawingColor(header: "Draw something that reminds you of calmness.", background: "BlueBG", drawingColor: .blue, nextColor: Colors.Green, lines: []),
//        Colors.Green: DrawingColor(header: "Think of being grumpy, or a little on edge. Draw that here.", background: "GreenBG", drawingColor: .green, previousColor: Colors.Blue, nextColor: Colors.Yellow, lines: []),
//        Colors.Yellow: DrawingColor(header: "Draw a road sign to remind you to slow down.", background: "YellowBG", drawingColor: .yellow, previousColor: Colors.Green, nextColor: Colors.Orange, lines: []),
//        Colors.Orange: DrawingColor(header: "Draw a picture that reminds you to stop. (Red is next!)", background: "OrangeBG", drawingColor: .orange, previousColor: Colors.Yellow, nextColor: Colors.Red, lines: []),
//        Colors.Red: DrawingColor(header: "How do you imagine an explosion of feeling? Draw it here.", background: "RedBG", drawingColor: .red, previousColor: Colors.Orange, lines: [])
//    ]
//    
//    @State private var currentColor: DrawingColor
//    @State private var currentHeader: String
//    @State private var currentBackground: String
//    
//    @State private var currentLine = Line()
//    @State private var lines: [Line] = []
//    @State private var currentWidth = 10.0
//    @State private var drawing = true
//    
//    @State private var alertVisible = false
//    
//    //@AppStorage("GM_BLUE") var blueSaved: Image
//    
//    public init (currentHeader: String, currentBackground: String) {
//        self.currentColor = drawingColors[Colors.Blue]!
//        self.currentHeader = currentHeader
//        self.currentBackground = currentBackground
//    }
//    
//    var drawingCanvas: some View {
//        Canvas { context, size in
//            for line in currentColor.lines {
//                var path = Path()
//                path.addLines(line.points)
//                context.blendMode = (line.isDrawing ? .normal : .clear)
//                context.stroke(path, with: .color(currentColor.drawingColor), lineWidth: line.lineWidth)
//            }
//        }.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
//            .onChanged({value in
//                let newPoint  = value.location
//                currentLine.points.append(newPoint)
//                currentColor.lines.append(currentLine)
//            })
//                .onEnded({value in
//                    self.currentLine = Line(points: [], color: .clear)
//                })
//        )
//        .frame(width: UIScreen.main.bounds.size.width * 0.8, height: UIScreen.main.bounds.size.height * 0.5)
//        .background(.white)
//    }
//    
//    var blueCanvas: some View {
//        drawingCanvas
//    }
//    
//    var body: some View {
//        VStack {
//            Text(currentHeader)
//                .font(Font.custom("KGTenThousandReasons", size: 18))
//                .padding()
//            HStack {
//                VStack {
//                    Button {
//                        currentWidth = 30
//                    } label: {
//                        Image("Brush")
//                            .resizable()
//                            .frame(width: 32, height: 32)
//                    }
//                    .padding()
//                    Button {
//                        currentWidth = 24
//                    } label: {
//                        Image("Brush")
//                            .resizable()
//                            .frame(width: 26, height: 26)
//                    }
//                    .padding()
//                    Button {
//                        currentWidth = 18
//                    } label: {
//                        Image("Brush")
//                            .resizable()
//                            .frame(width: 20, height: 20)
//                    }
//                    .padding()
//                    Button {
//                        currentWidth = 14
//                    } label: {
//                        Image("Brush")
//                            .resizable()
//                            .frame(width: 16, height: 16)
//                    }
//                    .padding()
//                    Button {
//                        currentWidth = 10
//                    } label: {
//                        Image("Brush")
//                            .resizable()
//                            .frame(width: 12, height: 12)
//                    }
//                    .padding()
//                }
//                .onChange(of: currentWidth) { newWidth in
//                    currentLine.lineWidth = newWidth
//                    currentLine.isDrawing = drawing
//                }
//                if currentColor.drawingColor == .blue {
//                    blueCanvas
//                } else {
//                    drawingCanvas
//                }
//            }
//            
//            HStack {
//                Button {
//                    self.currentLine = Line(points: [], color: currentColor.drawingColor)
//                    drawing = true
//                } label: {
//                    Image("Draw")
//                        .padding()
//                }
//                
//                Button {
//                self.currentLine = Line(points: [], color: .clear)
//                    drawing = false
//                } label: {
//                    Image("Erase")
//                        .padding()
//                }
//                
//                Button {
////                    currentColor.lines = []
//                    alertVisible = true
//                } label: {
//                    Image("ClearAll")
//                        .padding()
//                }
//                
//                Button {
//                    alertVisible = true
//                } label: {
//                    Image("Save")
//                        .padding()
//                }
//            }
//            .onChange(of: drawing) { newMode in
//                currentLine.isDrawing = newMode
//            }
//            
//            HStack {
//                if (currentColor.previousColor != nil) {
//                    Button {
//                        ChangeColor(color: currentColor.previousColor!)
//                    } label: {
//                        Image("Previous")
//                            .padding()
//                    }
//                } else {
//                    NavigationLink(destination: IntroSlidesView(selection: 5)) {
//                        Image("Previous")
//                            .padding()
//                    }
//                }
//                if (currentColor.nextColor != nil) {
//                    Button {
//                        ChangeColor(color: currentColor.nextColor!)
//                    } label: {
//                        Image("Next")
//                            .padding()
//                    }
//                } else {
//                    Image("Next")
//                        .padding()
//                }
//            }
//        }
//        .navigationBarBackButtonHidden(true)
//        .navigationBarHidden(true)
//        .onAppear {
//            ChangeColor(color: Colors.Blue)
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(
//            Image(currentBackground)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .edgesIgnoringSafeArea(.all)
//        )
//        .alert("Start Over?", isPresented: $alertVisible) {
//            
//            Button(role: .destructive) {
//                currentColor.lines = []
//            } label: {
//                Text("Start Over")
//            }
//        } message: {
//            Text("This will erase your entire drawing. Are you sure?")
//        }
//    }
//    
//    func ChangeColor(color: Colors) {
////        currentCanvas =
////        switch color {
////        case Colors.Blue:
////            currentCanvas = blueLines
////            break;
////        case Colors.Green:
////            currentCanvas = greenLines
////            break;
////        case Colors.Yellow:
////            currentCanvas = yellowLines
////            break;
////        case Colors.Orange:
////            currentCanvas = orangeLines
////            break;
////        case Colors.Red:
////            currentCanvas = redLines
////            break;
////        }
//        //drawingColors[currentColor] = lines
////        print(currentColor.lines.count)
////        print("Before change: \(lines.count)")
//        currentColor = drawingColors[color]!
////        print("After change: \(lines.count)")
////        lines = []
////        print("After clear: \(lines.count)")
////        lines = currentColor.lines
////        print("After load: \(lines.count)")
//        currentHeader = currentColor.header
//        currentBackground = currentColor.background
//        currentLine.color = currentColor.drawingColor
//    }
//    
////    func NextColor() {
////        ChangeColor(color: $currentColor.DrawingColor)
////    }
////    
////    func PreviousColor() {
////        
////    }
//}
//
//struct DrawingColor {
//    var header: String
//    var background: String
//    var drawingColor: Color
//    var previousColor: DrawView.Colors?
//    var nextColor: DrawView.Colors?
//    var lines: [Line]
//}
//
//// Code from: https://www.youtube.com/watch?v=P0OdY9MVu_g
//struct Line {
//    var points: [CGPoint] = [CGPoint]()
//    var color: Color = .blue
//    var lineWidth: Double = 10.0
//    var isDrawing: Bool = true
//}
//
//struct DrawVC_Previews: PreviewProvider {
//    static var previews: some View {
//        DrawView(currentHeader: "", currentBackground: "")
//    }
//}
