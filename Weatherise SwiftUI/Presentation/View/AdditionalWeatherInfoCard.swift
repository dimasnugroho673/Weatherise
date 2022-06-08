//
//  AdditionalWeatherInfoCard.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 08/06/22.
//

import SwiftUI

struct AdditionalWeatherInfoCard: View {

  let iconHeader, title, value, unit: String

  var body: some View {
    VStack(alignment: .leading) {
      Label(title.uppercased(), systemImage: iconHeader)
        .foregroundColor(Color.white.opacity(0.8))
        .font(Font.system(size: 14, weight: .bold))
        .padding(.bottom, 5)

      Text(value)
        .foregroundColor(Color.white)
        .font(Font.system(size: 42, weight: .bold))
        .padding(.top, 5)
        .padding(.bottom, 1)

      Text(unit)
        .foregroundColor(Color.white)
        .font(Font.system(size: 18, weight: .bold))
    }
    .frame(width: 100, height: 100, alignment: .leading)
    .padding()
    .background(BlurView(style: .light))
    .cornerRadius(14)
  }
}

struct AdditionalWeatherInfoCard_Previews: PreviewProvider {
  static var previews: some View {
    AdditionalWeatherInfoCard(iconHeader: "humidity", title: "Humidity", value: "66", unit: "%")
  }
}

struct BlurView: UIViewRepresentable {
  var style: UIBlurEffect.Style = .systemMaterial

  func makeUIView(context: Context) -> UIVisualEffectView {
    return UIVisualEffectView(effect: UIBlurEffect(style: style))
  }

  func updateUIView(_ uiView: UIViewType, context: Context) {
    uiView.effect = UIBlurEffect(style: style)
  }
}
