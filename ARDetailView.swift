//
//  ARDetailView.swift
//  SelfPointMassageApp
//
//  Created by 許君愷 on 2024/1/25.
//

import SwiftUI
import RealityKit
import ARKit
import FocusEntity

struct ARDetailView: View {
    @State private var isPlacementEnabled = false
    @State private var selectedModel: Model?
    @State private var modelConfirmedForPlacement: Model?
    
    private var models: [Model] = [Model(modelName: "People2"), Model(modelName: "PeopleS"), Model(modelName: "Hand"), Model(modelName: "Leg")]
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
            ARViewContainer(modelConfirmedForPlacement: self.$modelConfirmedForPlacement)
            
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
    @Binding var modelConfirmedForPlacement: Model?
    //typealias UIViewType = ARView

    func makeUIView(context: Context) -> ARView {
        
        let arView = CustomARView(frame: .zero)

        /*
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh){
            config.sceneReconstruction = .mesh
        }
        
        arView.session.run(config)
        //arView.enableTapGesture()
         */
        
        return arView
        
    }

    func updateUIView(_ uiView: ARView, context: Context) {
        if let model = self.modelConfirmedForPlacement{
            
            if let modelEntity = model.modelEntity{
                print("DEBUG: adding model to scene - \(model.modelName)")
                
                let anchorEntity = AnchorEntity(.plane(.any, classification: .any, minimumBounds: .one))
                
                anchorEntity.addChild(modelEntity.clone(recursive: false))
                
                uiView.scene.addAnchor(anchorEntity)
            }else{
                print("DEBUG: failed to load model - \(model.modelName)")
            }
            
            
            
            DispatchQueue.main.async {
                self.modelConfirmedForPlacement = nil
            }
        }
    }

}

class CustomARView: ARView, FocusEntityDelegate {
    func toTrackingState() {
        print("track")
    }
    
    func toInitializingState() {
        print("init")
    }
    
    var focusEntity: FocusEntity?
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        
        //focusEntity?.moveTo(view: self)
        focusEntity?.delegate = self
        focusEntity?.setAutoUpdate(to: true)
        
        self.setUpFocusEntity()
        self.setUpARView()
    }
    
    @objc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpFocusEntity() {
        self.focusEntity = FocusEntity(on: self, style: .classic(color: .yellow))
    }
    
    func setUpARView() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh){
            config.sceneReconstruction = .mesh
        }
        
        self.session.run(config)
        /*
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.meshWithClassification) {
            config.sceneReconstruction = .meshWithClassification
        }

        self.session.run(config)
        */
    }
}


struct ModelPickerView: View {
    @Binding var isPlasementEnabled: Bool
    @Binding var selectModel: Model?
    
    var models: [Model]
    
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 30){
                Text("Put on\nfloor")
                    .font(.headline)
                ForEach(0 ..< 4) { index in
                    Button(action: {
                        
                        print("DEBUG: selected model with name\(self.models[index])")
                        
                        if let path = Bundle.main.path(forResource: "Leg", ofType: "usdz") {
                            print("檔案存在於路徑: \(path)")
                        } else {
                            print("檔案不存在於資源束中")
                        }
                        if let usdzURL = Bundle.main.url(forResource: "Leg", withExtension: "usdz") {
                            print("檔案的 URL: \(usdzURL)")
                        } else {
                            print("檔案不存在於資源束中")
                        }
                        let path = Bundle.main.path(forResource: "Leg", ofType: "usdz") ?? ""
                        if FileManager.default.fileExists(atPath: path) {
                            print("檔案存在")
                        } else {
                            print("檔案不存在")
                        }
                        
                        self.selectModel = self.models[index]
                        
                        self.isPlasementEnabled = true
                    }){
                        Image(uiImage: self.models[index].image)
                            .resizable()
                            .frame(height: 80)
                            .aspectRatio(1/1, contentMode: .fit)
                            .background(Color.white)
                            .cornerRadius(12)
                        if index == 0{
                            Divider()
                                .frame(height: 80)
                                .padding(.horizontal)
                            Text("Put on\ntable\n(Point name)")
                                .font(.headline)
                        }
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
    @Binding var selectedModel: Model?
    @Binding var modelConfirmedForPlacement: Model?
    
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

/*
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
        
        let material = SimpleMaterial(color: UIColor.white, roughness: 0.3, isMetallic: true)
        
        let modelEntity = ModelEntity(mesh: mesh, materials: [material])
        
        modelEntity.generateCollisionShapes(recursive: true)
        
        let anchorEntity = AnchorEntity(world: position)
        
        anchorEntity.addChild(modelEntity)
        
        self.scene.addAnchor(anchorEntity)
        
    }
}
 */

#Preview {
    ARDetailView()
}

