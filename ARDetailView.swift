//
//  ARDetailView.swift
//  SelfPointMassageApp
//
//  Created by 許君愷 on 2024/1/25.
//

import SwiftUI
import RealityKit
import ARKit

struct ARDetailView: View {
    @State private var isPlacementEnabled = false
    @State private var selectedModel: String?
    @State private var modelConfirmedForPlacement: String?
    
    private var models: [String] = ["People"]
    /* 從file name 去取資料，現在無法取得
    {
        //get our model name
        let filemanager = FileManager.default
        
        guard let path = Bundle.main.resourcePath, let files = try?
            filemanager.contentsOfDirectory(atPath: path) else {
            return []
        }
        var availableModels: [String] = []
        for filename in files where filename.hasSuffix("usdz"){
            let modelName = filename.replacingOccurrences(of: ".usdz", with: "")
            availableModels.append(modelName)
        }
        
        return availableModels
    }()
    */
    
    var body: some View {
        ZStack(alignment: .bottom){
            ARViewContainer()
            
            if self.isPlacementEnabled{
                PlacementButtonView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel, modelConfirmedForPlacement: self.$modelConfirmedForPlacement)
            } else {
                ModelPickerView(isPlasementEnabled: self.$isPlacementEnabled, selectModel: self.$selectedModel, models: self.models)
            }
            
        }
            .navigationTitle("AR point map")
    }
}

struct ARViewContainer: UIViewRepresentable {

    typealias UIViewType = ARView

    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)

        arView.enableTapGesture()
        return arView
        
         /*
        let arView = ARView(frame: .zero)

        let people = try! People.loadBox() 

        arView.scene.anchors.append(people)
        return arView
          */
    }

    func updateUIView(_ uiView: ARView, context: Context) {

    }

}

struct ModelPickerView: View {
    @Binding var isPlasementEnabled: Bool
    @Binding var selectModel: String?
    
    var models: [String]
    
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 30){
                ForEach(0 ..< self.models.count) { index in
                    Button(action: {
                        print("DEBUG: selected model with name\(self.models[index])")
                        
                        self.selectModel = self.models[index]
                        
                        self.isPlasementEnabled = true
                    }){
                        Image(uiImage: UIImage(named: self.models[index])!)
                            .resizable()
                            .frame(height: 80)
                            .aspectRatio(1/1, contentMode: .fit)
                            .background(Color.white)
                            .cornerRadius(12)
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding(20)
        .background(Color.black.opacity(0.5))
    }
}

struct PlacementButtonView: View {
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: String?
    @Binding var modelConfirmedForPlacement: String?
    
    var body: some View {
        HStack{
            //cancel button
            Button(action: {
                print("DEBUG: model Placement canceled.")
                
                self.resetPlacementParameters()
            }, label: {
                Image(systemName: "xmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            })
            
            Button(action: {
                print("DEBUG: model Placement confirmed.")
                self.modelConfirmedForPlacement = self.selectedModel
                self.resetPlacementParameters()
            }, label: {
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            })
        }
    }
    
    func resetPlacementParameters() {
        self.isPlacementEnabled = false
        self.selectedModel = nil
    }
}


extension ARView {
    //識別手勢
    func enableTapGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
   @objc func handleTap(recognizer: UITapGestureRecognizer) {
       let tapLocation = recognizer.location(in: self)
       
       //做射線去確認點擊衛視是否有平面
       guard let rayResult = self.ray(through: tapLocation) else { return }
       
       let results = self.scene.raycast(origin: rayResult.origin, direction: rayResult.direction)
       
       if let firstResult = results.first {
           //點擊到物體
           var position = firstResult.position
           
           position.y += 0.3 / 2
           //偏移物體達到放置效果
           
           placeCube(at: position)
           
       } else {
           //點擊到自然平面
           let results = self.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .any)
           
           if let firstResult = results.first {
               let position = simd_make_float3(firstResult.worldTransform.columns.3)
               placeCube(at: position)
           }
       }
    }
    
    //放置code
    func placeCube(at  position: SIMD3<Float>) {
        let mesh = MeshResource.generateBox(size: 0.3)
        
        let material = SimpleMaterial(color: UIColor.randomColor(), roughness: 0.3, isMetallic: true)
        
        let modelEntity = ModelEntity(mesh: mesh, materials: [material])
        
        modelEntity.generateCollisionShapes(recursive: true)
        
        let anchorEntity = AnchorEntity(world: position)
        
        anchorEntity.addChild(modelEntity)
        
        self.scene.addAnchor(anchorEntity)
        
    }
}

//物體顏色隨機
extension UIColor {
    class func randomColor() -> UIColor {
        let colors: [UIColor] = [.white,.red,.blue,.yellow,.orange,.green]
        let randomIndex = Int(arc4random_uniform(UInt32(colors.count)))
        
        return colors[randomIndex]
    }
}

#Preview {
    ARDetailView()
}

