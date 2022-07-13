//
//  UIKitActivityView.swift
//  UIKitActivityViewInSwiftUI
//
//  Created by YinXt on 2022/6/1.
//

import SwiftUI

struct UIKitActivityIndicatorView: UIViewRepresentable {
    
    typealias UIViewType = UIActivityIndicatorView

    var isShowing: Bool = true
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicatorView = UIActivityIndicatorView(style: .large)
        indicatorView.color = .red
        indicatorView.hidesWhenStopped = true
        return indicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isShowing ? uiView.startAnimating() : uiView.stopAnimating()
    }
    
}

struct UIKitActivityView_Previews: PreviewProvider {
    static var previews: some View {
        UIKitActivityIndicatorView()
    }
}
