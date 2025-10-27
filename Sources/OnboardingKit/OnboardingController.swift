//
//  OnboardingController.swift
//  OnboardingKit
//
//  Created by Jarrod Norwell on 21/9/2025.
//

import SwiftUI
import UIKit

open class OnboardingController : UIViewController {
    public struct Onboarding {
        public struct Button {
            public typealias Handler = ((UIButton, UIViewController) async -> Void)
            
            public struct Configuration {
                public var configuration: UIButton.Configuration? = nil
                
                public var image: UIImage? = nil
                public var text: String? = nil
                
                public var handler: Handler? = nil
                
                public init(configuration: UIButton.Configuration? = nil, image: UIImage? = nil, text: String? = nil, handler: Handler? = nil) {
                    self.configuration = configuration
                    self.image = image
                    self.text = text
                    self.handler = handler
                }
            }
        }
        
        public struct Configuration {
            public var buttons: [Button.Configuration]
            
            public var colours: [Color] = Color.vibrantGreens
            
            public var image: UIImage? = nil
            public var useCustomSymbolEffect: Bool = false
            
            public var text: String
            public var secondaryAttributedText: AttributedString? = nil
            public var secondaryText: String? = nil, tertiaryText: String? = nil
            
            public init(buttons: [Button.Configuration], colours: [Color], image: UIImage? = nil, useCustomSymbolEffect: Bool = false,
                 text: String, secondaryAttributedText: AttributedString? = nil, secondaryText: String? = nil, tertiaryText: String? = nil) {
                self.buttons = buttons
                self.colours = colours
                self.image = image
                self.useCustomSymbolEffect = useCustomSymbolEffect
                self.text = text
                self.secondaryAttributedText = secondaryAttributedText
                self.secondaryText = secondaryText
                self.tertiaryText = tertiaryText
            }
        }
    }
    
    public var imageView: UIImageView? = nil
    
    public var configuration: Onboarding.Configuration
    public init(configuration: Onboarding.Configuration) {
        self.configuration = configuration
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = traitCollection.userInterfaceStyle
        
        let meshGradientView: UIHostingController = .init(rootView: MeshGradientView(colours: configuration.colours))
        meshGradientView.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(meshGradientView)
        view.addSubview(meshGradientView.view)
        meshGradientView.didMove(toParent: self)
        
        meshGradientView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        meshGradientView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        meshGradientView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        meshGradientView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        let visualEffectView: UIVisualEffectView = .init(effect: UIGlassEffect(style: .regular))
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(visualEffectView)
        
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor, constant: -20).isActive = true
        visualEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20).isActive = true
        visualEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20).isActive = true
        
        let tintingVisualEffectView: UIVisualEffectView = .init(effect: UIVibrancyEffect(blurEffect: UIBlurEffect(style: .systemMaterial)))
        tintingVisualEffectView.translatesAutoresizingMaskIntoConstraints = false
        visualEffectView.contentView.addSubview(tintingVisualEffectView)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            tintingVisualEffectView.topAnchor.constraint(equalTo: visualEffectView.contentView.topAnchor, constant: 20).isActive = true
            tintingVisualEffectView.bottomAnchor.constraint(equalTo: visualEffectView.contentView.bottomAnchor, constant: -20).isActive = true
            tintingVisualEffectView.widthAnchor.constraint(equalTo: visualEffectView.contentView.widthAnchor, multiplier: 1 / 2).isActive = true
            tintingVisualEffectView.centerXAnchor.constraint(equalTo: visualEffectView.contentView.centerXAnchor).isActive = true
        } else {
            tintingVisualEffectView.topAnchor.constraint(equalTo: visualEffectView.contentView.topAnchor, constant: 20).isActive = true
            tintingVisualEffectView.leadingAnchor.constraint(equalTo: visualEffectView.contentView.leadingAnchor, constant: 20).isActive = true
            tintingVisualEffectView.bottomAnchor.constraint(equalTo: visualEffectView.contentView.bottomAnchor, constant: -20).isActive = true
            tintingVisualEffectView.trailingAnchor.constraint(equalTo: visualEffectView.contentView.trailingAnchor, constant: -20).isActive = true
        }
        
        let label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .bold(.extraLargeTitle)
        label.numberOfLines = 2
        label.text = configuration.text
        label.textAlignment = .center
        tintingVisualEffectView.contentView.addSubview(label)
        
        label.centerYAnchor.constraint(equalTo: tintingVisualEffectView.safeAreaLayoutGuide.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: tintingVisualEffectView.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: tintingVisualEffectView.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        let topCenteringView: UIView = .init()
        topCenteringView.translatesAutoresizingMaskIntoConstraints = false
        tintingVisualEffectView.contentView.addSubview(topCenteringView)
        
        topCenteringView.topAnchor.constraint(equalTo: tintingVisualEffectView.contentView.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        topCenteringView.leadingAnchor.constraint(equalTo: tintingVisualEffectView.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        topCenteringView.bottomAnchor.constraint(equalTo: label.safeAreaLayoutGuide.topAnchor, constant: -20).isActive = true
        topCenteringView.trailingAnchor.constraint(equalTo: tintingVisualEffectView.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        imageView = .init(image: configuration.image)
        guard let imageView else {
            return
        }
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        topCenteringView.addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: topCenteringView.safeAreaLayoutGuide.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topCenteringView.safeAreaLayoutGuide.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: topCenteringView.safeAreaLayoutGuide.widthAnchor,
                                         multiplier: 2 / 3).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        let secondaryLabel: UILabel = .init()
        secondaryLabel.translatesAutoresizingMaskIntoConstraints = false
        secondaryLabel.font = .preferredFont(forTextStyle: .body)
        secondaryLabel.numberOfLines = 3
        if let secondaryAttributedText = configuration.secondaryAttributedText {
            secondaryLabel.attributedText = .init(secondaryAttributedText)
        } else {
            secondaryLabel.text = configuration.secondaryText
        }
        secondaryLabel.textAlignment = .center
        tintingVisualEffectView.contentView.addSubview(secondaryLabel)
        
        secondaryLabel.topAnchor.constraint(equalTo: label.safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
        secondaryLabel.leadingAnchor.constraint(equalTo: tintingVisualEffectView.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        secondaryLabel.trailingAnchor.constraint(equalTo: tintingVisualEffectView.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        let tertiaryLabel: UILabel = .init()
        tertiaryLabel.translatesAutoresizingMaskIntoConstraints = false
        tertiaryLabel.font = .preferredFont(forTextStyle: .footnote)
        tertiaryLabel.numberOfLines = 3
        tertiaryLabel.text = configuration.tertiaryText
        tertiaryLabel.textAlignment = .center
        tintingVisualEffectView.contentView.addSubview(tertiaryLabel)
        
        tertiaryLabel.leadingAnchor.constraint(equalTo: tintingVisualEffectView.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        tertiaryLabel.bottomAnchor.constraint(equalTo: tintingVisualEffectView.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        tertiaryLabel.trailingAnchor.constraint(equalTo: tintingVisualEffectView.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        let centeringView: UIView = .init()
        centeringView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centeringView)
        
        centeringView.topAnchor.constraint(equalTo: secondaryLabel.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
        centeringView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        centeringView.bottomAnchor.constraint(equalTo: tertiaryLabel.safeAreaLayoutGuide.topAnchor, constant: -20).isActive = true
        centeringView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        let mapped: [UIButton] = configuration.buttons.map { configuration in
            if let custom = configuration.configuration {
                let button: UIButton = .init(configuration: custom)
                return button
            } else {
                var conf: UIButton.Configuration = .glass()
                conf.buttonSize = .large
                conf.cornerStyle = .capsule
                if let image = configuration.image {
                    conf.image = image
                } else if let text = configuration.text {
                    conf.title = text
                }
                
                let button: UIButton = .init(configuration: conf, primaryAction: .init(handler: { action in
                    guard let button = action.sender as? UIButton, let handler = configuration.handler else {
                        return
                    }
                    
                    UIImpactFeedbackGenerator(view: button).impactOccurred()
                    
                    Task {
                        await handler(button, self)
                    }
                }))
                button.overrideUserInterfaceStyle = if self.traitCollection.userInterfaceStyle == .light {
                    .light
                } else {
                    .dark
                }
                return button
            }
        }
        
        let stackView: UIStackView = .init(arrangedSubviews: mapped)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        centeringView.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: centeringView.safeAreaLayoutGuide.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centeringView.safeAreaLayoutGuide.centerXAnchor).isActive = true
        stackView.leadingAnchor.constraint(greaterThanOrEqualTo: centeringView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(lessThanOrEqualTo: centeringView.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    public var animationHasPlayed: Bool = false
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if !animationHasPlayed && !configuration.useCustomSymbolEffect {
            guard let imageView else {
                return
            }
            
            imageView.addSymbolEffect(.bounce)
            
            animationHasPlayed.toggle()
        }
    }
    
    public override var prefersStatusBarHidden: Bool { true }
    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask { .portrait }
}
