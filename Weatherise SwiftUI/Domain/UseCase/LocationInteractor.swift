//
//  LocationInteractor.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 08/06/22.
//

import RxSwift

class LocationInteractor: LocationUseCase {

  private var repository: LocationRepository

  init(repository: LocationRepository) {
    self.repository = repository
  }

  func searchLocation(keyword: String) -> Observable<[LocationResult]> {
    return repository.searchLocation(keyword: keyword)
  }

  
}
