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
                                        UIImagePickerControllerDelegate {//델리게이트 프로토콜 추가
    @IBOutlet var imgView: UIImageView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController() //UIImagePickerController의 인스턴스 변수 생성
    var captureImage: UIImage! //촬영을 하거나 포토 라이브러리에서 불러온 사진(Image)을 저장할 변수
    var videoURL: URL!  //녹화한 비디오의 URL을 저장할 변수
    var flagImageSave = false //이미지 저장 여부를 나타낼 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //카메라를 사용해 사진을 촬영하고 포토 라이브러리에 저장하는 코드 작성
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        //카메라 사용 가능 여부를 확인
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            flagImageSave = true //이미지 저장 허용
            
            imagePicker.delegate = self //imagePicker의 delegate, 즉 대표자를 self로 설정한다.
            //CameraPhotoLibraryViewController()와 self의 차이, 약한 참조(weak)와 강한 참조(strong) 차이 공부하기
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false //편집 불허
            
            present(imagePicker, animated: true, completion: nil)
        }
        else{//카메라를 사용할 수 없는 경우 경고 창을 나타낸다
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    
    //사진 불러오기 기능
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        //포토 라이브러리의 사용 가능 여부를 확인
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
    
    //카메라를 사용해 비디오를 촬영하고 포토 라이브러에 저장하는 코드
    @IBAction func btnRecordVideoCamera(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        else{//카메라를 사용할 수 없는 경우 경고 창을 나타낸다
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    
    //포토 라이브러리에서 비디오를 불러오는 코드
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
    
    //사용자가 사진이나 비디오를 촬영할거나 포토 라이브러리에서 선택이 끝냈을 때 호출하는 didFinishPickingMediaWithInfo 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString //미디어 종류 확인
        
        if mediaType.isEqual(to: kUTTypeImage as NSString as String) { //미디어 종류가 사진(image)일 경우
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage //사진을 가져와 captureImage에 저장한다.
            
            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil) //가져온 사진을 포토 라이브러리에 저장한다.
            }
            
            imgView.image = captureImage //imgView에 촬영한, 선택한 사진을 할당한다.
        }
        else if mediaType.isEqual(to: kUTTypeMovie as NSString as String) {
            if flagImageSave {
                //촬영한 비디오를 가져와 포토 라이브러리에 저장한다.
                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)
                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)
            }
        }
        
        self.dismiss(animated: true, completion: nil)
        //Dismisses the view controller that was presented modally by the view controller.
        //뷰 컨트롤러에 모달 형식으로 보여지고 있는 뷰 컨트롤러를 제거한다.
        //즉 이미지 피커 화면을 제거하고 초기 화면을 보여준다.
    }
    
    //사진, 비디오 촬영이나 선택을 취소했을 때 호출되는 델리게이트 메서드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //문제가 생겼을 때 화면에 표시해 줄 경고 표시용 메서드
    func myAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: UIAlertController.Style.alert) //경고를 alert 형식 또는 actionSheet 형식으로 보여준다.
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil) //completion: present를 보여주고 난 후 할 동작
        
    }
}
