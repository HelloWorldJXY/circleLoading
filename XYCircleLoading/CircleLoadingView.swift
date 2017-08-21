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
        self.loadingImageView.isHidden = false
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = 0.7
        animation.repeatCount = 3
        animation.autoreverses = false
        animation.fromValue = 0
        animation.toValue = Double.pi*2.0
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAMediaTimingFunctionLinear //匀速
        animation.beginTime = CACurrentMediaTime()
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
