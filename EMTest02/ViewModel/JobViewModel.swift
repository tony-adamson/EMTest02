//
//  JobViewModel.swift
//  EMTest02
//
//  Created by Антон Адамсон on 24.04.2024.
//

import Foundation
import Alamofire
import Combine

class JobViewModel: ObservableObject {
    @Published var jobData: JobData?
    @Published var isLoading = true
    @Published var favorites: [Vacancy] = []
    private var cancellables = Set<AnyCancellable>()
    private var session: Session

    init() {
        // Настройка кеша
        let cacheSizeMemory = 500 * 1024 * 1024 // 500 MB
        let cacheSizeDisk = 500 * 1024 * 1024 // 500 MB
        let cache = URLCache(memoryCapacity: cacheSizeMemory, diskCapacity: cacheSizeDisk, diskPath: "cachedData")

        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad // Возвращать кешированные данные, иначе загружать
        configuration.urlCache = cache

        session = Session(configuration: configuration)
        
        load()
    }

    func load() {
        isLoading = true
        guard let url = URL(string: "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14") else { return }

        
        AF.request(url)
            .publishDecodable(type: JobData.self)
            .compactMap { $0.value }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Ошибка при получении данных: \(error)")
                }
                self?.isLoading = false
            }, receiveValue: { [weak self] receivedData in
                self?.jobData = receivedData
                self?.updateFavorites()
            })
            .store(in: &cancellables)
    }
    
    func updateFavorites() {
            favorites = jobData?.vacancies.filter { $0.isFavorite } ?? []
        }

    func toggleFavorite(vacancy: Vacancy) {
        guard let index = jobData?.vacancies.firstIndex(where: { $0.id == vacancy.id }) else { return }
        jobData?.vacancies[index].isFavorite.toggle() // Переключение статуса избранного
        updateFavorites()
    }
}
