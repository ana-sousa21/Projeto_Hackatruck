//
//  ProprietyViewController.swift
//  teste2
//
//  Created by Student on 18/10/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class ProprietyViewController: BaseViewController {

    var planta: Planta?
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var umidadeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nomeLabel.text = planta?.getNome()
        umidadeLabel.text =  "\(planta!.getSolo().getUmidade())"
        
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
