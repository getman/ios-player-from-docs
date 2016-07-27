//
//  AVPlayerControlPanel.h
//  player-from-documents
//
//  Created by parfenov on 7/20/16.
//  Copyright © 2016 parfenov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AVPlayerControlPanel : UIView {
    UIButton* _btnStartStop;
    UISlider* _volumeSlider;
    UILabel* _nowPlayingLabel;
}
@property (nonatomic, retain) UIButton* btnStartStop;
@property (nonatomic, retain) UISlider* volumeSlider;
@property (nonatomic, retain) UILabel* lblNowPlaying;

@end
