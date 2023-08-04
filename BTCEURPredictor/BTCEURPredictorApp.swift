//
//  BTCEURPredictorApp.swift
//  BTCEURPredictor
//
//  Created by Mark Hoggatt on 04/08/2023.
//

import SwiftUI

@main
struct BTCEURPredictorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
