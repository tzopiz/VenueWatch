//
//  CoreDataManager.swift
//  VenueWatch
//
//  Created by Дмитрий Корчагин on 4/30/24.
//

import UIKit
import CoreData
import MapKit
import BackgroundTasks

final class CoreDataManager: NSObject {
    
    static let shared = CoreDataManager()
    private override init() { }
    
    private var appDelegate: AppDelegate { UIApplication.shared.delegate as! AppDelegate }
    private var context: NSManagedObjectContext {
        let context = appDelegate.persistentContainer.viewContext
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return context
    }
    
    /// Сохраняет изменения в контексте Core Data.
    func save() {
        do { try context.save() }
        catch { print("Failed to save context: \(error)") }
    }
    
    // MARK: - Create
    /// Сохраняет новое местоположение в Core Data.
    /// - Parameters:
    ///   - latitude: Широта местоположения.
    ///   - longitude: Долгота местоположения.
    ///   - timestamp: Дата и время местоположения.
    func saveLocation(latitude: Double, longitude: Double, timestamp: Date?) {
        let newLocation = Location(context: context)
        newLocation.latitude = latitude
        newLocation.longitude = longitude
        newLocation.timestamp = timestamp
        save()
    }
    
    /// Сохраняет массив точек местоположения в Core Data.
    /// - Parameter locations: Массив точек местоположения для сохранения.
    func saveLocations(_ locations: Array<Location>) {
        locations.forEach { saveLocation(latitude: $0.latitude, longitude: $0.longitude, timestamp: $0.timestamp) }
        save()
    }
    
    // MARK: - Read
    /// Получает сохраненные местоположения из базы данных Core Data за указанные дни.
    /// - Parameter days: Опциональные дни, за которые надо получить местоположения. Если параметр не указан, возвращаются все местоположения.
    /// - Returns: Массив объектов `Location`, представляющих сохраненные местоположения за указанные дни или все местоположения, если параметр не указан.
    func getLocations(_ days: Date...) -> Array<Location> {
        let fetchRequest: NSFetchRequest<Location> = Location.fetchRequest()
        guard !days.isEmpty else {
            do { return try CoreDataManager.shared.context.fetch(fetchRequest) }
            catch { print(error.localizedDescription) }
            return []
        }
        
        // Если переданы дни, создаем предикат для фильтрации по датам
        let calendar = Calendar.current
        let startOfDay = days.compactMap { calendar.startOfDay(for: $0) }
        let endOfDay = days.compactMap { calendar.date(byAdding: .day, value: 1, to: calendar.startOfDay(for: $0)) }
        
        // Формируем предикат для выборки местоположений за указанные дни
        let predicate = NSPredicate(
            format: "(timestamp >= %@) AND (timestamp < %@)",
            argumentArray: [startOfDay.min() as Any, endOfDay.max() as Any]
        )
        fetchRequest.predicate = predicate
        
        do { return try CoreDataManager.shared.context.fetch(fetchRequest) }
        catch {
            print("Failed to fetch locations: \(error)")
            return []
        }
    }
    
    // MARK: - Delete
    /// Удаляет все точки местоположения за указанный день из Core Data.
    /// - Parameter day: День, за который нужно удалить точки местоположения.
    func deleteLocations(for day: Date) {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: day)
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
        
        let fetchRequest: NSFetchRequest<Location> = Location.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "(timestamp >= %@) AND (timestamp < %@)", startOfDay as NSDate, endOfDay as NSDate)
        
        do {
            let locations = try context.fetch(fetchRequest)
            locations.forEach { context.delete($0) }
            save()
        } catch {
            print("Error deleting locations for day: \(error)")
        }
    }
}
