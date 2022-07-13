//
//  ImagePicker.swift
//  CFestival
//
//  Created by yu cui on 2022/7/2.
//

import SwiftUI

struct ImagePickerControllerView: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    var onImagePick: (UIImage) -> Void
    
    typealias UIViewControllerType =  UIImagePickerController
    
    static func cameraAviable() -> Bool {
        return UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = context.coordinator
        imagePickerController.sourceType = self.sourceType
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(onImagePick: onImagePick)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        init(onImagePick: @escaping (UIImage) -> Void) {
            self.onImagePick = onImagePick
        }
        
        var onImagePick: (UIImage) -> Void
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // 获取拍照或从图片库中得到的图片
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                onImagePick(image)
                picker.dismiss(animated: true)
            }
        }
    }
    
}

struct ImagePickerControllerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerControllerView(onImagePick: { image in
            
        })
    }
}
