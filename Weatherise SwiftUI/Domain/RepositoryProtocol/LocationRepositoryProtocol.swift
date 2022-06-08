//
//  LocationRepositoryProtocol.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 08/06/22.
//

import RxSwift

protocol LocationRepositoryProtocol {
  func searchLocation(keyword: String) -> Observable<[LocationResult]>
}
