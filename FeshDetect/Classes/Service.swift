//
//  Service.swift
//  DetectFace
//
//  Created by Debayan Bhattacharya on 1/31/19.
//

import Foundation
public class Service{
    private init(){
        
    }
    public static func doSomething() -> String{
        return "Hello"
    }
    public func imageFaceCount(_ url:String, image:UIImage,status:@escaping (_ statuscode:Int) -> Void){
        
        let imageOptions =  NSDictionary(object: NSNumber(value: 5) as NSNumber, forKey: CIDetectorImageOrientation as NSString)
        let personciImage = CIImage(cgImage: image.cgImage!)
        let accuracy = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: accuracy)
        let faces = faceDetector?.features(in: personciImage, options: imageOptions as? [String : AnyObject])
        
        
        
        if faces!.count>1{
            status(200);
        } else {
            status(400);
            //        let alert = UIAlertController(title: "No Face!", message: "No face was detected", preferredStyle: UIAlertController.Style.alert)
            //        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            //        self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    public func imageDetect(_ url:String, image:UIImage,status:@escaping (_ statuscode:Int) -> Void){
        
        let imageOptions =  NSDictionary(object: NSNumber(value: 5) as NSNumber, forKey: CIDetectorImageOrientation as NSString)
        let personciImage = CIImage(cgImage: image.cgImage!)
        let accuracy = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: accuracy)
        let faces = faceDetector?.features(in: personciImage, options: imageOptions as? [String : AnyObject])
        
        if let face = faces?.first as? CIFaceFeature {
            // print("found bounds are \(face.bounds)")
            
            //        let alert = UIAlertController(title: "Say Cheese!", message: "We detected a face!", preferredStyle: UIAlertController.Style.alert)
            //        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            //        self.present(alert, animated: true, completion: nil)
            //  cropFaces()
            status(200)
            if face.hasSmile {
                print("face is smiling");
                
            }
            
            if face.hasLeftEyePosition {
                print("Left eye bounds are \(face.leftEyePosition)")
                
            }
            
            if face.hasRightEyePosition {
                print("Right eye bounds are \(face.rightEyePosition)")
                //  status("Right eye bounds are \(face.rightEyePosition)")
                
            }
        } else {
            status(400);
            //        let alert = UIAlertController(title: "No Face!", message: "No face was detected", preferredStyle: UIAlertController.Style.alert)
            //        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            //        self.present(alert, animated: true, completion: nil)
        }
    }
}

