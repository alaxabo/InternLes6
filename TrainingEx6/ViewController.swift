//
//  ViewController.swift
//  TrainingEx6
//
//  Created by Alaxabo on 3/20/17.
//  Copyright © 2017 Alaxabo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let image: [String] =  ["1","2","3","4","5","6"]
    var imageView: [UIImageView] = []
    var imageViewName = Array(repeating: "", count: 12)
    var imagePicked: [UIImageView] = []
    var gamecount = 0
    
    @IBOutlet weak var view11: UIView!
    @IBOutlet weak var image11: UIImageView!
    @IBOutlet weak var view12: UIView!
    @IBOutlet weak var image12: UIImageView!
    @IBOutlet weak var view13: UIView!
    @IBOutlet weak var image13: UIImageView!
    @IBOutlet weak var view21: UIView!
    @IBOutlet weak var image21: UIImageView!
    @IBOutlet weak var view22: UIView!
    @IBOutlet weak var image22: UIImageView!
    @IBOutlet weak var view23: UIView!
    @IBOutlet weak var image23: UIImageView!
    @IBOutlet weak var view31: UIView!
    @IBOutlet weak var image31: UIImageView!
    @IBOutlet weak var view32: UIView!
    @IBOutlet weak var image33: UIImageView!
    @IBOutlet weak var image32: UIImageView!
    @IBOutlet weak var view33: UIView!
    @IBOutlet weak var image41: UIImageView!
    @IBOutlet weak var view41: UIView!
    @IBOutlet weak var image42: UIImageView!
    @IBOutlet weak var view42: UIView!
    @IBOutlet weak var image43: UIImageView!
    @IBOutlet weak var view43: UIView!
    private func initImageView()
    {
        imageView += [image11,image12,image13,image21,image22,image23,image31,image32,image33,image41,image42,image43]

        var random: Int!
        for name in image {
            repeat {
                random = Int(arc4random_uniform(6))
            } while imageViewName[random] != ""
            imageViewName[random] = name
            repeat {
                random = Int(arc4random_uniform(6)) + 6
            } while imageViewName[random] != ""
            imageViewName[random] = name
        }
        
    }
    
    @IBAction func pickImageTapFlipFlap(_ sender: UITapGestureRecognizer){
        let view = sender.view as! UIImageView
        imagePicked.append(view)
        view.image = UIImage(named: imageViewName[imageView.index(of: view)!])
        let delayInSeconds = 0.5
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            self.checkImage()
            // here code perfomed with delay
        }
        if imagePicked.count == 2{
            for image in imageView{
                image.isUserInteractionEnabled = false
            }
        }
    }
    
    func checkImage(){
        if imagePicked.count == 2{
            if imagePicked[0] == imagePicked[1]{
                imagePicked[0].image = UIImage(named: "black.jpg")
                imagePicked.removeAll()
            }
            else{
                let imagePicked1 = imageViewName[imageView.index(of: imagePicked[0])!]
                let imagePicked2 = imageViewName[imageView.index(of: imagePicked[1])!]
                if (imagePicked1 == imagePicked2){
                    for image in imagePicked{
                        image.isHidden = true
                    }
                    gamecount += 1
                }
                else
                {
                    for image in imagePicked{
                    image.image = UIImage(named: "black")
                    }
                }
                imagePicked.removeAll()
            }
        }
        for image in imageView{
            image.isUserInteractionEnabled = true
        }
        
        if gamecount == 6{
            let alert = UIAlertController(title: "End", message: "You Have End The Game", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Restart", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initImageView()
        //let testPickTap = UITapGestureRecognizer(target: self, action: #selector(pickImageTapFlipFlap(recognizer:)))
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

