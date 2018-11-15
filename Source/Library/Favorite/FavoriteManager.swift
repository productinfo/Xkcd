//
//  FavoriteManager.swift
//  Xkcd
//
//  Created by khoa on 15/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import Foundation

/// Keep favorite information
final class FavoriteManager {
  private(set) var comics = [Comic]()

  // MARK: = Persistence

  func load() {

  }

  func save() {

  }

  // MARK: - Star

  func star(comic: Comic) {
    guard !isStarred(comic: comic) else {
      return
    }

    comics.append(comic)
  }

  func unstar(comic: Comic) {
    guard let index = comics.firstIndex(where: { $0.id == comic.id }) else {
      return
    }

    comics.remove(at: index)
  }

  /// Check if a comic is starred
  func isStarred(comic: Comic) -> Bool {
    return comics.contains(where: { $0.id == comic.id })
  }
}
