import UIKit

class PageControlMissionViewController: UIViewController {
    @IBOutlet var lblPageIndex: UILabel!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Evemt - value Change : 페이지가 변하면 호출된다.
    @IBAction func pageChange(_ sender: UIPageControl) {
    }
}
