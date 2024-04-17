//
//  MapViewController.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 3/12/24.
//

import UIKit
import MapKit
import CoreLocation

final class MapViewController: BaseViewController<MapViewModel> {
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    private let locationButton = BaseButton()
    private var isInitialRegianInit = false
    
    // MARK: - Configure
    override func setupViews() {
        super.setupViews()
        view.addSubviews(mapView, locationButton)
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
        
        locationManager.delegate = self
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
    @objc func locationButtonTapped() {
        mapView.setMapRegion(centerCoordinate: locationManager.location?.coordinate)
    }
}

// MARK: - CLLocationManagerDelegate
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        if !isInitialRegianInit {
            mapView.setMapRegion(centerCoordinate: location.coordinate)
            isInitialRegianInit = true
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
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
        let userLocationPoint = MKMapPoint(userLocation)
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
}




extension MKMapView {
    func setMapRegion(centerCoordinate: CLLocationCoordinate2D?,
                      latitudinalMeters: CLLocationDistance = 500,
                      longitudinalMeters: CLLocationDistance = 500
    ) {
        guard let centerCoordinate = centerCoordinate else { return }
        let region = MKCoordinateRegion(
            center: centerCoordinate,
            latitudinalMeters: latitudinalMeters,
            longitudinalMeters: longitudinalMeters
        )
        self.setRegion(region, animated: true)
    }
}
