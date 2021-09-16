//
//  CameraPhotoLibraryViewController.swift
//  StudyIOS
//
//  Created by 임윤휘 on 2021/09/15.
//

/*
 UIKit: 우리가 오브젝트 라이브러리에서 추가하는 모든 객체의 클래스가 모여있다.
 MobileCoreServices: iOS에서 사용할 모든 "데이터 타입"들이 정의되어 있는 헤더 파일. 그러므로 "미디어 타입"을 사용하기 위해 필요
 */
import UIKit
import MobileCoreServices

class CameraPhotoLibraryViewController: UIViewController,
                                        UINavigationControllerDelegate,
                                        UIImagePickerControllerDelegate {
    @IBOutlet var imgView: UIImageView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController() //UIImagePickerController의 인스턴스 변수 생성
    var captureImage: UIImage! //촬영을 하거나 포토 라이브러리에서 불러온 사진(Image)을 저장할 변수
    var videoURL: URL!  //녹화한 비디오의 URL을 저장할 변수
    var flagImageSave = false //이미지 저장 여부를 나타낼 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
    }
    
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
    }
    
    @IBAction func btnRecordVideoCamera(_ sender: UIButton) {
    }
    
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
    }
}
