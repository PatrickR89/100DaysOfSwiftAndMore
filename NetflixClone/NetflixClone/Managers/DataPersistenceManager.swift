//
//  DataPersistenceManager.swift
//  NetflixClone
//
//  Created by Patrick on 24.11.2022..
//

import Foundation
import UIKit
import CoreData

class DataPersistanceManager {
    static let shared = DataPersistanceManager()

    func downloadTitleWith(model: MediaObject, completion: @escaping (Result<Void, Error>) -> Void) {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let context = appDelegate.persistentContainer.viewContext

        let item = TitleItem(context: context)

        item.original_title = model.original_title
        item.id = Int64(model.id)
        item.original_name = model.original_name
        item.overview = model.overview
        item.poster_path = model.poster_path
        item.media_type = model.media_type
        item.release_date = model.release_date
        item.vote_average = model.vote_average
        item.vote_count = Int64(model.vote_count)

        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }

    func fetchItemsFromDataBase(completion: @escaping (Result<[TitleItem], Error>) -> Void) {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let context = appDelegate.persistentContainer.viewContext

        let request: NSFetchRequest<TitleItem>

        request = TitleItem.fetchRequest()

        do {

            let titles = try context.fetch(request)
            completion(.success(titles))
        } catch {
            completion(.failure(error))
        }
    }

    func deleteTitleWith(model: TitleItem, completion: @escaping (Result<Void, Error>) -> Void) {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let context = appDelegate.persistentContainer.viewContext

        context.delete(model)

        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }

    }
}
