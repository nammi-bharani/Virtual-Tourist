//
//  PhotoCollectionViewController.swift
//  Virtual Tourist
//
//  Created by Bharani Nammi on 7/17/20.
//  Copyright © 2020 Bharani Nammi. All rights reserved.
//

import Foundation

import Foundation
import UIKit




   
class PhotoCollectionViewController: UICollectionViewController {

    // MARK: Properties
    
    // Get ahold of some villains, for the table
    // This is an array of Villain instances.
   
    // MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        collectionView.reloadData()
    }
    
    // MARK: Collection View Data Source
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
//
//        let meme: Meme = memes[indexPath.row]
//        cell.MemeImageView.image = meme.memedImage
//        //cell.cellImageView!.image = meme.memedImage
        return cell
        
        }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        
//        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
//        detailController.meme = memes[(indexPath as NSIndexPath).row]
//        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
}
