//
//  HomeTabBarController.swift
//  TMDB-sample-app
//
//  Created by Amol Dumrewal on 05/04/21.
//

import Foundation
import CoreData
import SwiftUI
import SharedLibrary

class HomeTabBarController: UITabBarController {
    init(_ viewContext: NSManagedObjectContext) {
        super.init(nibName: nil, bundle: nil)
    
        TMDBRepoImpl().testWrapper(completionHandler: { result, error in
            print(result)
            print(error)
        })
        
//        TMDBRepoImpl().getPopularMovies { completion: MoviesResponseContainer?, (any Error)? in
//            println(moviesReponseContainer)
//        }
        
        let nowPlayingVC = NowPlayingViewController(viewContext)
        let savedItemsVC = SavedItemsViewController(viewContext)

        let nowPlayingTabBarItem = UITabBarItem(title: "Now Playing", image: UIImage(systemName: "play.fill"), tag: 0)
        let savedItemsTabBarItem = UITabBarItem(title: "Saved", image: UIImage(systemName: "star.fill"), tag: 1)

        nowPlayingVC.tabBarItem = nowPlayingTabBarItem
        savedItemsVC.tabBarItem = savedItemsTabBarItem
        self.viewControllers = [nowPlayingVC, savedItemsVC]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
