//
//  ViewController.swift
//  SmartLeafTelaCadastro
//
//  Created by Student on 16/10/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class ViewController1: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet weak var nomePlanta: UITextField!
    @IBOutlet weak var imagemPlanta: UIImageView!
    
    @IBOutlet weak var sensorCadastrado: UITextField!
    
    @IBOutlet weak var especieCadastrada: UITextField!
    
    @IBOutlet weak var testeNomePlanta: UILabel!
    
    @IBOutlet weak var testeEspeciePlanta: UILabel!
    
    @IBOutlet weak var testSensorPlanta: UILabel!
    
    
    var nomeDaPlanta: String!
    var imagem = ["alecrim","hortela"]
    var especiesEscolhidas: String!
    let especie1Planta = [ "Alecrim", "Hortela"]
    let sensores2Planta = [ "Sensor Umidade 1", "Sensor Umidade 2"]
    var sensoresEscolhidos: String!
    

    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thePickerEspecie = UIPickerView()
        self.especieCadastrada.inputView = thePickerEspecie
        let thePickerSensor = UIPickerView()
        self.sensorCadastrado.inputView = thePickerSensor
        
        thePickerEspecie.delegate = self
        thePickerSensor.delegate = self
        
 
     
        
    }
    
    

    
    @IBAction func botaoCadastrar(_ sender: Any) {
       
  
        
    
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
     return 1
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if especieCadastrada.isFirstResponder{
            
            return especie1Planta.count
            
        }else if sensorCadastrado.isFirstResponder{
            
            return sensores2Planta.count
       
         }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        if especieCadastrada.isFirstResponder{
            return especie1Planta[row]
        }else if sensorCadastrado.isFirstResponder{
            return sensores2Planta[row]
        
        }
        return nil
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if especieCadastrada.isFirstResponder{
            let itemselected = especie1Planta[row]
            
            especieCadastrada.text = itemselected
            if especieCadastrada.text == "Alecrim"{
                 imagemPlanta.image = UIImage(named: "alecrim")
            }
            
            if especieCadastrada.text == "Hortela"{
                imagemPlanta.image = UIImage(named: "hortela")
            }
            
        }else if sensorCadastrado.isFirstResponder{
            let itemselected = sensores2Planta[row]
           sensorCadastrado.text = itemselected
  
    

    }


}
  
 /*   func Planta(){
        
        
        var nomePlantaEscolhida: [String]
        var imagemEscolhida: [UIImage]
        var nomeEspecieEscolhida:[String]()
        var nomeSensorEscolhido: [String]
        
        
        
        nomePlantaEscolhida.append(nomePlanta.text!)
        testeEspeciePlanta.text = especieCadastrada.text
        testSensorPlanta.text = sensorCadastrado.text
        
        
    }*/
    
    


}
