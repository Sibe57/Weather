//
//  Blur.swift
//  Weather
//
//  Created by Федор Еронин on 23.07.2022.
//

import SwiftUI

class BackdropView: UIView {
    override class var layerClass: AnyClass {
        NSClassFromString("CABackdropLayer") ?? CALayer.self
    }
}

struct Backdrop: UIViewRepresentable {
    func makeUIView(context: Context) -> BackdropView {
        BackdropView()
    }
    
    func updateUIView(_ uiView: BackdropView, context: Context) {
    }
}

struct Blur: View {
    var radius: CGFloat = 3
    var opaque = false
    
    var body: some View {
        Backdrop()
            .blur(radius: radius, opaque: opaque)
    }
}

struct Blur_Previews: PreviewProvider {
    static var previews: some View {
        Blur()
    }
}
