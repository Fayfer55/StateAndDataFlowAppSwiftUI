//
//  DataManager.swift
//  StateAndDataFlowApp
//
//  Created by Кирилл Файфер on 25.10.2020.
//

import SwiftUI

struct DataManager {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @AppStorage("name") private var name = ""
    
    static let shared = DataManager()
    
    private init() {}
}

extension DataManager {
    func saveName(name: String) {
        self.name = name
    }
    
    func saveLogged(statusLog: Bool) {
        self.isLoggedIn = statusLog
    }
    
    func getName() -> String {
        name
    }
    
    func getStatusLogged() -> Bool {
        isLoggedIn
    }
    
    func removeName() {
        isLoggedIn = false
        name = ""
        UserDefaults.standard.removeObject(forKey: "name")
    }
}
