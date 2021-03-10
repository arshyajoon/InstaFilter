//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Arshya GHAVAMI on 2/17/21.
//

import SwiftUI

@main
struct BookWormApp: App {
//    let persistenceController = PersistenceController.shared
    
    @Environment(\.managedObjectContext) var moc
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, moc)
        }
    }
}
