//
//  Quizlet_ishApp.swift
//  Quizlet-ish
//

import SwiftUI
import Firebase

@main
struct Quizlet_ishApp: App {
    
    init() {
        FirebaseApp.configure()
        AuthenticationService.signIn()

    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
