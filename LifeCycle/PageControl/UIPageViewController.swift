//
//  UIPageViewController.swift
//  LifeCycle
//
//  Created by Admin on 27/09/22.
//

import UIKit

extension CustomPageViewController: UIPageViewControllerDataSource {
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
      let indexOfCurrentPageViewController = individualPageViewControllerList.firstIndex(of: viewController)!
    if indexOfCurrentPageViewController == 0 {
     return nil
    } else {
      
      return individualPageViewControllerList[indexOfCurrentPageViewController - 1]
    }
  }

  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
      let indexOfCurrentPageViewController = individualPageViewControllerList.firstIndex(of: viewController)!
    if indexOfCurrentPageViewController == individualPageViewControllerList.count - 1 {
      return nil
    } else {
      return individualPageViewControllerList[indexOfCurrentPageViewController + 1]
    }
  }
}
