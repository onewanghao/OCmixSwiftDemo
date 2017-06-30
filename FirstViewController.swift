//
//  FirstViewController.swift
//  OCmixSwiftDemo
//
//  Created by 8891 on 09/02/2017.
//  Copyright © 2017 8891. All rights reserved.
//

import UIKit
import Firebase
import Alamofire

typealias VC  = UIViewController

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("i am from a swift class")
        self.view.backgroundColor = UIColor.blue
        let cc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TestViewController");
        cc.view.backgroundColor = UIColor.red
        self.view.addSubview(cc.view)
        
        let B:UIButton = UIButton.init(type: .custom)
        B.titleLabel?.text = "BBB"
        B.frame = CGRect(x: 100, y: 100, width: 100, height: 50);
        B.addTarget(self, action:#selector(back), for: UIControlEvents.touchUpInside)
        self.view.addSubview(B)
        
        let group = DispatchGroup.init()
        let queue = DispatchQueue.init(label: "com.8891")
        var request = Alamofire.Request
        
        for i in 0...100 {
            print("request NO.\(i)")
            Alamofire.request("https://c.8891.com.tw/api/v1/topic/search?api=2.9.1&limit=10").responseJSON { (response) in
                //             print(response)
                print("request Finish NO.\(i)")
            }
        }
        
       let listener = NetworkReachabilityManager.init()
        if let ii = (listener?.isReachableOnEthernetOrWiFi) {
            print("wifi")
            print("\(ii)");
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func requestForData(s:Int) -> String {
        return ""
    }
    
     @objc private func back() {
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
