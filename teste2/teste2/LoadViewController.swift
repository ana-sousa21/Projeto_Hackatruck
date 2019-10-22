//
//  LoadViewController.swift
//  teste2
//
//  Created by Student on 18/10/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class LoadViewController: UIViewController {

    var plantaList = [Planta]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PlantaDAO.getPlantas{ (plantas) in
            
            self.plantaList = plantas
            
            PlantaDAO.getUmidade{ (umidade) in
                for planta in self.plantaList {
                    planta.setSolo(solo: Solo(umidade: umidade))
                }
                self.performSegue(withIdentifier: "loadSegue", sender: self)
            }
            
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? ViewController {
            dest.plantaList = plantaList
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
