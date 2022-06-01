//
//  HomeViewModel.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import Foundation
import CoreLocation
import Swinject

class HomeViewModel: ObservableObject {

  private var useCase: WeatherUseCase

  init(useCase: WeatherUseCase) {
    self.useCase = useCase
  }

  func fetchWeather(location: CLLocation) {
    useCase.fetchWeather(location: location) { weather in
      print("DEBUG: viewModel: result: \(weather)")
    }
  }
}

//class Injection: NSObject {
//  func provideHome() {
//
//  }
//}
