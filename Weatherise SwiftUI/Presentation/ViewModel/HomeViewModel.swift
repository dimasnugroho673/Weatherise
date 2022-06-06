//
//  HomeViewModel.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import CoreLocation

class HomeViewModel: ObservableObject {

  private var useCase: WeatherInteractor

  @Published var isLoading: Bool = true
  @Published var currentWeather: Current?
  @Published var location: Location?

  init(useCase: WeatherInteractor) {
    self.useCase = useCase
  }

  var currentTempC: Int {
    return Int(currentWeather?.tempC ?? 0)
  }

  func fetchWeather(location: CLLocation) {
    useCase.fetchCurrentWeather(location: location) { weather in
      print("DEBUG: viewModel: result: \(weather)")
      self.isLoading = false
      self.currentWeather = weather.current
      self.location = weather.location
    }
  }
}
