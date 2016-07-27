//
//  Util.h
//  player-from-documents
//
//  Created by parfenov on 5/16/16.
//  Copyright © 2016 parfenov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject
    +(int) getStringOccurence:(NSString*)targetString substring:(NSString*) substring occurrenceCount:(int) occurCount;
    +(id) loadMp3Metadata: (NSString*) mp3FilePath;
@end
