//
//  ViewController.swift
//  3D Touch Demo
//
//  Created by Ossey on 2017/4/29.
//  Copyright © 2017年 Ossey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "3D Touch Demo";
        
        btn.layer.cornerRadius = btn.frame.size.width * 0.5
        btn.layer.masksToBounds = true
        btn.backgroundColor = UIColor.orange
        
        if #available(iOS 9.0, *) {
            if traitCollection.forceTouchCapability == .available {
                registerForPreviewing(with: self as UIViewControllerPreviewingDelegate, sourceView: view)
            }
        } else {
            // Fallback on earlier versions
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : UIViewControllerPreviewingDelegate {
    
    /// 按压进入预览模式
    @available(iOS 9.0, *)
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        if let preVc = presentedViewController {
            if preVc.isKind(of: MyViewController.self) {
                return nil
            }
        }
        
        let vc = MyViewController()
        vc.preferredContentSize = CGSize.init(width: 0.0, height: 380)
        return vc
    }
    
    /// 继续按压进入
    @available(iOS 9.0, *)
    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        show(viewControllerToCommit, sender: self)
    }
}

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: view.frame)
        imageView.image = UIImage(named: "IMG_2604_")
        view.addSubview(imageView)
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }
    
    
    @available(iOS 9.0, *)
    override var previewActionItems: [UIPreviewActionItem] {
        return [
            UIPreviewAction(title: "标为未读", style: .default, handler: { (previewAction, previewViewController) in
                
            }),
            
            UIPreviewAction(title: "免打扰", style: .default, handler: { (previewAction, previewViewController) in
                
            }),
            
            UIPreviewAction(title: "置顶", style: .default, handler: { (previewAction, previewViewController) in
                
            }),
            
            // destructive
            UIPreviewAction(title: "删除", style: .destructive, handler: { (previewAction, previewViewController) in
                
            })
        
        ]
    }
}

