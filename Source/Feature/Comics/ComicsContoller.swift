//
//  ComicsContoller.swift
//  Xkcd
//
//  Created by khoa on 13/11/2018.
//  Copyright © 2018 onmyway133. All rights reserved.
//

import UIKit
import Anchors

final class ComicsController: UIViewController {

  private let comicService: ComicService
  private var collectionView: UICollectionView!
  private let adapter = Adapter<Either<Int, Comic>, ComicCell>()

  // MARK: - Init

  required init(comicService: ComicService) {
    self.comicService = comicService
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  // MARK: - Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    setupCollectionView()
    setupAdapter()
    loadData()
  }

  // MARK: - Setup

  private func setupCollectionView() {
    let layout = UICollectionViewLayout()
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(cellType: ComicCell.self)
    collectionView.dataSource = adapter
    collectionView.delegate = adapter

    view.addSubview(collectionView)

    activate(
      collectionView.anchor.edges
    )
  }

  private func setupAdapter() {

  }

  // MARK: - Data

  private func loadData() {

  }
}
