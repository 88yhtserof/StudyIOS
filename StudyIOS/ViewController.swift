import UIKit

class ViewController: UIViewController {

    @IBOutlet var IdHello: UILabel! //출력 레이블용 아울렛 변수
    @IBOutlet var txtName: UITextField!  //이름 입력용 아울렛 변수
    
    @IBOutlet var reviewOutput: UILabel!
    @IBOutlet var reviewTxt: UITextField!
    /*
     IB는 Interface Builder의 약자로,
     @IB로 시작되는 변수나 함수는 인터페이스 빌더와 관려된 변구나 함수라는 것을 의미합니다.
     @IBOulet은 객체를 소스 코드에서 참조하기 위해 사용하는 키워드로, 주로 객체의 속성을 제어하는데 사용
     
     strong/weak : 메모리 회수 정책을 나타내는 키워드 -> 목적: 메모리 관리 이슈
     strong으로 선언된 변수는 다른 곳에서 참조하고 있을 경우 메모리에서 제거되지 않는다.
     weak으로 선언된 변수는 다른 곳에서 참조하고 있더라도 시스템이 임의적으로 메모리에서 제거할 수 있다.
     */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnSend(_ sender: UIButton) {
        //"Hello, "라는 문자열과 txtName.text의 문자열을 결합하여 IdHello.txt에 넣음
        //문자열을 합칠 때는 + 연산자를 사용한다.
        IdHello.text="Hello, "+txtName.text!
    }
    @IBAction func sendString(_ sender: UIButton) {
        reviewOutput.text="Review, "+reviewTxt.text!
        //!는 옵셔널 변수의 강제 언래핑을 의미한다.
    }
}

