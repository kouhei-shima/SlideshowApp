//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 島浩平 on 2021/03/03.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var UPImageView: UIImageView!
    
    let images =  ["photo1.jpeg", "photo2.jpeg", "photo3.jpeg"]
    var changeImgNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let imageStr:String = images[changeImgNo]
        UPImageView.image = UIImage(named:imageStr)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
