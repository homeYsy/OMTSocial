//
//  Target_MediatorError.h
//  OMTSDKRouterKit
//  Created by 864745256@qq.com on 11/13/2019.
//  Copyright (c) 2019 864745256@qq.com. All rights reserved
//

#import <Foundation/Foundation.h>

@interface Target_MediatorError : NSObject


- (id)Action_NotReturnValueWithTargetName:(NSString *)targetName actionName:(NSString *)actionName;

- (id)Action_NotTargetWithTargetName:(NSString *)targetName;

- (id)Action_NotActionWithActionName:(NSString *)actionName;

@end
