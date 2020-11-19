//
//  ImagePickerHelper.swift
//  WidgetApp
//
//  Created by Arvind on 19/11/20.
//

import UIKit
import MobileCoreServices

class ImagePickerHelper: NSObject {
    
    var vc: UIViewController
    var completion: ((UIImage?) -> Void)
    var imgPicker = UIImagePickerController()
    
    init(vc: UIViewController, completion: @escaping (UIImage?) -> Void) {
        self.vc = vc
        self.completion = completion
        
        super.init()
        imgPicker.delegate = self
        isShowPicked()
    }
}

extension ImagePickerHelper: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func isShowPicked() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let takePhoto = NSLocalizedString("Take Photo", comment: "ImagePickerHelper.swift: Take Photo")
        let takePhotoAC = UIAlertAction(title: takePhoto, style: .default, handler: { _ in
            self.isTakePhoto(self.vc, imgPC: self.imgPicker, edit: true)
        })
        
        let photoFr = NSLocalizedString("Photo From Library", comment: "ImagePickerHelper.swift: Photo From Library")
        let photoFromLibraryAC = UIAlertAction(title: photoFr, style: .default, handler: { _ in
            self.isPhotoFromLibrary(self.vc, imgPC: self.imgPicker, edit: true)
        })
        
        let cancel = NSLocalizedString("Cancel", comment: "ImagePickerHelper.swift: Cancel")
        let cancelAC = UIAlertAction(title: cancel, style: .cancel, handler: nil)
        
        alert.addAction(takePhotoAC)
        alert.addAction(photoFromLibraryAC)
        alert.addAction(cancelAC)
        vc.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var image: UIImage?
        
        if let editedIMG = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            image = editedIMG
        }
        
        completion(image)
        vc.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        vc.dismiss(animated: true, completion: nil)
    }
    
    
    public func isTakePhoto(_ vc: UIViewController, imgPC: UIImagePickerController, edit: Bool) {
        let image = kUTTypeImage as String
        
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            return
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imgPC.sourceType = .camera
            
            if let available = UIImagePickerController.availableMediaTypes(for: .camera) {
                if available.contains(image) {
                    imgPC.mediaTypes = [image]
                }
                
                if UIImagePickerController.isCameraDeviceAvailable(.front) {
                    imgPC.cameraDevice = .front
                }
                
                if UIImagePickerController.isCameraDeviceAvailable(.rear) {
                    imgPC.cameraDevice = .rear
                }
            }
            
        } else {
            return
        }
        
        imgPC.showsCameraControls = true
        imgPC.allowsEditing = edit
        imgPC.modalPresentationStyle = .custom
        vc.present(imgPC, animated: true, completion: nil)
    }
    
    public func isPhotoFromLibrary(_ vc: UIViewController, imgPC: UIImagePickerController, edit: Bool) {
        let image = kUTTypeImage as String
        
        if !UIImagePickerController.isSourceTypeAvailable(.photoLibrary) ||
            !UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            return
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imgPC.sourceType = .photoLibrary
            
            if let available = UIImagePickerController.availableMediaTypes(for: .photoLibrary) {
                if available.contains(image) {
                    imgPC.mediaTypes = [image]
                }
            }
            
        } else if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            imgPC.sourceType = .savedPhotosAlbum
            
            if let available = UIImagePickerController.availableMediaTypes(for: .savedPhotosAlbum) {
                if available.contains(image) {
                    imgPC.mediaTypes = [image]
                }
            }
            
        } else {
            return
        }
        
        imgPC.allowsEditing = edit
        imgPC.modalPresentationStyle = .custom
        vc.present(imgPC, animated: true, completion: nil)
    }
}
