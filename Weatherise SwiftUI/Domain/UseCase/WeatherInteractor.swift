//
//  WeatherInteractor.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import Foundation
import CoreLocation

class WeatherInteractor: WeatherUseCase {

  private let repository: WeatherRepository

  init(repository: WeatherRepository) {
    self.repository = repository
  }

  func fetchCurrentWeather(location: CLLocationCoordinate2D, completion: @escaping(Weather) -> ()) {
    repository.fetchCurrentWeather(location: location) { weather in
      completion(weather)
    }
  }
}
