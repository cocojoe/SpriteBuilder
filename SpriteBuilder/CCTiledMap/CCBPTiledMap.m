//
//  CCBPTiledMap.m
//  SpriteBuilder
//
//  Created by Martin Walsh on 12/10/14.
//
//

#import "CCBPTiledMap.h"
#import "CCDirector.h"
#import "CCDrawNode.h"
#import "CCSprite.h"
#import "SceneGraph.h"

@interface CCBPTiledMap ()
@end

@implementation CCBPTiledMap

- (id) init
{
    if ((self = [super initWithFile:@"tilemap.tmx"]))
    {
   
    }

    return self;
}


@end
