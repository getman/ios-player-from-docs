//
//  PlayerRootView.h
//  player-from-documents
//
//  Created by parfenov on 5/10/16.
//  Copyright © 2016 parfenov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVPlayerController.h"

@interface PlayerRootView : UIView {
    /**table view with songs*/
    UITableView* _songsTableView;
    
    AVPlayerController* _playerController;
}

@property (nonatomic, strong) UITableView* songsTblView;
@property (nonatomic, strong) AVPlayerController* playerController;


@end
