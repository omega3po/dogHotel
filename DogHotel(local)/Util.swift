//
//  Util.swift
//  DogHotel(local)
//
//  Created by Sunny Hwang on 2023/04/27.
//
import Foundation
import Photos
import UIKit
import SwiftUI

extension String {
    func generateThumbnail(targetSize: CGSize = CGSize(width: 1200, height: 1200)) -> Image? {
            
            guard let asset: PHAsset = PHAsset.fetchAssets(withLocalIdentifiers: [self], options: .none).firstObject else { return nil }
            
            let manager = PHImageManager.default()
            let option = PHImageRequestOptions()
            option.deliveryMode = .highQualityFormat
            option.isSynchronous = true
            
            var thumbnail = UIImage()
            
            manager.requestImage(for: asset,
                                 targetSize:  targetSize,
                                 contentMode: .aspectFit,
                                 options: option,
                                 resultHandler: {(result, info) -> Void in
                if result == nil { return }
                thumbnail = result!
            })
            
            return Image(uiImage: thumbnail)
        }
}


