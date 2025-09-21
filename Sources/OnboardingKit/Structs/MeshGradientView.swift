//
//  MeshGradientView.swift
//  OnboardingKit
//
//  Created by Jarrod Norwell on 21/9/2025.
//

import SwiftUI

struct MeshGradientView: View {
    var colours: [Color]
    
    private let points: [SIMD2<Float>] = [
        .init(0.0, 0.0), .init(0.5, 0.0), .init(1.0, 0.0),
        .init(0.0, 0.5), .init(0.5, 0.5), .init(1.0, 0.5),
        .init(0.0, 1.0), .init(0.5, 1.0), .init(1.0, 1.0)
    ]
    
    init(colours: [Color] = Color.vibrantGreens) {
        self.colours = colours
    }
    
    var body: some View {
        TimelineView(.animation) { timeline in
            MeshGradient(width: 3, height: 3, locations: .points(points), colors: .colors(animated(for: timeline.date)), background: .black, smoothsColors: true)
        }
        .ignoresSafeArea()
    }
    
    private func animated(for date: Date) -> [Color] {
        let phase = CGFloat(date.timeIntervalSince1970)
        return colours.enumerated().map { index, colour in
            let amount = cos(phase + Double(index) * 0.3) * 0.1
            return shift(colour: colour, by: amount)
        }
    }
    
    private func shift(colour: Color, by amount: Double) -> Color {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        colour.uiColour.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        hue += .init(amount)
        hue = hue.truncatingRemainder(dividingBy: 1.0)
        if hue < 0 {
            hue += 1
        }
        
        return .init(hue: .init(hue), saturation: .init(saturation), brightness: .init(brightness), opacity: .init(alpha))
    }
}
