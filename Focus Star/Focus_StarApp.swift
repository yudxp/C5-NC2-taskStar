//
//  Focus_StarApp.swift
//  Focus Star
//
//  Created by Yudha Hamdi Arzi on 21/07/22.
//

import SwiftUI

@main
struct Focus_StarApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
