//
//  Model.swift
//  SelfPointMassageApp
//
//  Created by 許君愷 on 2024/2/16.
//

import UIKit
import RealityKit
import Combine

class Model{
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String){
        self.modelName = modelName
        
        self.image = UIImage(named: modelName)!
        
        let filename = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename).sink(receiveCompletion: { loadCompletion in
            //error
            print("DEBUG: unable to load modelEntity")
        }, receiveValue: { modelEntity in
            //get modelentity
            self.modelEntity = modelEntity
            print("DEBUG: success loaded modelentity for modelname")
        })
    }
}
