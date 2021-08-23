import UIKit

class TabViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnMoveImageView(_ sender: UIButton) {
        //이 숫자는 탭 바 아이템 순서이다. 0~
        tabBarController?.selectedIndex = 1 //1-이미지 뷰 택으로 이동
    }
    
    @IBAction func btnMoveDatePickerView(_ sender: UIButton) {
        //이 숫자는 탭 바 아이템 순서이다. 0~
        tabBarController?.selectedIndex = 2 //2-데이트 피커 뷰 탭으로 이동
    }
}
