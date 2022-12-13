import UIKit

class SimpleViewController: UIViewController {


  var index = 0
    @IBOutlet weak var titleLabel: UILabel!
        
    static func getInstance(index: Int) -> SimpleViewController {
    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SimpleViewController") as! SimpleViewController
    vc.index = index
    return vc
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    titleLabel.text = "(Page \(index))"
    view.backgroundColor = index % 2 == 0 ? .white : .systemGray
  }
}
