/*
 내비게이션 컨트롤러
 : 화면을 전환할 때 연관성이 없거나 데이터를 서로 주고 받아야 하는 경우에 사용. 즉, 한 주제가 이어지는 화면에 사용
 + 탭 바 컨트롤러: 각 화면이 서로 연관성이 없는 경우에 사용. 즉, 각 화면 별 주제가 있는 경우
 내비게이션 컨트롤러를 스토리보드에 추가하기 -> 해당 뷰 컨트롤러 클릭 후 [Editor/Enbed in/NavigationController]
 */
import UIKit

class NavigationViewController: UIViewController,EditDelegate {
    
    let imgOn = UIImage(named: "imgOn.jpg")
    let imgOff = UIImage(named: "imgOff.jpg")
    var isOn: Bool = true
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.image = imgOn
    }
    
    //세그웨이를 이용해 화면 전환
    //해당 세그웨이가 해당 뷰 컨트롤러로 전환되기 직전에 호출되는 함수이며 데이터 전달을 위해 사용한다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //세그웨이 도착 컨트롤러를 EditViewController 형태를 가지는 segue.destinationViewController로 선언한다.
        let editViewController = segue.destination as! EditViewController
        
        //조건에 따라 다른 문자열을 전송하여 '수정화면'의 레이블이 서로 다르게 표시되도록 한다.
        if segue.identifier == "editButton"{ //segue의 id가 "editButton"인가?
            editViewController.textWayValue = "segue :  use button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : use Bar button"
        }
        
        //수정화면으로 텍스트 메시지와 전구 상태 전달
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn //'수정화면'의 isOn에 '메인화면'은 isOn 상태를 전달한다.
        editViewController.delegate = self
    }
    
    //메시지 값을 텍스트 필드에 표시
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    //전구 이미지 값 세팅
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        }else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
}
