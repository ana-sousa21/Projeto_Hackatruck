//
//  Loja.swift
//  teste2
//
//  Created by Student on 18/10/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class Loja{
    
    let nome: String
    let preco: String
    let nomeDaFoto: String
    
    init(nome: String, preco: String, nomeDaFoto: String){
        
        self.nome = nome
        self.preco = preco
        self.nomeDaFoto = nomeDaFoto
        
    }
    
}

class LojaDAO{
    
    static func getList() -> [Loja]{
        
        return [
            
            Loja(nome: "Sementes", preco: "R$ 18,99", nomeDaFoto: "p_607"),
            Loja(nome: "Sensor DHT11", preco: "R$ 12,99", nomeDaFoto: "Image-1"),
            Loja(nome: "Fita de pH", preco: "R$ 09,99", nomeDaFoto: "fita_ph"),
            Loja(nome: "Rele 110V", preco: "R$ 44,00", nomeDaFoto: "rele")
            
        ]
        
    }
    
}
