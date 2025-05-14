//
//  GearStore.swift
//  GearLocker
//
//  Created by Jiyu He on 5/13/25.
//

import Foundation

class GearStore: ObservableObject {
  @Published var gears: [Gear] = []
  
  private let filename = "gear_data.json"
  
  private var fileURL: URL {
    let manager = FileManager.default
    let documents = manager.urls(for: .documentDirectory, in: .userDomainMask)[0]
    return documents.appendingPathComponent(filename)
  }
  
  init() {
    load()
  }
  
  func save() {
    do {
      let data = try JSONEncoder().encode(gears)
      try data.write(to: fileURL, options: [.atomicWrite, .completeFileProtection])
    } catch {
      print("Failed to save data: \(error)")
    }
  }
  
  func load() {
    do {
      let data = try Data(contentsOf: fileURL)
      gears = try JSONDecoder().decode([Gear].self, from: data)
    } catch {
      print("Failed to load data: \(error)")
      gears = []
    }
  }
  
  func addGear(_ gear: Gear) {
    gears.append(gear)
    save()
  }
  
  func addUsage(to gearID: UUID, durations: Double) {
    guard let index = gears.firstIndex(where: { $0.id == gearID }) else { return }
    let log = UsageLog(id: UUID(), data: Date(), duration: TimeInterval())
    gears[index].logs.append(log)
    gears[index].totalTime += durations
    save()
  }
}
