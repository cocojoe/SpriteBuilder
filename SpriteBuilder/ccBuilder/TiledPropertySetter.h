//
//  TiledPropertySetter.h
//  SpriteBuilder
//
//  Created by Martin Walsh on 12/12/2014.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface TiledPropertySetter : NSObject

+ (void)setTiledMapForNode:(CCNode*)node andProperty:(NSString*) prop withFile:(NSString*)tmxFileName parentSize:(CGSize)parentSize;

@end
