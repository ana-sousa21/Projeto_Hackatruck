//
//  planta.swift
//  SmartLeaf
//
//  Created by Student on 08/10/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class Planta {
    private var nome : String
    private var especie: String
    private var temperatura: Float
    private var temperaturaIdeal: Float
    private var umidadeIdeal: Float
    private var fotoPeriodo: [Float]
    private var solo : Solo
    
    init(nome : String, especie: String, solo: Solo, temperatura: Float, temperaturaIdeal: Float, umidadeIdeal: Float, fotoPeriodo: [Float]){
        self.nome = nome
        self.especie = especie
        self.solo = solo
        self.temperatura = temperatura
        self.temperaturaIdeal = temperaturaIdeal
        self.umidadeIdeal = umidadeIdeal
        self.fotoPeriodo = fotoPeriodo
    }
    
    init(json: [String: AnyObject]) {
        self.nome = json["nome"] as? String ?? ""
        self.especie = json["especie"] as? String ?? ""
        self.fotoPeriodo = json["fotoPeriodo"] as? [Float] ?? [0.0, 0.0]
        self.solo = Solo(json: json["solo"] as! [String: AnyObject])
        
        let temperatura = json["temperatura"] as? String ?? ""
        let temperaturaIdeal = json["temperaturaIdeal"] as? String ?? ""
        let umidadeIdeal = json["umidadeIdeal"] as? String ?? ""
        
        self.temperatura = (temperatura as NSString).floatValue
        self.temperaturaIdeal = (temperaturaIdeal as NSString).floatValue
        self.umidadeIdeal = (umidadeIdeal as NSString).floatValue
    }
    
    // retorna se a planta precisa ser regada
    func precisaRegar() -> Bool{
        return (getSolo().getUmidade() - getUmidadeIdeal() < 1)
    }
    
    // retorna se a planta precisa ser colocada na sombra
    func precisaDeSombra() -> Bool{
        return (getTemperatura() - getTemperaturaIdeal() < 1)
    }
    
    
    
    // *** GETTERS E SETTERS ***
    
    
    func getNome() -> String{
        return nome
    }
    
    func getEspecie() -> String{
        return especie
    }
    
    func getTemperatura() -> Float{
        return temperatura
    }
    
    func getTemperaturaIdeal() -> Float{
        return temperaturaIdeal
    }
    
    func getUmidadeIdeal() -> Float{
        return umidadeIdeal
    }
    
    func getSolo() -> Solo{
        return solo
    }
    
    func setNome (nome: String) {
        self.nome = nome
    }
    
    func setSolo (solo: Solo) {
        self.solo = solo
    }
    
    func getEspecie (especie: String) {
        self.especie = especie
    }
    
    func getTemperatura (temperatura: Float) {
        self.temperatura = temperatura
    }
    
    func getTemperaturaIdeal (temperaturaIdeal: Float) {
        self.temperaturaIdeal = temperaturaIdeal
    }
    
    func getUmidadeIdeal (umidadeIdeal: Float) {
        self.umidadeIdeal = umidadeIdeal
    }
    
    func getSolo (solo: Solo) {
        self.solo = solo
    }
    
    
    /*
     Planta JSON
     {
     "nome": String
     "especie": String
     "temperatura": Float
     "temperaturaIdeal": Float
     "umidadeIdeal": Float
     "solo": {
     "umidade": Float
     }
     
     
     }
     */
    
    
}
