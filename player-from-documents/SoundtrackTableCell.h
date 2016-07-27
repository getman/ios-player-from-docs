//
//  SoundtrackTableCellTableViewCell.h
//  player-from-documents
//
//  Created by parfenov on 5/12/16.
//  Copyright © 2016 parfenov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SoundtrackTableCell : UITableViewCell {
    //label for file extension
    UILabel* _lblFileExtension;
    //label for file size
    UILabel* _lblFileSize;
    //label for artist
    UILabel* _lblArtist;
    //label for album
    UILabel* _lblAlbum;
}

@property (nonatomic, retain) UILabel* labelFileExtension;
@property (nonatomic, retain) UILabel* labelFileSize;
@property (nonatomic, retain) UILabel* labelArtist;
@property (nonatomic, retain) UILabel* labelAlbum;

@end
