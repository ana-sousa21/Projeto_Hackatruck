//
//  ViewController.swift
//  teste2
//
//  Created by Student on 16/10/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class ViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var plantaList = [Planta]()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSlideMenuButton()
    }
    @IBAction func cadastrar(_ sender: Any) {
        let mainStoreboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let DVC = mainStoreboard.instantiateViewController(withIdentifier: "CadastroView") as! ViewController1
        self.navigationController?.pushViewController(DVC, animated:true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plantaList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "plantaCell", for: indexPath) as! PlantaCollectionViewCell
        
        cell.nomeLabel.text = plantaList[indexPath.item].getNome()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath.item
        performSegue(withIdentifier: "propSegue", sender: self)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? ProprietyViewController {
            dest.planta = plantaList[index]
        }
    }
    
}

