//
//  HomeViewModel.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 31/05/22.
//

import CoreLocation
import RxSwift

class HomeViewModel: ObservableObject {

  private var useCase: WeatherInteractor
  private var locationService: LocationService

  let disposeBag = DisposeBag()

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
    useCase
      .fetchCurrentWeather(location: location)
      .observe(on: MainScheduler.instance)
      .subscribe(onNext: { result in
        self.isLoading = false
        self.currentWeather = result.current
        self.location = result.location
      }, onError: { error in
        print("DEBUG: Rx failed fetch data with error: \(error)")
      })
      .disposed(by: disposeBag)
  }
}
