//
//  OCRViewController.swift
//  GROUP2_MILESTONE2
//
//  Created by Oreoluwa Lawal on 2022-08-01.
//

import UIKit
import Vision
import VisionKit

class OCRViewController: UIViewController, VNDocumentCameraViewControllerDelegate {
    
    
    @IBOutlet weak var titlelabel: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    
    
    @IBOutlet weak var expiry: UILabel!
    
    @IBOutlet weak var takeImage: UIButton!
    
    @IBOutlet weak var cancel: UIBarButtonItem!
    
    @IBOutlet weak var done: UIBarButtonItem!
    
    private var ocrRequest = VNRecognizeTextRequest(completionHandler: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOCR()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func takeImgBtn(_ sender: Any) {
        let scanVC = VNDocumentCameraViewController()
                scanVC.delegate = self
                present(scanVC, animated: true)
    }
    
    @IBAction func doneBtn(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    private func processImage(_ image: UIImage) {
           guard let cgImage = image.cgImage else { return }

           expiry.text = ""
           takeImage.isEnabled = false
           
           let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
           do {
               try requestHandler.perform([self.ocrRequest])
           } catch {
               print(error)
           }
       }

    private func configureOCR() {
           ocrRequest = VNRecognizeTextRequest { (request, error) in
               guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
               
               var ocrText = ""
               for observation in observations {
                   guard let topCandidate = observation.topCandidates(1).first else { return }
                   
                   ocrText += topCandidate.string + "\n"
               }
               
               
               DispatchQueue.main.async {
        
                   self.expiry.text = ocrText
                   
                   let dateFormatter = DateFormatter()
                   dateFormatter.dateFormat = "MMM dd, YYYY"
                   let strDate = dateFormatter.string(for: self.expiry.text)
                       print(strDate)
                   
                 
                   self.takeImage.isEnabled = true
               }
           }
           
           ocrRequest.recognitionLevel = .accurate
           ocrRequest.recognitionLanguages = ["en-US", "en-GB"]
           ocrRequest.usesLanguageCorrection = true
       }
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        guard scan.pageCount >= 1 else {
            controller.dismiss(animated: true)
            return
        }
        
        img.image = scan.imageOfPage(at: 0)
        processImage(scan.imageOfPage(at: 0))
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        //Handle properly error
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true)
    }
}
