import UIKit

class CustomPageViewController: UIPageViewController {
  var individualPageViewControllerList = [UIViewController]()
  override func viewDidLoad() {
    super.viewDidLoad()

    individualPageViewControllerList = [
        SimpleViewController.getInstance(index: 0),
        SimpleViewController.getInstance(index: 1),
        SimpleViewController.getInstance(index: 2),
        SimpleViewController.getInstance(index: 3),
    ]
      self.dataSource = self
      setViewControllers([individualPageViewControllerList[0]], direction: .forward, animated: true, completion: nil)
  }
}
