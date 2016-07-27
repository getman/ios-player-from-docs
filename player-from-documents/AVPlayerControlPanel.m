//
//  AVPlayerControlPanel.m
//  player-from-documents
//
//  Created by parfenov on 7/20/16.
//  Copyright © 2016 parfenov. All rights reserved.
//

#import "AVPlayerControlPanel.h"

@implementation AVPlayerControlPanel
@synthesize btnStartStop = _btnStartStop;
@synthesize volumeSlider = _volumeSlider;
@synthesize lblNowPlaying = _lblNowPlaying;


- (id)initWithFrame:(CGRect)theFrame {
    self = [super initWithFrame:theFrame];
    NSLog(@"Player control panel view loaded");
    [self loadUi];
    return self;
}

-(void) loadUi {
    NSLog(@"AVPlayerControlPanel loading...");
    //size of control panel UIView
    CGFloat selfHeight=self.bounds.size.height;
    CGFloat selfWidth=self.bounds.size.width;
    
    //creating an UISlider to control the volume
    UISlider *newsldrVolume = [[UISlider alloc] init];
    //receive the new Slider`s frame
    CGRect frmSldrVolume = newsldrVolume.frame;
    //creating a point on 70, height-25 position and designate to slider`s frame origin position
    frmSldrVolume.origin = CGPointMake(150, selfHeight - 25);
    newsldrVolume.frame = frmSldrVolume;
    
    newsldrVolume.backgroundColor = [UIColor greenColor];
    [self setVolumeSlider: newsldrVolume];
    [self addSubview:newsldrVolume];
    
    //add a button to start and stop a song
    UIButton* newBtnStartStop = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat btnTop = self.bounds.size.height;
    CGFloat btnLeft = 200;//self.bounds.size.width;
    newBtnStartStop.frame = CGRectMake(300, selfHeight - 25, 60, 25);;
    newBtnStartStop.titleLabel.text = @"1111111111111";
    [newBtnStartStop setTitle:@"|>" forState:UIControlStateNormal];
    [newBtnStartStop setBackgroundColor:[UIColor greenColor]];
    _btnStartStop = newBtnStartStop;
    [self addSubview:newBtnStartStop];
    
    //creating a label to tell what track a track is currently playing
    UILabel *lblNowPlaying = [[UILabel alloc] init];
    //receive the new label`s frame
    CGRect frmLblNowPlaying = lblNowPlaying.frame;
    NSLog(@"root view height: %f", selfHeight);
    //creating a point on 10,10 position and designate to label`s frame origin position
    frmLblNowPlaying.origin = CGPointMake(10, selfHeight - 25);
    lblNowPlaying.frame = frmLblNowPlaying;
    
    lblNowPlaying.numberOfLines = 0;
    lblNowPlaying.lineBreakMode = NSLineBreakByCharWrapping;
    lblNowPlaying.text = @"Now playing: ...";
    lblNowPlaying.backgroundColor = [UIColor redColor];
    //set width and height of label based on text size
    [lblNowPlaying sizeToFit];
    //add label to view
    [self setLblNowPlaying: lblNowPlaying];
    [self addSubview:lblNowPlaying];
    
}

@end
