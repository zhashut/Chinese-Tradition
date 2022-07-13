//
//  UIKitActivityControllerView.swift
//  CFestival
//
//  Created by zhashut on 2022/6/19.
//

import SwiftUI

struct UIKitActivityControllerView: UIViewControllerRepresentable {

    var activityItems: [Any] = []

    typealias UIViewControllerType = UIActivityViewController

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return activityController

    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {

    }

}

struct UIKitActivityControllerView_Previews: PreviewProvider {
    static var previews: some View {
        UIKitActivityControllerView()
    }
}
