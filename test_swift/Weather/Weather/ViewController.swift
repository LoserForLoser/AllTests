//
//  ViewController.swift
//  Weather
//
//  Created by 宋朝阳 on 2018/3/10.
//  Copyright © 2018年 Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func btnPressed(sender: AnyObject) {
        print("Weather Button")
    }
    
    @IBOutlet var weatherText: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let url = URL(string: "https://www.sojson.com/open/api/weather/json.shtml?city=%E5%8C%97%E4%BA%AC")
        
        let data1: Data = try! Data.init(contentsOf: url!, options: Data.ReadingOptions.uncached)
        
        let string1 = NSString(data: data1, encoding: String.Encoding.utf8.rawValue)
        print("***",string1!,"\n")
        
        let jsonData = try! JSONSerialization.jsonObject(with: data1, options: JSONSerialization.ReadingOptions.allowFragments)
        
        var jsonDic = jsonData as? Dictionary<String, Any>
        
        let weatherInfo = jsonDic!["data"] as! NSDictionary
        print("***", weatherInfo)
        
        let city = weatherInfo.object(forKey: "quality")
        print(city!)
        
//        weatherText?.text = string1! as String
        weatherText?.text = getJSONStringFromDictionary(dictionary: weatherInfo)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// JSONString转换为字典
    ///
    /// - Parameter jsonString: <#jsonString description#>
    /// - Returns: <#return value description#>
    func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
        
        
    }
    
    /**
     字典转换为JSONString
     - parameter dictionary: 字典参数
     - returns: JSONString
     */
    func getJSONStringFromDictionary(dictionary:NSDictionary) -> String {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData!
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
        
        
    }
    
}

