//
//  ViewController.m
//  player-from-documents
//
//  Created by parfenov on 5/3/16.
//  Copyright © 2016 parfenov. All rights reserved.
//

#import "ViewController.h"
#import "PlayerRootView.h"

@interface ViewController ()

@end

@implementation ViewController

    //------Data members-------
    /**list of files from Document folder*/
    NSArray *fileList;

    //-----Methods----------
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //creating the custom view with inner table view
    PlayerRootView *rootView;
    rootView = [[PlayerRootView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = rootView;
    
    //set up delegate and datasource for table view with songs
    rootView.songsTblView.delegate = self;
    rootView.songsTblView.dataSource = self;
    
    [self.view addSubview: rootView.songsTblView];
    [self loadFiles];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**returns table`s rows amount, method from the ... protocol*/
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger tableCellCount = [fileList count];
    NSLog(@"row count: %i", tableCellCount);
    return tableCellCount;
}

/**returns table`s cell. It will be called for every data row from the data source. Method is from ... protocol
 */
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *nextTableCell;
    
    static NSString *cellIdentifier = @"HistoryCell";
    /**receive next available reusable cell frome the TableView with identifier myTableCell*/
    nextTableCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    nextTableCell.textLabel.text = @"Testing";
    
    /**received the target table cell row index*/
    NSInteger index = [indexPath row];
    
    /**let`s fill the target table cell by data*/
    
    //file name
    NSString *nextFileName = fileList[index];
    nextTableCell.textLabel.text = nextFileName;
    return nextTableCell;
}

/**Loads/reloads files from the Document folder of iTunes*/
- (void) loadFiles {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //path to the Document directory
    NSString *documentsDirectory = [paths objectAtIndex:0];
    //array of file path
    NSArray* filesAtPath = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:NULL];
    
    NSEnumerator* itr = [filesAtPath objectEnumerator];
    NSString* obj;
    while (obj = [itr nextObject]) {
        NSLog(@"doc dir: %@", obj);
    }
    
    fileList = [NSArray arrayWithArray:filesAtPath];
}
@end







