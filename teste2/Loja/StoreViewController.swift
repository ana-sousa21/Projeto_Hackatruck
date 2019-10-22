//
//  StoreViewController.swift
//  teste2
//
//  Created by Student on 18/10/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class StoreViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    var items = LojaDAO.getList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storeCell", for: indexPath) as! StoreCollectionViewCell
            
        cell.nomeLabel.text = items[indexPath.item].nome
        cell.precoLabel.text = items[indexPath.item].preco
        cell.imagemImage.image = UIImage(named: items[indexPath.item].nomeDaFoto)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(items[indexPath.item].nome)
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
