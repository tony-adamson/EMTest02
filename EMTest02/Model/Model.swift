//
//  Model.swift
//  EMTest02
//
//  Created by Антон Адамсон on 24.04.2024.
//

import Foundation

struct JobData: Codable {
    var offers: [Offer]
    var vacancies: [Vacancy]
}

struct Offer: Codable {
    var id: String?
    var title: String
    var link: String
    var button: Button?

    struct Button: Codable {
        var text: String
    }
}

struct Vacancy: Codable, Identifiable {
    var id: String
    var lookingNumber: Int?
    var title: String
    var address: Address
    var company: String
    var experience: Experience
    var publishedDate: String
    var isFavorite: Bool
    var salary: Salary
    var schedules: [String]
    var appliedNumber: Int
    var description: String
    var responsibilities: String
    var questions: [String]

    struct Address: Codable {
        var town: String
        var street: String
        var house: String
    }

    struct Experience: Codable {
        var previewText: String
        var text: String
    }

    struct Salary: Codable {
        var short: String?
        var full: String
    }
}
