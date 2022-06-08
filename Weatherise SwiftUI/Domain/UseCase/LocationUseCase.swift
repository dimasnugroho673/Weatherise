//
//  LocationUseCase.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 08/06/22.
//

import RxSwift

protocol LocationUseCase {
  func searchLocation(keyword: String) -> Observable<[LocationResult]>
}
