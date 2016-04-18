//
//  PageViewController.swift
//  Pager
//
//  Created by boyankov on W16 18/04/2016 Mon.
//  Copyright © 2016 thinkaboutiter. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    // MARK: - Properties
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [
            self.newColoredViewController("Red"),
            self.newColoredViewController("Green"),
            self.newColoredViewController("Blue")
        ]
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Configuration
    
    private func newColoredViewController(color: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("\(color)ViewController")
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        return nil
    }
}
