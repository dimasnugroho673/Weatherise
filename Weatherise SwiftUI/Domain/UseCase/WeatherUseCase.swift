//
//  WeatherUseCase.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import Foundation
import CoreLocation
import RxSwift

protocol WeatherUseCase {
  func fetchCurrentWeather(location: CLLocationCoordinate2D) -> Observable<Weather>
}
