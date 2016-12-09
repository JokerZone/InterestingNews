//
//  ZYUserDefaults.h
//  InterestingNews
//
//  Created by m n on 16/11/22.
//  Copyright © 2016年 m n. All rights reserved.
//

#ifndef ZYUserDefaults_h
#define ZYUserDefaults_h


#define BaseURL(string,string2) [NSString stringWithFormat:@"http://api.1sapp.com/%@?OSVersion=10.0.2&deviceCode=00000000-0000-0000-0000-000000000000&dtu=100&lat=30.58342714905195&lon=103.9878802142734&network=WIFI&%@", string,string2]


#define ZYUserDefaults [NSUserDefaults standardUserDefaults]

#define ZYData2String(data) [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]


#endif /* ZYUserDefaults_h */
