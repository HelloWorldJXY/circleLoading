//
//  ViewController.swift
//  XYCircleLoading
//
//  Created by 贾小燕 on 2017/8/19.
//  Copyright © 2017年 贾小燕. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{

    var circle: CircleLoadingView = CircleLoadingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        circle.backgroundColor = UIColor.blue
        circle.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        circle.resetLoadingViewFrame(rect: CGRect(x: 0, y: 0, width: 20, height: 20))
        view.addSubview(circle)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        circle.normalLoading()
    }

}

