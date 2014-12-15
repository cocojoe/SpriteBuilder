//
//  TiledPropertySetter.m
//  SpriteBuilder
//
//  Created by Martin Walsh on 12/12/2014.
//
//

#import "TiledPropertySetter.h"
#import "CCBGlobals.h"
#import "AppDelegate.h"
#import "ResourceManager.h"
#import "CCNode+NodeInfo.h"

@implementation TiledPropertySetter

+ (void)setTiledMapForNode:(CCNode*)node andProperty:(NSString*) prop withFile:(NSString*)tmxFileName parentSize:(CGSize)parentSize
{

    if (tmxFileName && ![tmxFileName isEqualToString:@""])
    {
        // Get absolute file path to tmx file
        NSString* tmxFileNameAbs = [[ResourceManager sharedManager] toAbsolutePath:tmxFileName];
        
        // Load TMX
        [node setValue:tmxFileNameAbs forKey:prop];
        
    }
    
}

@end
