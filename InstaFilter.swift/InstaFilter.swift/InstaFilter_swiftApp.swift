//
//  InstaFilter_swiftApp.swift
//  InstaFilter.swift
//
//  Created by Arshya GHAVAMI on 3/3/21.
//

import SwiftUI

@main
struct InstaFilter_swiftApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
