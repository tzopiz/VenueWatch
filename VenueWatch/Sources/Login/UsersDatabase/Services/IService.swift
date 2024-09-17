import Foundation

protocol IService {
    associatedtype ServiceResult
    func fetch(request: URLRequest)  async throws -> ServiceResult
}
