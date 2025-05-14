//
//  ContentView.swift
//  GearLocker
//
//  Created by Jiyu He on 5/13/25.
//

import SwiftUI

struct ContentView: View {
  @StateObject var gearStore = GearStore()
  
  var body: some View {
    NavigationView {
      List {
        ForEach(gearStore.gears) { gear in
          VStack(alignment: .leading) {
            Text(gear.name).font(.headline)
            Text("\(gear.totalTime, specifier: "%.1f") hrs")
          }
        }
      }
      .navigationTitle("My Locker")
      .toolbar {
        Button("Add Gear") {
          let newGear = Gear(
            id: UUID(),
            name: "Sample shoes",
            imageFilename: "shoes.jpg",
            totalTime: 0.0,
            logs: []
          )
          gearStore.addGear(newGear)
        }
      }
      
    }
  }
}

#Preview {
  ContentView()
}
