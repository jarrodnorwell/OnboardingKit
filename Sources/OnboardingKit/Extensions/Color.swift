//
//  Color+Extension.swift
//  OnboardingKit
//
//  Created by Jarrod Norwell on 21/9/2025.
//

import SwiftUI
import UIKit

public extension Color {
    public var uiColour: UIColor { .init(self) }
    
    public static let vibrantBlues: [Self] = [
        .init(red: 0.70, green: 0.85, blue: 1.00), // sky blue
        .init(red: 0.55, green: 0.75, blue: 1.00),
        .init(red: 0.40, green: 0.65, blue: 1.00),
        .init(red: 0.30, green: 0.55, blue: 0.95),
        .init(red: 0.20, green: 0.45, blue: 0.90), // vibrant mid blue
        .init(red: 0.15, green: 0.40, blue: 0.80),
        .init(red: 0.10, green: 0.35, blue: 0.70),
        .init(red: 0.05, green: 0.30, blue: 0.60),
        .init(red: 0.00, green: 0.25, blue: 0.50)  // deep navy/teal
    ]
    
    public static let vibrantGreens: [Self] = [
        .init(red: 0.70, green: 1.00, blue: 0.70), // bright mint
        .init(red: 0.55, green: 0.95, blue: 0.55),
        .init(red: 0.40, green: 0.90, blue: 0.50),
        .init(red: 0.30, green: 0.85, blue: 0.45),
        .init(red: 0.20, green: 0.80, blue: 0.40), // strong mid green
        .init(red: 0.10, green: 0.75, blue: 0.35),
        .init(red: 0.05, green: 0.65, blue: 0.35),
        .init(red: 0.00, green: 0.55, blue: 0.35),
        .init(red: 0.00, green: 0.45, blue: 0.30)  // deep emerald
    ]
    
    public static let vibrantOranges: [Self] = [
        .init(red: 1.00, green: 0.85, blue: 0.70), // light peach
        .init(red: 1.00, green: 0.75, blue: 0.55),
        .init(red: 1.00, green: 0.65, blue: 0.40),
        .init(red: 1.00, green: 0.55, blue: 0.25),
        .init(red: 1.00, green: 0.45, blue: 0.10), // vibrant orange
        .init(red: 0.90, green: 0.40, blue: 0.05),
        .init(red: 0.80, green: 0.35, blue: 0.05),
        .init(red: 0.70, green: 0.30, blue: 0.05),
        .init(red: 0.60, green: 0.25, blue: 0.05)  // deep burnt orange
    ]
    
    public static let vibrantRainbow: [Self] = [
        .init(red: 1.00, green: 0.30, blue: 0.30), // red
        .init(red: 1.00, green: 0.55, blue: 0.20), // orange
        .init(red: 1.00, green: 0.90, blue: 0.25), // yellow
        .init(red: 0.30, green: 0.85, blue: 0.30), // green
        .init(red: 0.00, green: 0.65, blue: 0.85), // cyan / turquoise
        .init(red: 0.20, green: 0.45, blue: 0.90), // blue
        .init(red: 0.45, green: 0.35, blue: 0.85), // indigo
        .init(red: 0.70, green: 0.40, blue: 0.85), // violet
        .init(red: 0.90, green: 0.35, blue: 0.70)  // magenta
    ]
    
    public static let vibrantReds: [Self] = [
        .init(red: 1.00, green: 0.75, blue: 0.75), // light pink
        .init(red: 1.00, green: 0.60, blue: 0.60),
        .init(red: 1.00, green: 0.50, blue: 0.50),
        .init(red: 0.95, green: 0.40, blue: 0.40),
        .init(red: 0.90, green: 0.30, blue: 0.30), // vibrant mid red
        .init(red: 0.80, green: 0.20, blue: 0.20),
        .init(red: 0.70, green: 0.15, blue: 0.15),
        .init(red: 0.60, green: 0.10, blue: 0.10),
        .init(red: 0.50, green: 0.05, blue: 0.05)  // deep crimson
    ]
}
