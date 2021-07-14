/*
 1. 레이아웃 작성
 2. 아울렛 변수, 액션 함수 추가
 3. 선택 날짜와 시간 출력
 4. 현재 시간 출력
 5. 현재 시간이 선택 시간되기 1분 전부터 배경화면 빨간색이 되도록 구현
 6. 1분이 지나면 정상적인 배경화면으로 변경되도록 구현
 */

import UIKit

class MissionDatePickerViewController: UIViewController {
    //타이머가 구동될 때 실행할 함수 지정
    let timeSelector: Selector = #selector(MissionDatePickerViewController.updateTime)
    let interval:Double = 1.0 // 1초 의미
    var currentTime: String = String()
    var alarmTime: String = String()
    
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
        let formatterDate = DateFormatter() //DateFomatter 클래스 상수 선언
        formatterDate.dateFormat = "yyyy년 MM월 dd일 a hh시 mm분" //날짜 형식 지정
        
        lblSelectTime.text  = formatterDate.string(from: datePickerView.date)
        alarmTime = formatterDate.string(from: datePickerView.date - 60) //알람될 시간을 저장한다.
    }
    
    //타이머가 구동될때 실행할 함수
    //기능 - 현재 시간을 갱신한다.
    //무엇을 구현해야 하는가? lblCurrentTime.text에 현재 시간을 설정해 준다.
    //필요한 것: 현재 시간을 가져와줄 클래스. NSDate 클래스를 사용한다. + 날짜 형식을 지정할 DateFomatter 클래스 사용
    @objc func updateTime(){
        let currentDate:NSDate = NSDate() //현재 시간을 가져오는 클래스
        let fomatterDate: DateFormatter = DateFormatter() // 날짜 형식을 지정해 줄 클래스
        let formatterTime = DateFormatter()
        fomatterDate.dateFormat = "yyyy년 MM월 dd일 a hh시 mm분 s초" //날짜 형식 지정
        formatterTime.dateFormat = "yyyy년 MM월 dd일 a hh시 mm분"
        
        lblCurrentTime.text = fomatterDate.string(from: currentDate as Date)
        currentTime = formatterTime.string(from: currentDate as Date)
        
        //현재 시간이 매 interval 갱신될 때마다 알람될 시간과 비교해야 하기 때문에 ,updateTime에서 compareTime 메소드 호출
        compareTime()
    }
    //#selector()의 인자로 사용될 메소드를 선언할 때 Object-C와의 호환성을 위하여 함수 앞에 @objc 키워드 필수
    
    //현재 시간과 알람 시간을 비교하는 함수
    func compareTime(){
        var backgroundColor: UIColor
        
        if(currentTime == alarmTime){
            backgroundColor = UIColor.red
        }
        else{
            backgroundColor = UIColor.white
        }
        view.backgroundColor = backgroundColor
    }
}
