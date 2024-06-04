//
//  Line.swift
//  Grump_Meter_New
//
//  Created by Drew Peppley on 3/11/24.
//

import Foundation
import SwiftUI

struct Line {
    var points: [CGPoint]
    var color: Color
    var lineWidth: CGFloat
    var isDrawing: Bool = true
}
