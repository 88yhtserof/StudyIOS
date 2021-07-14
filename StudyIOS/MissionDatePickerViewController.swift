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
    //타이머가 구동될 때 실행할 함수 지정
    let timeSelector: Selector = #selector(MissionDatePickerViewController.updateTime)
    let interval:Double = 1.0 // 1초 의미
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblSelectTime: UILabel!
    
    //뷰 생성 시 호출되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //현재 시간이 매 interval마다 갱신되도록 타이머 설정
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    //DatePicker 선택 시 호출되는 함수
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender //인수 저장
        let formatter = DateFormatter() //DateFomatter 클래스 상수 선언
        formatter.dateFormat = "yyyy년 MM월 dd일 a hh시 mm분 EEE" //날짜 형식 지정
        
        lblSelectTime.text  = "선택 시간: " + formatter.string(from: datePickerView.date)
    }
    
    //타이머가 구동될때 실행할 함수
    //기능 - 현재 시간을 갱신한다.
    //무엇을 구현해야 하는가? lblCurrentTime.text에 현재 시간을 설정해 준다.
    //필요한 것: 현재 시간을 가져와줄 클래스. NSDate 클래스를 사용한다. + 날짜 형식을 지정할 DateFomatter 클래스 사용
    @objc func updateTime(){
        let currentDate:NSDate = NSDate() //현재 시간을 가져오는 클래스
        let fomatter: DateFormatter = DateFormatter() // 날짜 형식을 지정해 줄 클래스
        fomatter.dateFormat = "yyyy년 MM월 dd일 a hh시 mm분 EEE" //날짜 형식 지정
        
        lblCurrentTime.text = "현재 시간: " + fomatter.string(from: currentDate as Date)
    }
    //#selector()의 인자로 사용될 메소드를 선언할 때 Object-C와의 호환성을 위하여 함수 앞에 @objc 키워드 필수
}
