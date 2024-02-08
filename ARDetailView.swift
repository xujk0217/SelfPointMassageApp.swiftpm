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
    var body: some View {
        return ARViewContainer()
            .navigationTitle("AR point map")
    }
}

struct ARViewContainer: UIViewRepresentable {

    typealias UIViewType = ARView

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)

        arView.enableTapGesture()
        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {

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

