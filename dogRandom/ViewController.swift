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
                                
                                self.dogView.image=dUiImage
                            }
                  
                  }
                  
                  task.resume()
                  
               
                  
                
                  
                  
                  
                  
              }
              
               
              
              
              task.resume()
              
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    


}

