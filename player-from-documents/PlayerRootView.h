//
//  PlayerRootView.h
//  player-from-documents
//
//  Created by parfenov on 5/10/16.
//  Copyright © 2016 parfenov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerRootView : UIView {
    /**table view with songs*/
    UITableView *songsTableView;
}

@property (nonatomic, strong) IBOutlet UITableView *songsTblView;

@end
