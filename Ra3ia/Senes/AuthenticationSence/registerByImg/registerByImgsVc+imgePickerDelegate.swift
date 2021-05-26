//
//  registerByImgsVc+imgePickerDelegate.swift
//  Ra3ia
//
//  Created by Reham Ayman on 4/4/21.
//

import UIKit

extension registerByImgsVC : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    // user image
  

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
//            self.imageButton.setImage(image_data, for: .normal)
//
//            uploadImge.append(UploadData(data:(image_data).pngData()! as Data , fileName: "Image.jpg", mimeType: "image/jpg", name: "id_image"))
            
            if picker == userPicker {
                self.Userimg.image = image
               uploadImge.append(UploadData(data: (image).pngData()! as Data, fileName: "Image.jpg", mimeType: "image/jpg", name: "avatar"))
                
            } else if picker == idPicker {
                
                self.IDPic.image = image
                
                uploadImge.append(UploadData(data: (image).pngData()! as Data, fileName: "Image.jpg", mimeType: "image/jpg", name: "id_image"))
                
                
                
            } else if picker == vhicelPicker {
                
                self.vehiclePic.image = image
                
                uploadImge.append(UploadData(data: (image).pngData()! as Data, fileName: "Image.jpg", mimeType: "image/jpg", name: "car_image"))
                
            } else if picker == DrivingLicense {
                self.drivingLicenesPIC.image  = image
                uploadImge.append(UploadData(data: (image).pngData()! as Data, fileName: "Image.jpg", mimeType: "image/jpg", name: "licence_image"))
                
                
            }
            picker.dismiss(animated: true, completion: nil)
            
            
            
        }
         
        }
    
    
    

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}

