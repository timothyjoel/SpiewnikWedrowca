//
//  LottieView.swift
//  SpiewnikWedrowca
//
//  Created by Timothy Stokarski on 08/05/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import SwiftUI
import Lottie

enum AnimationNames: String {
    case heartAnimation
}

struct LottieView: UIViewRepresentable {
    
    var filename: AnimationNames
    let animationView = AnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()
        let animation = Animation.named(filename.rawValue)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
    }
    
}

struct LottieButton: UIViewRepresentable {
    
    @Binding var isPressed: Bool
    @Binding var shouldAnimate: Bool
    var from: AnimationProgressTime = 0.0
    var to: AnimationProgressTime = 1.0
    var filename: AnimationNames
    let animationView = AnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LottieButton>) -> UIView {
        let view = UIView()
        let animation = Animation.named(filename.rawValue)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieButton>) {
        if shouldAnimate {
            animationView.play(fromProgress: isPressed ? from : to, toProgress: isPressed ? to : from)
        } else {
            animationView.currentProgress = isPressed ? to : from
        }
    }
}
