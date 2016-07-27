//
//  Mp3Metadata.h
//  player-from-documents
//
//  Created by parfenov on 7/5/16.
//  Copyright © 2016 parfenov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mp3Metadata : NSObject {
    NSString* _fileName;
    NSString* _trackName;
    NSString* _albumName;
    NSString* _author;
    NSString* _creator;
    NSString* _style;
    NSString* _ext;
    int _sizeMB;
}

@property (nonatomic, retain) NSString* fileName;
@property (nonatomic, retain) NSString* trackName;
@property (nonatomic, retain) NSString* albumName;
@property (nonatomic, retain) NSString* author;
@property (nonatomic, retain) NSString* creator;
@property (nonatomic, retain) NSString* style;
@property (nonatomic, retain) NSString* ext;
@property (nonatomic) int sizeMB;

@end
