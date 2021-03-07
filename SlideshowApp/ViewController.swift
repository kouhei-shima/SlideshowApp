//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 島浩平 on 2021/03/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var go: UIButton!
    @IBOutlet weak var startstop: UIButton!
    
    // 配列に指定するindex番号を宣言
     var nowIndex:Int = 0

     // スライドショーに使用するタイマーを宣言
     var timer: Timer!

     // スライドショーさせる画像の配列を宣言
     var imageArray:[UIImage] = [UIImage(named: "photo1")!,UIImage(named: "photo2")!,UIImage(named: "photo3")!]
    
    let imageName = ["photo1", "photo2", "photo3"]
    var changeImgNo = 0
    
    @IBAction func backaction(_ sender: Any) {
        if changeImgNo == 0 {
            changeImgNo = 2
        } else if changeImgNo == 1 {
            changeImgNo = 0
        } else if changeImgNo == 2 {
            changeImgNo = 1
        }
        let name = imageName[changeImgNo]
        ImageView.image = UIImage(named: name)
    }
    
    @IBAction func goaction(_ sender: Any) {
        if changeImgNo == 0 {
            changeImgNo = 1
        } else if changeImgNo == 1 {
            changeImgNo = 2
        } else if changeImgNo == 2 {
            changeImgNo = 0
        }
        let name = imageName[changeImgNo]
        ImageView.image = UIImage(named: name)
    }
    
    @IBAction func startstopaction(_ sender: Any) {
        // 再生中か停止しているかを判定
         if (timer == nil) {
         // 再生時の処理を実装
         // タイマーをセットする
         timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
         //再生中は戻るボタンと進むボタンは無効化
         back.isEnabled = false
         go.isEnabled = false
         // ボタンの名前を停止に変える
         startstop.setTitle("停止", for: .normal)

         } else {
         // 停止時の処理を実装
         // タイマーを停止する
         timer.invalidate()

         // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
         timer = nil
         // ボタンの名前を再生に直しておく
         startstop.setTitle("再生", for: .normal)
         back.isEnabled = true
         go.isEnabled = true
         }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func ImageViewaction(_ sender: Any) {
    }
    
    @objc func changeImage() {
          // indexを増やして表示する画像を切り替える
          nowIndex += 1

          // indexが表示予定の画像の数と同じ場合
          if (nowIndex == imageArray.count) {
          // indexを一番最初の数字に戻す
          nowIndex = 0
          }
          // indexの画像をstoryboardの画像にセットする
          ImageView.image = imageArray[nowIndex]
      }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているchangeImgNoに代入して渡す
        if changeImgNo == 0 {
            resultViewController.changeImgNo = 0
        }else if changeImgNo == 1 {
            resultViewController.changeImgNo = 1
        }else if changeImgNo == 2 {
            resultViewController.changeImgNo = 2
        }
        let name = imageName[changeImgNo]
        ImageView.image = UIImage(named: name)
    }
}
