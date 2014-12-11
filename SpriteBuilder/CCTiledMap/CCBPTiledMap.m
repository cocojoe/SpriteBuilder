//
//  CCBPTiledMap.m
//  SpriteBuilder
//
//  Created by Martin Walsh on 12/10/14.
//
//

#import "CCBPTiledMap.h"
#import "CCBPCCBFile.h"
#import "ResourceManager.h"
#import "CCBReaderInternal.h"
#import "CCBGlobals.h"
#import "CCBDocument.h"
#import "AppDelegate.h"
#import "CCNode+NodeInfo.h"


@implementation CCBPTiledMap

- (id) init
{
    self = [super init];
    if (!self) return NULL;

    return self;
}

- (void) setTmxFile:(NSString *)tmxFile
{
    [self removeAllChildrenWithCleanup:YES];
    if (tmxFile)
    {
        _tmxFile = [CCTiledMap tiledMapWithFile:tmxFile];
        [self addChild:_tmxFile];
    }
    
}

@end
