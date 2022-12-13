//
//  LocalNotificationManager.swift
//  LifeCycle
//
//  Created by Admin on 17/10/22.
//

import Foundation
import NotificationCenter

class LocalNotificationManager: ObservableObject {
    let notificationCenter = UNUserNotificationCenter.current()
    
    func requestAuthorization() async throws{
        try await notificationCenter.requestAuthorization(options: [.sound, .badge, .alert])
    }
}
