//
//  HomeViewModel.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import CoreLocation

class HomeViewModel: ObservableObject {

  private var useCase: WeatherInteractor
  private var locationService: LocationService

  @Published var isLoading: Bool = true
  @Published var currentWeather: Current?
  @Published var location: Location?

  init(useCase: WeatherInteractor, locationService: LocationService) {
    self.useCase = useCase
    self.locationService = locationService
  }

  var currentTempC: Int {
    return Int(currentWeather?.tempC ?? 0)
  }

  func fetchWeather(location: CLLocationCoordinate2D) {
    useCase.fetchCurrentWeather(location: location) { weather in
      print("DEBUG: viewModel: result: \(weather)")
      self.isLoading = false
      self.currentWeather = weather.current
      self.location = weather.location
    }
  }
}
