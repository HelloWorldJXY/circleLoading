//
//  CircleLoadingView.swift
//  XYCircleLoading
//
//  Created by 贾小燕 on 2017/8/19.
//  Copyright © 2017年 贾小燕. All rights reserved.
//

import UIKit

class CircleLoadingView: UIView,CAAnimationDelegate{

   lazy var loadingImageView = UIImageView()
    
    
    func resetLoadingViewFrame(rect: CGRect){
        self.loadingImageView.frame = rect;
        loadingImageView.image = UIImage(named: "circle_loading")
        self.addSubview(loadingImageView)
    }
//两秒转三圈
    func normalLoading() {
        //layer动画的运行的过程：开始执行动画时，隐藏UIView原有显示layer，创建一个presentLayer，由presentlayer去执行动画，动画结束移除presentlayer，显示原有layer
        
        self.loadingImageView.isHidden = false
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")//实例化CABasicAnimation，用keyPath指定layer的属性
        animation.duration = 0.7 //动画每执行一次所需时间
        animation.repeatCount = 3 //重复次数,无限次循环是HUGE
        animation.autoreverses = false//动画结束后是否执行逆动画
        animation.fromValue = 0 //所改变属性的起始值
        animation.toValue = Double.pi*2.0 //所改变属性的终止值
        animation.isRemovedOnCompletion = false//动画结束是否移除动画效果
        animation.fillMode = "forwards"//动画停止之后返回初始状态
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)//匀速，，，，，动画样式
        animation.beginTime = CACurrentMediaTime() //如需延迟 CACurrentMediaTime() + 2
        animation.delegate = self;
        self.loadingImageView.layer.add(animation, forKey: "normalLoading")
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
        let animationKey: String =  (self.loadingImageView.layer.animationKeys()?.first)!
        if animationKey == "normalLoading" {
            self.loadingImageView.layer.removeAllAnimations()
            self.loadingImageView.isHidden = true
        }
    }

}
