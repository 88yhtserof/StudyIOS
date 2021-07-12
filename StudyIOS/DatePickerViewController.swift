/*
 데이터 피커(DataPicker): 날짜와 시간을 선택할 수 있게 해주는 객체
 종류 - 시간형/ 날짜형/ 날짜&시간/ 카운트다운형
 */

import UIKit

class DatePickerViewController: UIViewController {
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
    }
    
    //데이터피커 액션함수는 데이터 피커를 선택했을때 실행된다.
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let dataPickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd a hh:mm EEEE" //날짜가 출력될 형식 지정
        lblPickerTime.text =
            "선택시간: " + formatter.string(from: dataPickerView.date)
    }
}
