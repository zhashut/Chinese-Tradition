//
//  Styles.swift
//  CFestival
//
//  Created by zhashut on 2022/6/23.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
  var cornerRadius: CGFloat
  @Environment(\.colorScheme) var colorScheme
  func body(content: Content) -> some View {
    content .overlay(
      RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
        .stroke(
          .linearGradient(
            colors: [
              .white.opacity(colorScheme == .dark ? 0.6 : 0.3),
                .black.opacity(colorScheme == .dark ? 0.3 : 0.1)
            ],startPoint: .top, endPoint: .bottom
          )
        )
        .blendMode(.overlay)
    )
  }
}

struct StrokeStyleline: ViewModifier {
  var firstColor: Color
  var seconedColor: Color
  func body(content: Content) -> some View {
    content.foregroundStyle(
      .linearGradient(
        colors: [
          firstColor, seconedColor
        ], startPoint: .topLeading, endPoint: .bottomTrailing
      )
    )
  }
}

extension View {
  func strockeStyle(cornerRadius: CGFloat = 30) -> some View {
    modifier(StrokeStyle(cornerRadius: cornerRadius))
  }

  func strockeStyleline(firstColor: Color = .red, seconedColor: Color = .blue) -> some View {
    modifier(StrokeStyleline(firstColor: firstColor, seconedColor: seconedColor))
  }
}

