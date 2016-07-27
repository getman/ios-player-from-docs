//
//  ViewController.h
//  player-from-documents
//
//  Created by parfenov on 5/3/16.
//  Copyright © 2016 parfenov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerRootView.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> /**supported protocols*/ {
    PlayerRootView* rootView;
}

@property (nonatomic, retain) UILabel *lblFileName;
@property (nonatomic, retain) UITableView *tblView;

@end

