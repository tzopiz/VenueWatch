//
//  MKMapView.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 4/30/24.
//

import MapKit

extension MKMapView {
    /// Устанавливает регион отображаемой области на карте с заданным центром и размером.
    /// - Parameters:
    ///   - centerCoordinate: Центральная координата региона, которая будет отображаться в центре карты.
    ///   - latitudinalMeters: Радиус региона по широте в метрах. По умолчанию 500 метров.
    ///   - longitudinalMeters: Радиус региона по долготе в метрах. По умолчанию 500 метров.
    func setMapRegion(
        centerCoordinate: CLLocationCoordinate2D?,
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
    /// Рисует линию на карте, используя указанные местоположения.
    /// - Parameter locations: Массив объектов `Location`, содержащий местоположения для построения линии.
    func drawPolylineOnMap(for locations: Array<Location>) {
        // Преобразование объектов Location в CLLocationCoordinate2D
        let coordinates = locations.map {
            CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)
        }
        
        // Удаление существующей линии с карты, если она есть
        if let existingPolyline = overlays.first(where: { $0 is MKPolyline }) as? MKPolyline {
            removeOverlay(existingPolyline)
        }
        
        // Создание новой линии с обновленными координатами
        let polyline = MKPolyline(coordinates: coordinates, count: coordinates.count)
        addOverlay(polyline)
    }
}
