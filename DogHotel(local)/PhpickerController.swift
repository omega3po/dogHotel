//
//  PhpickerController.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/04/27.
//

import Foundation
import SwiftUI
import UIKit
import PhotosUI

struct PhpViewControllerRepresentable: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> PHPickerViewController {
        let PhpickerViewController = PHPickerViewController(configuration: .init(photoLibrary: .shared()))
        PhpickerViewController.delegate = context.coordinator
        return PhpickerViewController
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = PHPickerViewController
    
    @Environment(\.presentationMode)
    private var presentationMode
    let imagePicked: (UIImage,String) -> Void // 이미지가 선택됐을때 결과 호출
    var currentLocalIdentifier: String?
    var photoImage: UIImage? = nil
    
    class Coordinator: NSObject,UINavigationControllerDelegate,PHPickerViewControllerDelegate {
        
        var parent: PhpViewControllerRepresentable
        
        init(parent: PhpViewControllerRepresentable) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            if results.isEmpty {
                picker.dismiss(animated: true)
                return
            }
            guard let provider = results.first?.itemProvider else { return }
            
            let identifiers = results.compactMap(\.assetIdentifier)
            let fetchResult = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
            
            guard results.count == fetchResult.count else {
                parent.presentationMode.wrappedValue.dismiss()
                
                return
            }
            parent.currentLocalIdentifier = fetchResult[0].localIdentifier
            
            guard let phAsset = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil).firstObject else { return }
            
            let imageRequestOption = PHImageRequestOptions()
            imageRequestOption.isNetworkAccessAllowed = true
            
            PHImageManager.default().requestImageDataAndOrientation(for: phAsset, options: imageRequestOption) { [self] data, _, _, _ in
                if let data = data, let image = UIImage(data: data) {
                    
                    
                    parent.imagePicked(image,parent.currentLocalIdentifier!)
                    
                    parent.presentationMode.wrappedValue.dismiss()
                }
            }
        }
        
    }
}

