//
//  UIFont.swift
//  OnboardingKit
//
//  Created by Jarrod Norwell on 21/9/2025.
//

import UIKit

public extension UIFont {
    public static func bold(_ textStyle: UIFont.TextStyle) -> UIFont {
        .boldSystemFont(ofSize: UIFont.preferredFont(forTextStyle: textStyle).pointSize)
    }
}
