//
//  Constant.swift
//  Weatherise SwiftUI
//
//  Created by Dimas Putro on 06/06/22.
//

import Foundation
import SwiftUI

var API_KEY: String {
  guard let filePath = Bundle.main.path(forResource: "Weather-API-Info", ofType: "plist") else {
    fatalError("Couldn't find file 'Weather-API-Info.plist'")
  }

  let plist = NSDictionary(contentsOfFile: filePath)

  guard let value = plist?.object(forKey: "API_KEY") as? String else {
    fatalError("Couldn't find key 'API_KEY' in 'Weather-API-Info.plist")
  }

  return value
}

func generateWeatherIcon(condition: String) -> String {
  let condition = condition.lowercased()
  if condition.contains("clear") {
    return "sun.max"
  } else if condition.contains("cloudy") {
    return "cloud.sun"
  } else if condition.contains("rain") {
    return "cloud.rain"
  } else {
    return "minus"
  }


//    switch condition {
//      case condition.contains("clear"):
//        return UIImage(systemName: "sun.max")!
//    case condition.contains("cloudy"):
//      return UIImage(systemName: "cloud.sun")!
//    }
}
