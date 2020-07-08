//
//  GameViewController.swift
//  DrinkIf
//
//  Created by Dmitry on 24.05.2020.
//  Copyright © 2020 Dmitry Navitski. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    private var startingScrollingOffset = CGPoint.zero
    
    var questions: [String]?
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0)
    }
}


extension GameViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let questions = questions {
            return questions.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        if let questions = questions {
            cell.question.text = questions[indexPath.row]
        }
        
        return cell
    }
}

extension GameViewController: UICollectionViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startingScrollingOffset = scrollView.contentOffset
    }
}
