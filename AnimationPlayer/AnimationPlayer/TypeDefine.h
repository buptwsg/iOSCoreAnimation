//
//  TypeDefine.h
//  AnimationPlayer
//
//  Created by sulirong on 2017/1/20.
//  Copyright © 2017年 sulirong. All rights reserved.
//

#ifndef TypeDefine_h
#define TypeDefine_h

#import <UIKit/UIKit.h>

typedef void (*TestFunction)(CALayer *layer);

typedef struct {
    const char *caseTitle;
    TestFunction pFunc;
}TestCase;

#endif /* TypeDefine_h */
