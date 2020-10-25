//
//  UserManager.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 22.10.2020.
//

import Combine

class UserManager: ObservableObject {
    @Published var isRegister = DataManager().getStatusLogged()
    var name = DataManager().getName()
    
    init() {}
    
    init(name: String) {
        self.name = name
    }
}
