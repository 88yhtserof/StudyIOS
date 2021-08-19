/*
 페이지 컨트롤Page Controll
 현재 뷰에서 보여주고자 하는 내용이 여러 개일 떼 페이지를 나누어서 보여주는 기능
 */
import UIKit

class PageControlViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /*
     Event 설정은 액션 함수를 어네 실행할지를 결정하는 중요한 항목이다.
     즉, 해당 객체에서 어떠한 이벤트가 발생했을 때 액션 함수를 실행할지 선택하는 것이다.
     view changed는 페이지 컨트롤의 값이 변할 때 액션함수를 실행
     */
    @IBAction func pageChange(_ sender: UIPageControl) {
    }
}
