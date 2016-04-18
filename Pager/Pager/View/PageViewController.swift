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
        
        if let firstVC = self.orderedViewControllers.first {
            self.setViewControllers([firstVC],
                                    direction: .Forward,
                                    animated: true,
                                    completion: nil)
        }
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
        
        // `vcIndex`
        guard let vcIndex = self.orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        // `previousIndex`
        let previousIndex = vcIndex - 1
        
        // check on `previousIndex`
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return nil
        }
        
        // check
        guard self.orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return self.orderedViewControllers[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = self.orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let nextIndex = vcIndex + 1
        let orderedVCsCount = self.orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedVCsCount != nextIndex else {
            return nil
        }
        
        guard orderedVCsCount > nextIndex else {
            return nil
        }
        
        return self.orderedViewControllers[nextIndex]
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.orderedViewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = self.viewControllers?.first,
            firstViewControllerIndex = self.orderedViewControllers.indexOf(firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
}
