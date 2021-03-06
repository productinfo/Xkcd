//
//  Adapter.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit

/// A generic adapter to act as convenient DataSource and Delegate for UICollectionView
final class Adapter<T, Cell: UICollectionViewCell>: NSObject,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  var items: [T] = []
  var configure: ((T, Cell) -> Void)?
  var select: ((T) -> Void)?
  var display: ((T, IndexPath) -> Void)?
  var size: ((CGSize) -> CGSize)?

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let item = items[indexPath.item]

    let cell: Cell = collectionView.dequeue(indexPath: indexPath)
    configure?(item, cell)
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let item = items[indexPath.item]
    select?(item)
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath) -> CGSize {

    if let size = self.size {
      return size(collectionView.frame.size)
    } else {
      return CGSize(
        width: collectionView.frame.size.width,
        height: collectionView.frame.size.height * 0.8
      )
    }
  }

  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    guard let collectionView = scrollView as? UICollectionView else {
      fatalError()
    }

    guard let visibleIndexPath = collectionView.visibleIndexPath() else {
      return
    }

    let item = items[visibleIndexPath.item]
    display?(item, visibleIndexPath)
  }
}
