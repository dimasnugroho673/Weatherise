//
//  LocationViewModel.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 08/06/22.
//

import RxSwift
import RxCocoa
import Foundation

class LocationViewModel: ObservableObject {

  private var useCase: LocationInteractor

  @Published var locationResults: [LocationResult] = [LocationResult]()
  @Published var keyword: String = ""

  let disposeBag = DisposeBag()

  init(useCase: LocationInteractor) {
    self.useCase = useCase
  }

  func getLocation(keyword: String) {
    useCase
      .searchLocation(keyword: keyword)
      .observe(on: MainScheduler.instance)
      .subscribe(onNext: { results in
        self.locationResults = results
        print(results)
      }, onError: { error in
        print("DEBUG: Rx failed fetch data with error: \(error)")
      })
      .disposed(by: disposeBag)
  }
}
