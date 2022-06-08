//
//  WeatherRepository.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import Foundation
import CoreLocation
import RxSwift

class WeatherRepository: WeatherRepositoryProtocol {

  private let remoteDataSource: WeatherRemoteDataSource

  init(remoteDataSource: WeatherRemoteDataSource) {
    self.remoteDataSource = remoteDataSource
  }

  func fetchCurrentWeather(location: CLLocationCoordinate2D) -> Observable<Weather> {
    return remoteDataSource.fetchCurrentWeather(location: location)
  }
}
