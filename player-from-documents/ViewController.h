//
//  ViewController.h
//  player-from-documents
//
//  Created by parfenov on 5/3/16.
//  Copyright © 2016 parfenov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> /**supported protocols*/ {
}

@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end

