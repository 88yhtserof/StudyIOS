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
    
    //지도를 나타내기 위한 함수
    func goLocation(latitudeValue: CLLocationDegrees,
                    longitudeValue: CLLocationDegrees, dleta span : Double){
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
    }
    
    //위치가 업데이트되었을 때 지도에 위치를 나타내기 위한 함수
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let pLocation = locations.last //위치가 업데이트되면 먼저 마지막 위치 값을 찾아낸다.
        goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, dleta: 0.01)
        /*
         마지막 위치의 위도와 경도 값을 가지고 앞에서 만든 goLocation함수를 호출한다.
         이때 delta 값은 지도의 크기를 정하는데, 값이 작을 수록 확대되는 효과가 있다.
         delta를 0.01로 하였으니 1의 값보다 100배 확대해서 보여줄 것이다.
         */
        
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first //placemarks의 첫 부분만 pm 상수로 대입한다.
            let country = pm!.country //pm 상수에서 나라 값을 country에 대입한다.
            var address:String = country!// address네 country 상수에 저장된 나라 값을 대입한다.
            
            //pm 상수에 지역 값이 존배하면 address 문자열에 추가한다.
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            //pm 상수에 도로 값이 존재하면 address 문자열에 추가한다.
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
            
            //위치가 업데이트되는 것을 멈추게 한다.
            self.locationManager.stopUpdatingLocation()
            
        })
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
    }
}
