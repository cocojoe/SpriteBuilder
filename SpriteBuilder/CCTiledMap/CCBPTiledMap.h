//
//  CCBPTiledMap.h
//  SpriteBuilder
//
//  Created by Martin Walsh on 05/01/2015
//
//

#import "CCTiledMap.h"

@interface CCBPTiledMap : CCNode

@property (nonatomic,strong) CCTiledMap* tileMap;
- (void)addTileMapWithXMLData:(NSString *)xmlData resourcePath:(NSString*)resourcePath;

@end