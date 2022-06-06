//
//  WeatherRepository.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import Foundation
import CoreLocation

class WeatherRepository: WeatherRepositoryProtocol {

  private let remoteDataSource: WeatherRemoteDataSource

  init(remoteDataSource: WeatherRemoteDataSource) {
    self.remoteDataSource = remoteDataSource
  }

  func fetchCurrentWeather(location: CLLocation, completion: @escaping (Weather) -> ()) {
    remoteDataSource.fetchCurrentWeather(location: location) { weather in
      completion(weather)
    }
  }
}
