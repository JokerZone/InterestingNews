//
//  ZYVidoesDataModel.h
//  InterestingNews
//
//  Created by Mac on 16/11/25.
//  Copyright © 2016年 m n. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYVidoesDataModel : NSObject
@property(nonatomic,copy)NSString *user_id;//*
@property(nonatomic,copy)NSString *source;
@property(nonatomic,copy)NSString *source_name;
@property(nonatomic,copy)NSString *source_id;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *read_count;
@property(nonatomic,copy)NSString *share_count;
@property(nonatomic,copy)NSString *comment_count;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *is_hot;
@property(nonatomic,copy)NSString *is_top;
@property(nonatomic,copy)NSString *introduction;
@property(nonatomic,copy)NSArray *tag;
@property(nonatomic,copy)NSArray *cover;//图片
@property(nonatomic,copy)NSString *cover_show_type;
@property(nonatomic,copy)NSString *share_type;
@property(nonatomic,copy)NSString *can_comment;
@property(nonatomic,copy)NSString *publish_time;
@property(nonatomic,copy)NSString *content_type;
@property(nonatomic,assign)NSInteger unlike_enable;
@property(nonatomic,assign)NSInteger show_comment;
@property(nonatomic,copy)NSString *tips;
@property(nonatomic,copy)NSString *font_color;
@property(nonatomic,assign)NSInteger font_bold;
@property(nonatomic,assign)NSInteger show_time;
@property(nonatomic,assign)BOOL is_favorite;
@end
