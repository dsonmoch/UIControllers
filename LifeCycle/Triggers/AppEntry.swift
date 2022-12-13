//
//  AppEntry.swift
//  LifeCycle
//
//  Created by Admin on 17/10/22.
//

import SwiftUI
@main
struct AppEntry: App{
    @StateObject var lnManager = LocalNotificationManager()
    var body: some Scene{
        WindowGroup{
            ContentView()
                .environmentObject(lnManager)
        }
    }
}
