/*
 1. 레이아웃 작성
 2. 아울렛 변수, 액션 함수 추가
 3. 선택 날짜와 시간 출력
 4. 현재 시간 출력
 5. 현재시간과 선택 시간이 같은 때 1분동안 배경화면 빨간색이 되도록 구현
 6. 1분이 지나면 정상적인 배경화면으로 변경되도록 구현
 */

import UIKit

class MissionDatePickerViewController: UIViewController {
    
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblSelectTime: UILabel!
    
    //뷰 생성 시 호출되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    //DatePicker 선택 시 호출되는 함수
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender //인수 저장
        let formatter = DateFormatter() //DateFomatter 클래스 상수 선언
        formatter.dateFormat = "yyyy년 MM월 dd일 a hh시 mm분 EEE" //날짜 형식 지정
        
        lblSelectTime.text  = "선택 시간: " + formatter.string(from: datePickerView.date)
    }
}
