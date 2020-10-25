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
}

extension DataManager {
    func saveName(_ value: Any?) {
        UserDefaults.standard.setValue(value, forKey: "name")
    }
    
    func saveLogged(_ value: Any?) {
        UserDefaults.standard.setValue(value, forKey: "isLoggedIn")
    }
    
    func getName() -> String {
        UserDefaults.standard.string(forKey: "name") ?? ""
    }
    
    func getStatusLogged() -> Bool {
        UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    func removeName() {
        UserDefaults.standard.removeObject(forKey: "name")
    }
}
