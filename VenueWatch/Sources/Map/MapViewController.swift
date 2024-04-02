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
    
    // MARK: - Configure
    override func setupViews() {
        super.setupViews()
        view.addSubviews(mapView)
    }
    override func layoutViews() {
        super.layoutViews()
        mapView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    override func configureViews() {
        super.configureViews()
        
        navigationController?.navigationBar.isHidden = true
        
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}
