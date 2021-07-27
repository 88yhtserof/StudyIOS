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
    var alamTime:String = String()
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblSelectTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //현재시간을 interval마다 갱신시켜 줄 타이머 설정
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    //데이트피커뷰가 동작할 때 호출되는 액션함수
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let selectDate = sender.date
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년MM월dd일 a hh시mm분"
        
        lblSelectTime.text = formatter.string(from: selectDate)
        alamTime = formatter.string(from: selectDate)
    }
    
    @objc func updateTime(){
        let date: NSDate = NSDate() //현재 시간을 받아오는 클래스 객체 생성
        var currentTime:String = String()
        let formatter = DateFormatter()
        let compareFormatter = DateFormatter()
        
        formatter.dateFormat = "yyyy년MM월dd일 a hh시mm분ss초"
        compareFormatter.dateFormat = "yyyy년MM월dd일 a hh시mm분"
        lblCurrentTime.text = formatter.string(from: date as Date) //현재시간 출력
        currentTime = compareFormatter.string(from: date as Date)
        
        if alamTime == currentTime {
            let alamAlert = UIAlertController(title: "알림", message: "설정된 시간입니다.", preferredStyle: UIAlertController.Style.alert)
            
            let alamAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            
            alamAlert.addAction(alamAction)
            present(alamAlert, animated: true, completion: nil)
        }
    }
}
