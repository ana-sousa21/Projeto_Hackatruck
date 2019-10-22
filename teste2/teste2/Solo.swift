//
//  Solo.swift
//  SmartLeaf
//
//  Created by Student on 08/10/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation


class Solo {
    private var umidade: Float
    
    init (umidade: Float) {
        self.umidade = umidade
    }
    
    init(json: [String: AnyObject]) {
        self.umidade = json["umidade"] as? Float ?? 0.0
    }
    
    func getUmidade () -> Float {
        return umidade
    }
    
    func setUmidade (umidade: Float) {
        self.umidade = umidade
    }
}
