/*
 구현 순서
 1. 레이아웃 구성
 2. 아울렛 변수와 액션 함수 생성
 3. 현재 시간 출력하기 - 1초마다 현재 시간 갱신(타이머)
 4. 선택 시간 출력하기
 5. 현재 시간과 선택 시간 비교 후 알림 메세지 띄우기
 6. 알림 메세지 확인 직후 1분 동아 알림 창이 나타나지 않게 하기
 */
import UIKit

class AlertMissionViewController: UIViewController {
    
    let timeSelector: Selector = #selector(AlertMissionViewController.updateTime)//타이머가 구동되면 호출할 함수 지정
    let interval:Double = 1.0 //현재시간이 갱신될 간격
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblSelectTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //현재시간을 interval마다 갱신시켜 줄 타이머 설정
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
    }
    
    @objc func updateTime(){
        let date: NSDate = NSDate() //현재 시간을 받아오는 클래스 객체 생성
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년MM월dd일 a hh시mm분ss초"
        lblCurrentTime.text = formatter.string(from: date as Date) //현재시간 출력
    }
}
