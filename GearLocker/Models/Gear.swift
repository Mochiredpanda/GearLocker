//
//  Gear.swift
//  GearLocker
//
//  Created by Jiyu He on 5/13/25.
//

import Foundation

struct UsageLog: Codable, Identifiable {
  let id: UUID
  let data: Date
  let duration: TimeInterval
}

struct Gear: Codable, Identifiable {
  let id: UUID
  var name: String
  var imageFilename: String
  var totalTime: Double
  var logs: [UsageLog]
}
