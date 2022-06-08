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
  } else if condition.contains("sunny") {
    return "sun.max"
  } else if condition.contains("cloudy") {
    return "cloud.sun"
  } else if condition.contains("rain") {
    return "cloud.rain"
  } else {
    return "rays"
  }
}

func generateWeatherConditionInString(condition: String) -> String {
  let condition = condition.lowercased()
  if condition.contains("sunny") || condition.contains("clear") {
    return "clear"
  } else if condition.contains("cloudy") {
    return "cloudy"
  } else if condition.contains("rain") {
    return "rain"
  } else {
    return "clear"
  }
}

func generateTimeInString(epoch: String) -> String {
  let epoch = Double(epoch)
//  let date = Date(timeIntervalSince1970: epoch ?? 0.0)
//
//  let calendar = Calendar.current
//
//  let hour = calendar.component(.hour, from: date)
  let date = Date(timeIntervalSince1970: epoch ?? 0.0)

  let dayTimePeriodFormatter = DateFormatter()

  dayTimePeriodFormatter.dateFormat = "HH"

  let hour = Int(dayTimePeriodFormatter.string(from: date as Date))!

  if hour >= 05 && hour <= 06 {
    return "sunrise"
  } else if hour >= 07 && hour <= 16 {
    return "day"
  } else if hour >= 17 && hour <= 18 {
    return "sunset"
  } else if hour >= 19 && hour <= 04 {
    return "night"
  } else {
    return "day"
  }
}

func generateWeatherBackgroundName(timeInString: String, weatherInString: String) -> String {
  return "img-weather-bg-\(timeInString)-\(weatherInString)"
}
