//
//  AmidaSettings.h
//  Amida
//
//  Created by Buggy on 11/04/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AmidaSettings : NSObject
{
    NSString *_identifier;
    NSString *_title;
    NSInteger _choice;
    NSMutableArray *_icons;

}

@property (nonatomic, readonly) NSString *identifier;
@property (nonatomic, retain) NSString *title;
@property NSInteger choice;
@property (nonatomic, readonly) NSMutableArray *icons;

- (void)save;
- (void)load;

@end
