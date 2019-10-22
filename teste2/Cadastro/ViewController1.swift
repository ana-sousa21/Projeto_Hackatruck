

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
    var imagem : UIImage!
    var especiesEscolhidas: String!
    let especie1Planta = [ "Planta 1", "Planta 2", "Planta 3", "Planta 4", "Planta 5", "Planta 6"]
    let sensores2Planta = [ "Sensor 1", "Sensor 2", "Sensor 3", "Sensor 4", "Sensor 5", "Sensor 6"]
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
       
        let mainStoreboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let DVC = mainStoreboard.instantiateViewController(withIdentifier: "LoadView") as! LoadViewController
        self.navigationController?.pushViewController(DVC, animated:true)
        
        
      
        
    
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
        }else if sensorCadastrado.isFirstResponder{
            let itemselected = sensores2Planta[row]
           sensorCadastrado.text = itemselected
  
    

    }


}


}
