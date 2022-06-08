//
//  WeatherInteractor.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import Foundation
import CoreLocation
import RxSwift

class WeatherInteractor: WeatherUseCase {

  private let repository: WeatherRepository

  init(repository: WeatherRepository) {
    self.repository = repository
  }

  func fetchCurrentWeather(location: CLLocationCoordinate2D) -> Observable<Weather> {
    return repository.fetchCurrentWeather(location: location)
  }
}
