//
//  TiledPropertySetter.m
//  SpriteBuilder
//
//  Created by Martin Walsh on 05/01/2015
//
//

#import "TiledPropertySetter.h"
#import "CCBGlobals.h"
#import "AppDelegate.h"
#import "ResourceManager.h"
#import "CCNode+NodeInfo.h"
#import "CCBPTiledMap.h"
#import "XMLDictionary.h"
#import "CCTextureCache.h"

@implementation TiledPropertySetter

+ (void)setTiledMapForNode:(CCNode*)node andProperty:(NSString*)prop withTMXFile:(NSString*)tmxFile parentSize:(CGSize)parentSize
{
    
    if (tmxFile && ![tmxFile isEqualToString:@""])
    {
        NSString* tmxFileNameAbs = [[ResourceManager sharedManager] toAbsolutePath:tmxFile];
        
        NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:tmxFileNameAbs];
        NSMutableDictionary* tmxDict = [NSMutableDictionary dictionaryWithDictionary:[[XMLDictionaryParser sharedInstance] dictionaryWithData:xmlData]];
        
        // Grab TMX texture
        NSString* imageSource    = [[[tmxDict objectForKey:@"tileset"] objectForKey:@"image"] valueForKey:@"_source"];
        NSString* imageSourceAbs = [[ResourceManager sharedManager] toAbsolutePath:imageSource];
        NSString* resourcePath   = [imageSourceAbs stringByReplacingOccurrencesOfString:imageSource withString:@""];
        
        // Cache Texture
        [[CCTextureCache sharedTextureCache] addImage:imageSourceAbs];
        //[[CCTextureCache sharedTextureCache] dumpCachedTextureInfo];
        
        // Load TMX
        [(CCBPTiledMap*)node addTileMapWithXMLData:[[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding]
                                      resourcePath:resourcePath];
        
    }
    
}



@end