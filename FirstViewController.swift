//
//  FirstViewController.swift
//  Project1
//
//  Created by Prince Yemofio on 5/01/24.


    import Foundation
    import UIKit

    class FirstViewController : UITableViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            populateArray()
            //getJSONData()
        }
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            
            var index = tableView.indexPathForSelectedRow
            var MedRow = MedObjectArray[index!.row]
            
            var destinationController = segue.destination as! ViewController
            destinationController.segueMedication = MedRow

        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return MedObjectArray.count // or put 5 if it doesnt work
        }
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        
        override func   tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           // var cell = UITableViewCell()
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            let cellIndex = indexPath.row
            let hikingTrailRow = HikingTrailObjectArray[cellIndex]
            cell!.textLabel!.text = hikingTrailRow.TrailName
            cell!.detailTextLabel!.text = "Med Cost: \(hikingTrailRow.MedCost). Cost : \(hikingTrailRow.MedCost)."
            
            var img = PullImage(imageName: "https://raw.githubusercontent.com/donalmeida/JSONProjectsIT315/master/OldRag.jpg")
            
            cell!.imageView?.image = img
            return cell!
        }
        
        func PullImage(imageName:String) -> UIImage {
            var img = UIImage ()
            //conver string into url
            let imageURL = URL(string: imageName)
            //call the endpointand receive bytes
            let imgData = try? Data(contentsOf: imageURL!)
            print(imgData ?? "Error. Image does not exist at URL \(imageURL)")
            img = UIImage(data: imgData!)!
            return img
            
            
        }
        
        
        
        
        
        
        
        var HikingTrailObjectArray = [HikingTrail()]
        func populateArray() {
            
            let ht0 = HikingTrail()
            ht0.TrailName = "Old Rag"
            ht0.TrailLength = "8.0 miles"
            ht0.TrailDescription = " Though the tip is far from the highest point in the Blue Ridge Mountains, Old Rag is unique for its rocky summit and difficult terrain, which includes long stretches of bare rock that bear a closer resemblance to the rugged peaks of Yosemite than anything else you'll find in Virginia."
            ht0.TrailDifficulty = "Hard"
            ht0.TrailElevation = "2950 ft"
            ht0.TrailImage = "billgoat.jpg"
            ht0.TrailSite = "https://www.nps.gov/places/old-rag.htm"
            ht0.TrailTime = "8.5 hours "
            HikingTrailObjectArray.insert(ht0, at: 0)
            
            let ht1 = HikingTrail()
            ht1.TrailName = "White Oak Canyon/ Cedar Run"
            ht1.TrailLength = "7.9 miles"
            ht1.TrailDescription = " White Oak Canyon Trail in Syria, Virginia is highly recommended for waterfall enthusiasts, with beautiful falls even in foggy conditions. Recent reviews mention steep rock steps, slippery rocks when wet, and sections with roots and rocks."
            ht1.TrailDifficulty = "Moderate"
            ht1.TrailElevation = "3500 ft"
            ht1.TrailImage = "oldrag.jpg"
            ht1.TrailSite = "https://www.alltrails.com/trail/us/virginia/white-oak-canyon-trail"
            ht1.TrailTime = "2.5 hours "

            HikingTrailObjectArray.append(ht1)
            
            let ht2 = HikingTrail()
            ht2.TrailName = "Crabtree Falls"
            ht2.TrailLength = "4.4 miles"
            ht2.TrailDescription = " Crabtree Falls, the highest vertical-drop cascading waterfall east of the Mississippi River, is a popular attraction located in Nelson County, just six miles off the scenic Blue Ridge Parkway near milepost 27. Crabtree Falls features a series of five major cascades and a number of smaller ones that fall a total distance of 1,200 feet."
            ht2.TrailDifficulty = "Moderate"
            ht2.TrailElevation = "2500 ft"
            ht2.TrailImage = "cascadefalls.jpeg"
            ht2.TrailSite = "https://www.virginia.org/listing/crabtree-falls-trail/6681/"
            ht2.TrailTime = "4.5 hours "

            HikingTrailObjectArray.append(ht2)
            
            let ht3 = HikingTrail()
            ht3.TrailName = "Strickler Knob"
            ht3.TrailLength = "9.1 miles"
            ht3.TrailDescription = " The Strickler Knob Trail is a challenging rock hopping/scramble with beautiful views of New Market Gap, the Luray Valley, and a 360 degree picture perfect panorama from the Strickler Knob summit. "
            ht3.TrailDifficulty = "Easy"
            ht3.TrailElevation = "1000 ft"
            ht3.TrailImage = "bearrun.jpeg"
            ht3.TrailSite = "https://www.alltrails.com/trail/us/virginia/strickler-knob-trail"
            ht3.TrailTime = "1 hours "

            HikingTrailObjectArray.append(ht3)
            
            let ht4 = HikingTrail()
            ht4.TrailName = "Raven Rocks"
            ht4.TrailLength = "5.5 miles"
            ht4.TrailDescription = " The hike has constant ups and downs, steep sections, and is very rocky but offers a beautiful lookout at the end, making it worth the challenge."
            ht4.TrailDifficulty = "Hard"
            ht4.TrailElevation = "1233 ft"
            ht4.TrailImage = "bullrun.jpg"
            ht4.TrailSite = "https://www.alltrails.com/trail/us/virginia/raven-rocks-via-appalachian-trail"
            ht4.TrailTime = "4.4 hours "

            HikingTrailObjectArray.append(ht4)
            
        }
        
        func getJSONData() {
            let endPointURL = URL(string:"https://raw.githubusercontent.com/donalmeida/JSONProjectsIT315/master/HikingTrails.json")

            let dataBytes = try? Data(contentsOf:endPointURL!)
            print(dataBytes)
            
            if(dataBytes != nil){
                let dictionary:NSDictionary = (try! JSONSerialization.jsonObject(with: dataBytes!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
                print("Dictionary --: \(dictionary) --- \n")
                let htDictionary = dictionary["HikingTrails"]! as! [[String:AnyObject]]
                
                
                for index in 0...htDictionary.count - 1 {
                    let singleHT = htDictionary[index]
                    let ht = HikingTrail()
                    //retreive each object
                    ht.TrailName = singleHT["TrailName"] as! String
                    print("TrailName: - \(ht.TrailName)")
                    ht.TrailSite = singleHT["TrailWebsite"] as! String
                    ht.TrailElevation = singleHT["TrailElevation"] as! String
                    ht.TrailLength = singleHT["TrailLength"] as! String
                    ht.TrailDescription = singleHT["TrailDescription"] as! String
                    ht.TrailDifficulty = singleHT["TrailDifficulty"] as! String
                    ht.TrailImage = singleHT["TrailImage"] as! String
                    ht.TrailTime = singleHT["TrailTime"] as! String
                    ht.TrailAddress = singleHT["TrailAddress"] as! String
                    ht.TrailRoute = singleHT["TrailRoute"] as! String

                    HikingTrailObjectArray.append(ht)





                }
                
            }
                
            }
            
            
        }
        


}
