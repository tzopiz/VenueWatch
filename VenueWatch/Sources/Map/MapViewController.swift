//
//  MapViewController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit
import MapKit
import CoreLocation
import CoreMotion

final class MapViewController: BaseViewController<MapViewModel> {
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    private let locationButton = BaseButton()
    private let motionManager = CMMotionManager()
    
    private var initialDeviceAngle: Double = 0
    private var isInitialRegianInit = false
    private var isDeviceMotionTracking = false
    
    // MARK: - Configure
    override func setupViews() {
        super.setupViews()
        view.addSubviews(mapView)
        mapView.addSubviews(locationButton)
    }
    override func layoutViews() {
        super.layoutViews()
        mapView.snp.makeConstraints { $0.edges.equalToSuperview() }
        locationButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-16)
            make.width.height.equalTo(64)
        }
    }
    override func configureViews() {
        super.configureViews()
        
        navigationController?.navigationBar.isHidden = true
        
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.addTapGesture(tapNumber: 1, target: self, action: #selector(mapViewTapped))
        
        locationManager.delegate = self
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        locationButton.layer.cornerRadius = 32
        locationButton.backgroundColor = App.Color.systemBackground
        locationButton.setImage(App.Image.location, for: .normal)
        locationButton.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
        
    }
}

// MARK: - Actions
extension MapViewController {
    @IBAction func locationButtonTapped() {
        // FIXME: - no work when marker show on map
        // stop udating after user rotating a screen
        isDeviceMotionTracking ? stopUpdatingDeviceDirection() : startUpdatingDeviceDirection()
        mapView.setMapRegion(centerCoordinate: locationManager.location?.coordinate)
        print(#function, isDeviceMotionTracking)
    }
    @IBAction func mapViewTapped() {
        stopUpdatingDeviceDirection()
        print(#function, isDeviceMotionTracking)
    }
}

// MARK: - CLLocationManagerDelegate
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        if !isInitialRegianInit {
            mapView.setMapRegion(centerCoordinate: location.coordinate)
            isInitialRegianInit = true
        }
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        let timestamp = Date()
        
        CoreDataManager.shared.saveLocation(
            latitude: latitude,
            longitude: longitude,
            timestamp: timestamp
        )
        
        let calendar = Calendar.current
        let day = calendar.date(byAdding: .day, value: 0, to: Date())
        let locations = CoreDataManager.shared.getLocations(day ?? Date())
        
        mapView.drawPolylineOnMap(for: locations)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Utilities.Alert.showAlert(
            self,
            title: "Location Error",
            message: "Failed to find your location. Please make sure location services are enabled and try again."
        )
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // Handle authorization status changes
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            // Location access authorized, start updating location
            manager.startUpdatingLocation()
        case .denied, .restricted:
            // Location access denied or restricted, show alert
            Utilities.Alert.showAlert(
                self,
                title: "Location Access Denied",
                message: "Please enable location access in Settings to use this feature."
            )
        case .notDetermined:
            // Location access not determined, request authorization
            manager.requestWhenInUseAuthorization()
        case .authorizedAlways:
            // For this case, you may want to handle it according to your app's logic
            break
        @unknown default:
            break
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        guard let userLocation = locationManager.location?.coordinate else { return }
        
        // Проверяем, находится ли местоположение пользователя в видимой области карты
        let userLocationCoordinate = mapView.convert(userLocation, toPointTo: mapView)
        let userLocationCGRect = CGRect(origin: userLocationCoordinate, size: CGSize(width: 1, height: 1))
        let isUserLocationVisible = mapView.point(inside: userLocationCGRect.origin, with: nil)
        
        var image: UIImage?
        if isUserLocationVisible {
            image = mapView.camera.heading == 0 ? App.Image.locationNorthFill : App.Image.locationFill
        } else {
            image = mapView.camera.heading == 0 ? App.Image.locationNorth : App.Image.location
        }
        
        UIView.transition(with: locationButton, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.locationButton.alpha = 0.2
            self.locationButton.setImage(image, for: .normal)
            self.locationButton.alpha = 1.0
        }, completion: nil)
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = UIColor.blue
            renderer.lineWidth = 3
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}

extension MapViewController {
    private func startUpdatingDeviceDirection() {
        if motionManager.isDeviceMotionAvailable {
            isDeviceMotionTracking = true
            motionManager.deviceMotionUpdateInterval = 0.005
            motionManager.startDeviceMotionUpdates(to: .init()) { [weak self] (data, error) in
                guard let self = self, let attitude = data?.attitude else { return }
                let angle = self.getAngle(from: attitude)
                self.rotateMap(angle)
            }
        } else { print("isNotDeviceMotionAvailable") }
    }
    private func stopUpdatingDeviceDirection() {
        motionManager.stopDeviceMotionUpdates()
        isDeviceMotionTracking = false
    }
    private func getAngle(from attitude: CMAttitude) -> Double {
        return attitude.yaw * 180 / .pi
    }
    private func rotateMap(_ angle: Double) {
        DispatchQueue.main.async {
            self.mapView.camera.heading = angle
        }
    }
}
