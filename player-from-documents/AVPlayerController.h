//
//  AVPlayerController.h
//  player-from-documents
//
//  Created by parfenov on 7/18/16.
//  Copyright © 2016 parfenov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import "Player.h"
#import "AVPlayerControlPanel.h"

/**Represents an AVPlayer controller*/
@interface AVPlayerController : NSObject<Player> {
    /**AVPlayer to play audio tracks - MVC model*/
    AVPlayer* _player;
    /**Player panel with control buttons - MVC View*/
    AVPlayerControlPanel* _playerControlPanel;
    
}
@end
