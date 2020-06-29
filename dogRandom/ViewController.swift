//
//  ViewController.swift
//  dogRandom
//
//  Created by mayank bhoria on 25/06/20.
//  Copyright © 2020 mayank bhoria. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dogView: UIImageView!
    
    
    
    @IBOutlet weak var dg2: UIImageView!
    
    
    @IBOutlet weak var dg3: UIImageView!
    
    
    
    @IBOutlet weak var dg4: UIImageView!
    
    
    
    @IBOutlet weak var dg5: UIImageView!
    
    
    
    @IBOutlet weak var dg6: UIImageView!
    
    
    @IBOutlet weak var dogTitle: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      
     
         
        
    }
    
    
    
    @IBAction func showDog(_ sender: UIButton) {
        
        
        
        
        
        
        
        
        let randomDogImageUrl=DogApi.Endpoint.randomDogImage.url
              
              let task=URLSession.shared.dataTask(with: randomDogImageUrl) { (data, response,error) in guard let data = data else {
                  return
                  }
                   
                  
                  let decoder=JSONDecoder()
                  
                  let imageData=try! decoder.decode(DogImage.self, from: data)
                  
                  print(imageData)
                  
                  guard let imageUrl=URL(string: imageData.message) else {
                      return
                  }
                  
                  
                  let task=URLSession.shared.dataTask(with: imageUrl) { (data, response,error) in guard let data = data else{
                          return
                      }
                  
                  let dUiImage=UIImage(data: data)
                            
                            DispatchQueue.main.async {
                                
                                
                                
                                UIView.animate(withDuration: 1.0, animations: {
                                    
                                    self.dogTitle.textColor=UIColor.white
                                    
                                    self.dogTitle.frame.size.width += 4
                                    self.dogTitle.frame.size.height += 4
                                    
                                    
                                    
                                    self.view.backgroundColor=UIColor.black
                                    
                                    self.dogTitle.frame.origin.y -= 300
                                    
                                    
                                    
                                    
                                    
                                    
                                           
                                    
                                  self.dg2.frame.origin.y -= 300
                                   
                                  self.dg2.frame.origin.x -= 140
                                    
                                    self.dg2.frame.size.width += 300
                                    self.dg2.frame.size.height += 300
                                    
                                 
                               
                                                                  
                                                                  
                                    self.dg2.image=dUiImage
                                  
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                           print("animations")
                                       })
                                
                                
                                
                                
                              
                            }
                  
                  }
                  
                  task.resume()
                  
               
                  
                
                  
                  
                  
                  
              }
              
               
              
              
              task.resume()
              
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    


}

