//
//  ZYVidoesModel.h
//  InterestingNews
//
//  Created by Mac on 16/11/25.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYVidoesModel : NSObject
@property(nonatomic,copy)NSString *cid;
@property(nonatomic,copy)NSString *pv_id;
@property(nonatomic,assign)NSInteger count;
@property(nonatomic,copy)NSString *op;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,assign)NSInteger min_time;
@property(nonatomic,assign)NSInteger max_time;
@property(nonatomic,assign)NSInteger show_time;
@property(nonatomic,copy)NSArray *data;
@end
