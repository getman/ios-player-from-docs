//
//  PlayerRootView.m
//  player-from-documents
//
//  Created by parfenov on 5/10/16.
//  Copyright © 2016 parfenov. All rights reserved.
//

#import "PlayerRootView.h"

@implementation PlayerRootView

@synthesize songsTblView = songsTableView;

- (id)initWithFrame:(CGRect)theFrame {
    self = [super initWithFrame:theFrame];
    NSLog(@"Player root view loaded");
    [self loadUI];
    return self;
}

-(void)loadUI {
    self.backgroundColor = [UIColor blueColor];
    
    /**creating a new table view*/
    
    //left top corner
    CGFloat x = 0;
    CGFloat y = 40;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height - 50;
    CGRect tableFrame = CGRectMake(x, y, width, height);
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:tableFrame style:UITableViewStylePlain];
    [self setSongsTblView:tableView];
    
    //setting up new table view properties
    tableView.rowHeight = 35;
    tableView.sectionFooterHeight = 22;
    tableView.sectionHeaderHeight = 22;
    tableView.scrollEnabled = YES;
    tableView.showsVerticalScrollIndicator = YES;
    tableView.userInteractionEnabled = YES;
    tableView.bounces = YES;
    
    //creating a title label for just created table view
    UILabel *label = [[UILabel alloc] init];
    
    //receive the new label`s frame
    CGRect frame = label.frame;
    //creating a point on 10,10 position and designate to label`s frame origin position
    frame.origin = CGPointMake(10, 10);
    label.frame = frame;
    
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    label.text = @"Files from the Documents folder";
    label.backgroundColor = [UIColor redColor];
    //set width and height of label based on text size
    [label sizeToFit];
    //add label to view
    [self addSubview:label];
    

}

@end
