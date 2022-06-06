//
//  WeatherUseCase.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import Foundation
import CoreLocation

protocol WeatherUseCase {
  func fetchCurrentWeather(location: CLLocation, completion: @escaping(Weather) -> ())
}
