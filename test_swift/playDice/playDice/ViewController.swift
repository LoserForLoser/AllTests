//
//  ViewController.swift
//  playDice
//
//  Created by 宋朝阳 on 2018/3/11.
//  Copyright © 2018年 Song. All rights reserved.
//

import UIKit

enum SelectType {
    case Big, Same, Small
}

class ViewController: UIViewController {

    @IBOutlet weak var diceImage1: UIImageView!
    
    @IBOutlet weak var diceImage2: UIImageView!
    
    @IBOutlet weak var diceImage3: UIImageView!
    
    @IBOutlet weak var playerLabel: UILabel!
    
    @IBOutlet weak var bossLabel: UILabel!
    
    
    var timer: Timer?
    var imageNumber = 0
    var selectType = SelectType.Big
    
    var diceNumArr = [Int](repeating: 0, count: 3)
    
    var playerMoney = 1000
    var bossMoney = 1000
    
    
    func judgeResult() {
        
        // 知道选择
        switch selectType {
        case .Big:
            if endNum() > 11 {
                playerWin(payMoney: 30)
            } else {
                bossWin(payMoney: 30)
            }
        case .Same:
            if diceNumArr[0] == diceNumArr[1] && diceNumArr[0] == diceNumArr[2] {
                playerWin(payMoney: 300)
            } else {
                bossWin(payMoney: 300)
            }
        case .Small:
            if endNum() > 11 {
                bossWin(payMoney: 30)
            } else {
                playerWin(payMoney: 30)
            }
        default:
            break
        }
        
        playerLabel.text = String(playerMoney)
        bossLabel.text = String(bossMoney)
        
    }
    
    func bossWin(payMoney: Int){
        if playerMoney > payMoney {
            playerMoney -= payMoney
            bossMoney += payMoney
        } else {
            bossMoney += playerMoney
            playerMoney -= playerMoney
        }
    }
    
    func playerWin(payMoney: Int){
        if bossMoney > payMoney {
            bossMoney -= payMoney
            playerMoney += payMoney
        } else {
            playerMoney += bossMoney
            bossMoney -= bossMoney
        }
    }
    
    func endNum() -> Int {
        var num = 0
        
        for itemNum in diceNumArr {
            num += itemNum
        }
        
        return num
    }
    
    @objc func changeImage() {
        var imageName: String?

        let i1 = arc4random() % 6 + 1
        imageName = String(i1 * 111)
        diceImage1.image = UIImage(named: imageName!)
        
        diceNumArr[0] = (Int)(i1)

        let i2 = arc4random() % 6 + 1
        imageName = String(i2 * 111) + ".png"
        diceImage2.image = UIImage(named: imageName!)

        diceNumArr[1] = (Int)(i2)

        let i3 = arc4random() % 6 + 1
        imageName = String(i3 * 111)
        diceImage3.image = UIImage(named: imageName!)

        diceNumArr[2] = (Int)(i3)

        imageNumber += 1
        if imageNumber > 20 {

            timer?.invalidate()
            imageNumber = 0

            judgeResult()
        }
    }
    
    func start() {
        // 需要定时器来控制切换图片
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
    }
    
    @IBAction func BuyBig(_ sender: Any) {
        selectType = .Big
        start()
    }
    
    @IBAction func BuySame(_ sender: Any) {
        selectType = .Same
        start()
    }
    
    @IBAction func BuySmall(_ sender: Any) {
        selectType = .Small
        start()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

