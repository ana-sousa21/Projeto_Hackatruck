//
//  PlantaDAO.swift
//  SmartLeaf
//
//  Created by Student on 08/10/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation



class PlantaDAO {
    
    static private var plantaList = [Planta]()
    
    static func setPlantaList(plantas: [Planta]) {
        self.plantaList = plantas
    }
    
    static func getPlantaList() -> [Planta] {
        return plantaList
    }
    
    static func getPlantas (callback: @escaping (([Planta]) -> Void)) {
        
        let endpoint: String = "https://whatsondofbot.mybluemix.net/listarPlantas"
        
        guard let url = URL(string: endpoint) else {
            print("Erroooo: Cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            if error != nil {
                print("Error = \(String(describing: error))")
                return
            }
            
            let responseString = String(data: data!, encoding: String.Encoding.utf8)
            print("responseString = \(String(describing: responseString))")
            
            DispatchQueue.main.async() {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: AnyObject]] {
                        
                        var plantas = [Planta]()
                        
                        for plantaJson in json {
                            plantas.append(Planta(json: plantaJson))
                        }
                        
                        callback(plantas)
                        
                    }else {
                        
                        print("fudeuuuu")
                    }
                } catch let error as NSError {
                    print("Error = \(error.localizedDescription)")
                }
            }
            
            
        })
        
        task.resume()
    }

    static func getUmidade (callback: @escaping ((Float) -> Void)) {
        
        let endpoint: String = "https://iotgustavo06.mybluemix.net/list"
        
        guard let url = URL(string: endpoint) else {
            print("Erroooo: Cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            if error != nil {
                print("Error = \(String(describing: error))")
                return
            }
            
            let responseString = String(data: data!, encoding: String.Encoding.utf8)
            print("responseString = \(String(describing: responseString))")
            
            DispatchQueue.main.async() {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: AnyObject]] {
                        
                        let solo = Solo(json: json[json.count - 1]["d"] as! [String: AnyObject])
                        
                        callback(solo.getUmidade())
                        
                    }else {
                        
                        print("fudeuuuu")
                    }
                } catch let error as NSError {
                    print("Error = \(error.localizedDescription)")
                }
            }
            
            
        })
        
        task.resume()
        
    }
    
}
