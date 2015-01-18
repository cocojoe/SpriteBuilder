//
//  CCBPTiledMap.m
//  SpriteBuilder
//
//  Created by Martin Walsh on 05/01/2015
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

- (void) addTileMapWithXMLData:(NSString *)xmlData resourcePath:(NSString*)resourcePath
{
    [self removeAllChildrenWithCleanup:YES];
    
    if (xmlData)
    {
        _tileMap = [CCTiledMap tiledMapWithXML:xmlData resourcePath:resourcePath];
        [self addChild:_tileMap];
    }
    
}

@end
