//
//  TeachTapApp.swift
//  TeachTap
//
//  Created by Roosh on 7/29/25.
//

import SwiftUI

@main
struct TeachTapApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
