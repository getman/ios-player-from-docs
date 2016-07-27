//
//  AVPlayerController.m
//  player-from-documents
//
//  Created by parfenov on 7/18/16.
//  Copyright © 2016 parfenov. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "AVPlayerController.h"

@implementation AVPlayerController
@synthesize player = _player;
@synthesize playerControlPannel = _playerControlPanel;
    //---------class local vars---------

    /**List of full paths to the played files - MVC Model*/
    NSMutableArray *fileList;

//-------methods------

-(id) initWithPanel: (CGRect) frame {
    self = [self init];
    NSLog(@"AVPlayerController initializing");
    AVPlayerControlPanel* playerControlPnl = [[AVPlayerControlPanel alloc] initWithFrame: frame];
    
    [self setPlayerControlPannel: playerControlPnl];
    //designate observer to volume slider
    [[playerControlPnl volumeSlider] addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    //designate listener for button
    [[playerControlPnl btnStartStop] addTarget:self action:@selector(buttonStartStopTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self loadFilePaths];
    return self;
}

-(void) playPause {
    if ([_player rate]) {
        [_player pause];
        NSLog(@"paused");
    } else {
        [_player play];
        NSLog(@"played");
    }
}

-(void) stop {
    //AVPlayer does not have stop method - call pause or setting up rate to 0.0
    [_player pause];
}
-(void) loadTrackList: (NSArray*) fileUrlList {}


/**Loads/reloads files from the Document folder of iTunes*/
- (void) loadFilePaths {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //path to the Document directory
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"simulator Document folder:%@", documentsDirectory);
    //array of file path
    NSArray* filesAtPath = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsDirectory error:NULL];
    
    NSEnumerator* itr = [filesAtPath objectEnumerator];
    NSString* obj;
    while (obj = [itr nextObject]) {
        
        obj = [NSString stringWithFormat: @"%@/%@/", documentsDirectory, @"/", obj];
        NSLog(@"directory content: %@", obj);
    }
    
    fileList = [[NSMutableArray alloc] init];
    
    int contentcount = [filesAtPath count];
    int i;
    
    
    for(i=0; i<contentcount; i++) {
        NSString *fileName =[filesAtPath objectAtIndex:i];
        NSString *path = [documentsDirectory stringByAppendingFormat:@"%@%@",@"/",fileName];
        [fileList addObject: path];
        NSLog(@"file list has been initialized: %i : %@", contentcount, [fileList objectAtIndex:0]);
        NSLog(path);
        if([[NSFileManager defaultManager] isDeletableFileAtPath:path]) {
        }
    }
}

- (void) addTrackToPlayer:(NSURL*)newTrackUrl {
    NSLog(@"goind to add the next track to the player");
    AVAsset *asset = [AVURLAsset URLAssetWithURL:newTrackUrl options:nil];
    AVPlayerItem *anItem = [[AVPlayerItem alloc] initWithAsset: asset];
 
    //initiate the player if it is needed
    //    if (player == nil) {
    _player = [AVPlayer playerWithPlayerItem:anItem];
    //    } else {
    //        player = [AVPlayer playerWithPlayerItem: [[AVPlayerItem alloc] initWithURL:@""]];
    //        [player replaceCurrentItemWithPlayerItem: anItem];
    //    }
    
    //with AVPlayer we need to subscribe to AVPlayerItem notifications
    // Subscribe to the AVPlayerItem's DidPlayToEndTime notification.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(volumeChanged:) name:@"AVSystemController_SystemVolumeDidChangeNotification" object:anItem];
}

/**selector - callback for volume slider
 called when the slider value changed*/
- (IBAction)sliderValueChanged:(UISlider *)sender {
    _player.volume = sender.value;
}

/**selector - callback for button which starts/stops track playing*/
- (IBAction)buttonStartStopTapped:(UIButton *)sender {
    if ([self->_player rate]) {
        [self->_player pause];
        [sender setTitle:@"||" forState:UIControlStateNormal];
        NSLog(@"paused");
    } else {
        [self->_player play];
        [sender setTitle:@"|>" forState:UIControlStateNormal];
        NSLog(@"played");
    }
}

-(int) getTrackAmount {
    return [fileList count];
}
-(NSString*) getTrackURL: (int) index {
    NSLog(@"%d track was requested", index);
    return fileList[index];
}

/***/
-(void) setNowPLaying: (NSString*) nowPlayingTrackName {
    [_playerControlPanel lblNowPlaying].text = nowPlayingTrackName;
}

@end









