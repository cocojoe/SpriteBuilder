//
//  TiledPropertySetter.h
//  SpriteBuilder
//
//  Created by Martin Walsh on 05/01/2015
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface TiledPropertySetter : NSObject

+ (void)setTiledMapForNode:(CCNode*)node andProperty:(NSString*)prop withTMXFile:(NSString*)tmxFile parentSize:(CGSize)parentSize;

@end