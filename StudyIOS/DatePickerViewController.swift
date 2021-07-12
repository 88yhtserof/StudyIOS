/*
 데이터 피커(DataPicker): 날짜와 시간을 선택할 수 있게 해주는 객체
 종류 - 시간형/ 날짜형/ 날짜&시간/ 카운트다운형
 
 타이머 기능: 정해진 시간에 한 번씩 설정한 함수를 실행하는 기능
 */

import UIKit

class DatePickerViewController: UIViewController {
    let timeSelector: Selector = #selector(DatePickerViewController.updateTime)//타이머가 구동되면 실행할 함수를 지정한다.
    let interval: Double = 1.0 //타이머의 간격 값. 1.0 = 1초
    var count: Int = 0 //타이머가 설정한 간격대로 실행되는지 확인하기 위한 변수
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    @IBOutlet var lblTimer: UILabel!
    
    //뷰 로드 시 호출되는 함수
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        //target : 동작될 View, selector: 타이머가 구동될 때 실행할 함수
        //현재시간에 타이머를 설정해 놓았기 때문에 interval마다 selector로 설정해 놓은 함수가 호출된다, 즉 1초마다 현재시간이 갱신된다.
    }
    
    //데이터피커 액션함수는 데이터 피커를 선택했을때 실행된다.
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let dataPickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd a hh:mm EEEE" //날짜가 출력될 형식 지정
        lblPickerTime.text =
            "선택시간: " + formatter.string(from: dataPickerView.date)
    }
    
    //타이머가 구동된 후 정해진 시간이 되었을 때 실행할 함수
    @objc func updateTime(){
        lblTimer.text = String(count)
        count+=1
        
        let date = NSDate() //현재 시간을 NSDate 함수를 사용해 가져오기
        
        let formatter = DateFormatter() //날짜를 출력하기 위해 DateFormatter 클래스의 상수 formatter 선언
        formatter.dateFormat = "yyyy-MM-dd a hh:mm:ss EEEE" //날짜 출력 형식 지정
        lblCurrentTime.text = "현재시간: "+formatter.string(from: date as Date)
    }
}
