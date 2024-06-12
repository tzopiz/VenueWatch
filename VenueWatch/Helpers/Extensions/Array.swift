//
//  Array.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 4/30/24.
//

import MapKit

protocol ILocation {
    var longitude: Double { get }
    var latitude: Double { get }
}

extension Array where Element == Location {
    /// Применяет алгоритм Дугласа-Пекера для сглаживания линии.
    func simplifyDouglasPeucker(tolerance: Double = 0.001) -> Array<Location> {
        guard self.count > 2 else { return [] }
        // Находим индекс точки с максимальным отклонением
        var maxDistance = 0.0, index = 0
        let end = self.count - 1
        // FIXME: parts
        for i in 1..<end {
            let distance = perpendicularDistance(from: self[i], to: (self[0], self[end]))
            if distance > maxDistance {
                maxDistance = distance
                index = i
            }
        }
        
        // Если максимальное отклонение меньше заданной допустимой погрешности, возвращаем начальную и конечную точки
        if maxDistance <= tolerance { return [self[0], self[end]] }
        
        // Рекурсивно сглаживаем сегменты перед и после точки с максимальным отклонением
        let left = Array(self[0...index])
        let right = Array(self[index...end])
        let simplifiedLeft = left.simplifyDouglasPeucker(tolerance: tolerance)
        let simplifiedRight = right.simplifyDouglasPeucker(tolerance: tolerance)
        
        // Объединяем сглаженные сегменты
        return Array(simplifiedLeft.dropLast()) + simplifiedRight
    }
    // MARK: - pedometer
    /// Вычисляет перпендикулярное расстояние от точки до отрезка.
    fileprivate func perpendicularDistance(
        from point: Location,
        to segment: (Location, Location)
    ) -> Double {
        let (start, end) = segment
        let dx = end.longitude - start.longitude
        let dy = end.latitude - start.latitude
        let mag = dx * dx + dy * dy
        let u = ((point.longitude - start.longitude) * dx + (point.latitude - start.latitude) * dy) / mag
        let x = start.longitude + u * dx
        let y = start.latitude + u * dy
        let dx2 = x - point.longitude
        let dy2 = y - point.latitude
        return sqrt(dx2 * dx2 + dy2 * dy2)
    }
}
