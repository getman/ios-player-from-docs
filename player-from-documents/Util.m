//
//  Util.m
//  player-from-documents
//
//  Created by parfenov on 5/16/16.
//  Copyright © 2016 parfenov. All rights reserved.
//

#import "Util.h"
#import "PlayerRootView.h"
#import "Mp3Metadata.h"
#import <AVFoundation/AVFoundation.h>


@implementation Util

/**returns an index of the substring occcurrence by occurrence count
 @returns index of counted occurrence, -1 if there is no any occurrences*/
+(int) getStringOccurence:(NSString*)targetString substring:(NSString*) substring occurrenceCount:(int) occurCount{
    NSRange searchRange = NSMakeRange(0,targetString.length);
    NSRange foundRange;
    int occurrenceIndex = 0;
    while (searchRange.location < targetString.length) {
        searchRange.length = targetString.length-searchRange.location;
        foundRange = [targetString rangeOfString:substring options:nil range:searchRange];
        if (foundRange.location != NSNotFound) {
            // found an occurrence of the substring! do stuff here
            if (occurrenceIndex == occurCount) {
                return foundRange.location;
            }
            occurrenceIndex++;
            searchRange.location = foundRange.location+foundRange.length;

        } else {
            // no more substring to find
            break;
        }
    }
    return -1;
}

/**mp3FilePath - full mp3 file name*/
+(id) loadMp3Metadata: (NSString*) mp3FilePath {
    //getting the URL by file name
    NSURL *fileURL = [NSURL fileURLWithPath: mp3FilePath];
    AVAsset* asset = [AVURLAsset URLAssetWithURL:fileURL options:nil];
    NSArray *metadata = [asset commonMetadata];
    Mp3Metadata* mp3Metadata = [[Mp3Metadata alloc] init];
    
    for (NSString *format in [asset availableMetadataFormats]) {
        for (AVMetadataItem *item in [asset metadataForFormat:format]) {
            if ([[item commonKey] isEqualToString:@"title"]) {
                mp3Metadata.trackName = (NSString *)[item value];
            }
            if ([[item commonKey] isEqualToString:@"artist"]) {
                mp3Metadata.author = (NSString *)[item value];
            }
            
            if ([[item commonKey] isEqualToString:@"creator"]) {
            }
            
            if ([[item commonKey] isEqualToString:@"ambient"]) {}
            if ([[item commonKey] isEqualToString:@"album"]) {}
            if ([[item commonKey] isEqualToString:@"ambient"]) {}
            
//            NSLog(@" AV metadata item - key:%@ / value:%@", [item commonKey] , (NSString *)[item value]);
        }
//        NSLog(@" AV metadata format : %@", format);
    }
    
    //file size
    NSFileManager *fMngr = [NSFileManager defaultManager];
    NSDictionary *attrs = [fMngr attributesOfItemAtPath: mp3FilePath error: NULL];
    UInt32 size = [attrs fileSize];
    mp3Metadata.sizeMB = size;
    
    //detecting file extension
    NSRange range = [mp3FilePath rangeOfString:@"." options:NSBackwardsSearch];
    NSString *nextFileExtension = [mp3FilePath substringFromIndex: range.location];
    mp3Metadata.ext = nextFileExtension;
    
    return mp3Metadata;
}
@end

