import UIKit
import MapKit
//MapKit은 지도를 확대, 축소, 및 이동하는 등 지도에 관한 여러 기능을 제공한다.

class MapViewController: UIViewController, CLLocationManagerDelegate{
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    //뷰 로드 시 호출되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblLocationInfo1.text = "" //아직 위치 정보를 표시할 필요가 없으므로 공백 처리한다.
        lblLocationInfo2.text = ""
        locationManager.delegate = self //locationManager의 델리게이트(대리자)를 self로, 즉 MapViewControllerfh 설정한다.
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //정확도를 최고로 설정한다.
        //locationManager.desiredAccuracy = kCLLocationAccuracyKilometer //정확도를 가까운 킬로미터 거리까지 설정한다.
        locationManager.requestWhenInUseAuthorization() //위치 데이터를 추적하기 위해 사용자에게 승인을 요구한다.
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
    }
}
