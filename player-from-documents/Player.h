//
//  Player.h
//  player-from-documents
//
//  Created by parfenov on 7/19/16.
//  Copyright © 2016 parfenov. All rights reserved.
//

#ifndef Player_h
#define Player_h

@protocol Player

@property id player;
@property UIView* playerControlPannel;

@optional

@required
/**Player control methods, the part of MVC Controller */

/**starts/pauses playing*/
-(void) playPause;
/**stops playing*/
-(void) stop;
/**adds a new track to play in the player and starts playing*/
-(void) addTrackToPlayer: (NSURL*) newTrackUrl;
/**performs loading all the track urls from the storage*/
-(void) loadTrackList: (NSArray*) fileUrlList;
/**returns the common amount of tracks*/
-(int) getTrackAmount;
/**update the "nowPlaying" label name*/
-(void) setNowPLaying: (NSString*) nowPlayingTrackName;
/**returns track URL by index*/
-(NSString*) getTrackURL: (int) index;
-(id) initWithPanel: (CGRect) frame;

@end

#endif /* Player_h */
