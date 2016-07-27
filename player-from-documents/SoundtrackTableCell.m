//
//  SoundtrackTableCellTableViewCell.m
//  player-from-documents
//
//  Created by parfenov on 5/12/16.
//  Copyright © 2016 parfenov. All rights reserved.
//

#import "SoundtrackTableCell.h"

@implementation SoundtrackTableCell
@synthesize labelFileExtension = _lblFileExtension;
@synthesize labelFileSize = _lblFileSize;
@synthesize labelArtist = _lblArtist;
@synthesize labelAlbum = _lblAlbum;


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    NSLog(@"init with reuse identifier");
    
    _lblFileExtension = [[UILabel alloc]initWithFrame:CGRectMake(150, 0, 140, 40)];//x, y, width, height
    _lblFileSize = [[UILabel alloc]initWithFrame:CGRectMake(200,0, 140, 40)];
    
    /**adding some subview elements - labels for the following printing some info*/
    [self.contentView addSubview: _lblFileExtension];
    [self.contentView addSubview: _lblFileSize];
    return self;
}

-(id)initWithCoder:(NSCoder*)aDecoder {
    NSLog(@"Construction cell.....");
    self = [super initWithCoder:aDecoder];
    if(self) {
        //Changes here after init'ing self
        NSLog(@"Construction cell..");
    }
    
    return self;
}

-(void)loadView {
    NSLog(@"load cell performed");
}
@end
