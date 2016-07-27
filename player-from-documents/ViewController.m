//
//  ViewController.m
//  player-from-documents
//
//  Created by parfenov on 5/3/16.
//  Copyright © 2016 parfenov. All rights reserved.
//

#import "ViewController.h"
#import "PlayerRootView.h"
#import "SoundtrackTableCell.h"
#import "Util.h"
#import "Mp3Metadata.h"


@interface ViewController ()

@end

@implementation ViewController

    //-----Methods----------
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //creating the custom view with inner table view
    PlayerRootView *newRootView;
    newRootView = [[PlayerRootView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    self->rootView = newRootView;
    self.view = newRootView;
    
    //set up delegate and datasource for table view with songs
    newRootView.songsTblView.delegate = self;
    newRootView.songsTblView.dataSource = self;
    
    [self.view addSubview: newRootView.songsTblView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


/**delegate method
 called when user tapped a UITAbleCellView*/
- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    int currentRow = [indexPath row];
    NSLog(@"Table cell at index %i was tapped", currentRow);
    
    NSString* fileFullName = [[self->rootView playerController] getTrackURL:currentRow];
    NSLog(@"track is: %@", fileFullName);
    NSURL *fileURL = [NSURL fileURLWithPath: fileFullName];
    [[self->rootView playerController] addTrackToPlayer:fileURL];
    [[self->rootView playerController] playPause];
    [[self->rootView playerController] setNowPLaying:fileFullName];
    
    
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
}



/**delegeate method
 returns table`s rows amount, method from the ... protocol*/
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger tableCellCount = [[self->rootView playerController] getTrackAmount];
    NSLog(@"row count: %li", tableCellCount);
    return tableCellCount;
}

/**delegate method
 returns table`s cell. It will be called for every data row from the data source. Method is from UITableViewDataSource protocol
 */
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SoundtrackTableCell *nextTableCell;
    
    static NSString *cellIdentifier = @"mySountrackCell";
    /**receive next available reusable cell frome the TableView*/
    nextTableCell = (SoundtrackTableCell *) [self.tblView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSLog(@"reusable cell requested");
    if (nextTableCell == nil) {
        nextTableCell = [[SoundtrackTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: cellIdentifier];
        NSLog(@"new cell allocated");
    }
    
    /**received the target table cell row index*/
    NSInteger index = [indexPath row];
    
    /**let`s fill the target table cell by data*/
    
    //file name
    NSString *nextFileFullName = [[self->rootView playerController] getTrackURL: index];
    
    Mp3Metadata* nextFileMp3Metadata = (Mp3Metadata*) [Util loadMp3Metadata: nextFileFullName];
    
    [nextTableCell labelFileExtension].text = nextFileMp3Metadata.ext;
    [nextTableCell labelFileSize].text = [NSString stringWithFormat:@"%i", nextFileMp3Metadata.sizeMB];
    nextTableCell.text = nextFileMp3Metadata.trackName;
    
    return nextTableCell;
}





/**selector to react to AVPlayer notification: track has ended*/
-(void)itemDidFinishPlaying:(NSNotification *) notification {
    // Will be called when AVPlayer finishes playing playerItem
    NSLog(@"Ther track is over :(");
}

/**selector to react to AVPlayer notification - volume changed*/
- (void)volumeChanged:(NSNotification *)notification {
    float volume =
    [[[notification userInfo]
      objectForKey:@"AVSystemController_AudioVolumeNotificationParameter"]
     floatValue];
    NSLog(@"Volume changed :( %f", volume);
    // Do stuff with volume
}

@end



