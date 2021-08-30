//
//  NavigationMissionViewController.swift
//  StudyIOS
//
//  Created by 임윤휘 on 2021/08/29.
//

import UIKit

class NavigationMissionViewController: UIViewController, EditMissionDelegate {
    
    let scale: CGFloat = 2.0
    var newWidth: CGFloat = 0.0
    var newHeight: CGFloat = 0.0
    var isZoom:Bool = true
    
    
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //해당 세그웨이가 해당 뷰 컨트롤러로 전환되기 직전에 호출되는 함수이며 데이터 전달을 위해 사용한다.
    //'메인화면'-> '수정화면' 화면 전환 및 데이터 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editMissionViewController = segue.destination as! EditMissionViewController //세그웨이의 도착 뷰 컨트롤러를 EditMissionViewController로 한다.
        editMissionViewController.textMessage = txMessage.text!
        editMissionViewController.isZoom = isZoom
        editMissionViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditMissionViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageZoomDone(_ controller: EditMissionViewController, isZoom: Bool) {
        //'메인화면'의 변수인 isZoom에 접달인자 isZoom을 할당
        if isZoom {
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            self.isZoom = true
        }else {
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            self.isZoom = false
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
