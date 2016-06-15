//
//  defines.h
//  day03应用程序管理
//
//  Created by M-coppco on 15/12/30.
//  Copyright © 2015年 M-coppco. All rights reserved.
//

#ifndef defines_h
#define defines_h

#define ViewX(x) x.frame.origin.x
#define ViewY(x) x.frame.origin.y
#define ViewW(x) x.frame.size.width
#define ViewH(x) x.frame.size.height
#define Alert(MSG) \
{UIAlertView *alertView= [[UIAlertView alloc] initWithTitle:MSG \
message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: \
nil, nil];[alertView show];} \

#endif /* defines_h */
