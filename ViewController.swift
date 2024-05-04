//
//  ViewController.swift
//  Project1
//
//  Created by Addo FERNANDO on 3/27/24.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblMedName: UILabel!
    
    @IBOutlet weak var lblDosage: UILabel!
    
    @IBOutlet weak var lblInstructions: UILabel!
    
    
    @IBOutlet weak var imgMedImage: UIImageView!
    
    @IBOutlet weak var scArea: UIScrollView!
   
    
    var segueMedication = Medications()
    //creating an array of obj
    var MedObjectArray = [Medications]()
    var rt = Medications()
    var SoundFile: AVAudioPlayer!
    
    
    //action that occurs when you press button
    @IBAction func btnNext(_ sender: Any) {
        SetLables()
    }
    
    @IBAction func btnSite(_ sender: Any) {
        let browserApp = UIApplication.shared
        let url = URL(string: rt.MedSite)
        browserApp.open(url!)
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        imgMedImage.alpha = 0
        lblPrice.alpha = 0
        lblDosage.alpha = 0
        lblInstructions.alpha = 0
        scArea.alpha = 0
        
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        UIView.animate(withDuration: 3, animations: {
            
            self.imgMedImage.alpha = 1
            self.lblPrice.alpha = 1
            self.lblDosage.alpha = 1
            self.lblInstructions.alpha = 1
            self.scArea.alpha = 1
            
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateArray()
        let soundURL = URL(fileURLWithPath: Bundle.main.path(forResource: "blocker_hit", ofType: "wav")!)
        SoundFile = try?AVAudioPlayer(contentsOf: soundURL)
        
        
        SetLables()

    }
    
    //sets lables with values from Med Obj array
    func SetLables(){
        var randomMed = MedObjectArray.randomElement()
        randomMed = segueMedication

        
        rt = MedObjectArray.randomElement()!
        lblMedName.text = rt.MedName
        lblDescription.text = rt.MedDescription
        lblPrice.text = rt.MedCost
        lblInstructions.text = rt.Instructions
        lblDosage.text = rt.MedDosage
        
        
        
        imgMedImage.image = UIImage(named: rt.MedImage)
        
        
        lblDescription.layer.cornerRadius = 25
        lblDescription.layer.borderColor = UIColor.blue.cgColor
        lblDescription.layer.borderWidth = 2
        lblDescription.numberOfLines = 0
        lblDescription.lineBreakMode = .byWordWrapping
        
        scArea.layer.cornerRadius = 25
        scArea.layer.borderColor = UIColor.blue.cgColor
        scArea.layer.borderWidth = 2
        
        SoundFile.play()

            }
    
    
    //populating array
    func populateArray() {
        let med0 = Medications()
        med0.MedName = "Paracetamol"
        med0.MedDescription = "Description: Commonly used medicine to treat pain and reduce high temperature"
        med0.MedDosage = "Dosage: Adults: 500mg "
        med0.MedCost = "Price: $13.99"
        med0.Instructions = "Instructions: Take 2x a day"
        med0.MedImage = "paracetamol.jpeg"
        med0.MedSite = "https://www.nhs.uk/medicines/paracetamol-for-adults/"
        MedObjectArray.insert(med0, at: 0)
        
        let med1 = Medications()
        med1.MedName = "Pepto Bismol"
        med1.MedDescription = "Description: Commonly used medicine to treat stomach pain"
        med1.MedDosage = "Dosage: Adults: 2.5mg "
        med1.MedCost = "Price: $49.99"
        med1.Instructions = "Instructions: Take every 60min until you feel better"
        med1.MedImage = "pepto.jpeg"
        med1.MedSite = "https://www.nhs.uk/medicines/pepto-bismol/"
        MedObjectArray.insert(med1, at: 0)
        
        let med2 = Medications()
        med2.MedName = "Albuterol"
        med2.MedDescription = "Description: Commonly used medicine to treat or prevent bronchospasm in patients with astha."
        med2.MedDosage = "Dosage: Adults: 2.5mg "
        med2.MedCost = "Price: $49.99"
        med2.Instructions = "Instructions: Take in with nebulizer 3 to 4 times per day"
        med2.MedImage = "albu.jpeg"
        med2.MedSite = "https://medlineplus.gov/druginfo/meds/a607004.html#:~:text=Albuterol%20is%20used%20to%20prevent,class%20of%20medications%20called%20bronchodilators."
        MedObjectArray.insert(med2, at: 0)
        
        let med3 = Medications()
        med3.MedName = "Alka-Seltzer"
        med3.MedDescription = "Description: Commonly used medicine to treat cold and flu symptoms"
        med3.MedDosage = "Dosage: Adults: 500mg "
        med3.MedCost = "Price: $13.99"
        med3.Instructions = "Instructions: Take 2 capsules with water every 4 hours."
        med3.MedImage = "alca.jpeg"
        med3.MedSite = "https://www.nhs.uk/medicines/aspirin-for-pain-relief/about-aspirin-for-pain-relief/"
        MedObjectArray.insert(med3, at: 0)
     
    }

    
    
    
    
    
   
    
}

