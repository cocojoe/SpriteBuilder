//
//  InspectorTMXFile.m
//  SpriteBuilder
//
//  Created by Martin Walsh on 05/01/2015
//
//

/*
 * CocosBuilder: http://www.cocosbuilder.com
 *
 * Copyright (c) 2012 Zynga Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "InspectorTMXFile.h"
#import "ResourceManager.h"
#import "ResourceManagerUtil.h"
#import "CCBGlobals.h"
#import "AppDelegate.h"
#import "CCNode+NodeInfo.h"
#import "ResourceTypes.h"
#import "RMResource.h"
#import "InspectorController.h"
#import "TiledPropertySetter.h"
#import "PositionPropertySetter.h"

@implementation InspectorTMXFile

- (void) willBeAdded
{
    NSString* sf = [selection extraPropForKey:propertyName];
    
    [ResourceManagerUtil populateResourcePopup:popup resType:kCCBResTypeTMX allowSpriteFrames:NO selectedFile:sf selectedSheet:NULL target:self];
}

- (void) selectedResource:(id)sender
{
    [[AppDelegate appDelegate] saveUndoStateWillChangeProperty:propertyName];
    
    id item = [sender representedObject];
    
    // Fetch info about the TMX file name
    NSString* tmxFile = NULL;
    RMResource* res = nil;
    
    if ([item isKindOfClass:[RMResource class]])
    {
        res = item;
        
        if (res.type == kCCBResTypeTMX)
        {
            tmxFile = [ResourceManagerUtil relativePathFromAbsolutePath:res.filePath];
            [ResourceManagerUtil setTitle:tmxFile forPopup:popup];
        }
        
    }
    
    // Set the properties and sprite frames
    if (tmxFile)
    {
        [selection setExtraProp:tmxFile forKey:propertyName];
        
        [TiledPropertySetter setTiledMapForNode:selection andProperty:propertyName withTMXFile:tmxFile parentSize:[PositionPropertySetter getParentSize:selection]];
    }
    
    [self updateAffectedProperties];
    
    // Reload the inspector
    [[InspectorController sharedController] performSelectorOnMainThread:@selector(updateInspectorFromSelection) withObject:NULL waitUntilDone:NO];
}

@end
