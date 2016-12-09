//
//  RequestHardlinesAll.m
//  InterestingNews
//
//  Created by Mac on 16/11/27.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "RequestHardlinesAll.h"

@implementation RequestHardlinesAll

+(NSString *)getHardlinesPathCid:(NSInteger)cid
{
    NSString *path;
    if (cid == 255) {
        path = @"http://api.1sapp.com/content/getList?OSVersion=10.0.2&cid=255&content_type=1%2C2%2C4&deviceCode=00000000-0000-0000-0000-000000000000&dtu=100&lat=30.58344082183781&lon=103.9878902844613&max_time=1479798661625&network=WIFI&op=2&page=5&sign=0ecffd9707710f62989d0092fa69e89e&time=1479807707.518284&token=1538ScqpZFIa9oX45GLhegXONR5z4g0Y5715Dqk5_qwmWZ2G_kaB4hC-Sr2Cmxeqnm2R4MBcFXqvuqo&version=10204";
    }
    if (cid == 6) {
        path = @"http://api.1sapp.com/content/getList?OSVersion=10.0.2&cid=6&content_type=1%2C2%2C4&deviceCode=00000000-0000-0000-0000-000000000000&dtu=100&lat=30.58342000996556&lon=103.9878945983179&max_time=0&network=WIFI&op=2&page=1&sign=1f4100a04a74f06637d605fd2986c73e&time=1480046254.785976&token=f0456bMFdBmZ--_CkMdexHQWbwhjc0-VT7yW_vsgbOEFG7u6awRB5uzWMl1x6TInojg_A-841S_ml5E&version=10204";
    }
    if (cid == 5) {
        path = @"http://api.1sapp.com/content/getList?OSVersion=10.0.2&cid=5&content_type=1%2C2%2C4&deviceCode=00000000-0000-0000-0000-000000000000&dtu=100&lat=30.58342000996556&lon=103.9878945983179&max_time=0&network=WIFI&op=2&page=1&sign=a410fc3ab1d90c40c7a9fe41959beccc&time=1480046363.090856&token=f0456bMFdBmZ--_CkMdexHQWbwhjc0-VT7yW_vsgbOEFG7u6awRB5uzWMl1x6TInojg_A-841S_ml5E&version=10204";
    }
    if (cid == 2) {
        path = @"http://api.1sapp.com/content/getList?OSVersion=10.0.2&cid=2&content_type=1%2C2%2C4&deviceCode=00000000-0000-0000-0000-000000000000&dtu=100&lat=30.58342000996556&lon=103.9878945983179&max_time=0&network=WIFI&op=2&page=1&sign=3e8307e1f882ab35e1d59057451f0790&time=1480046499.954133&token=f0456bMFdBmZ--_CkMdexHQWbwhjc0-VT7yW_vsgbOEFG7u6awRB5uzWMl1x6TInojg_A-841S_ml5E&version=10204";
    }
    if (cid == 3) {
        path = @"http://api.1sapp.com/content/getList?OSVersion=10.0.2&cid=3&content_type=1%2C2%2C4&deviceCode=00000000-0000-0000-0000-000000000000&dtu=100&lat=30.58342000996556&lon=103.9878945983179&max_time=0&network=WIFI&op=2&page=1&sign=ac496efdb9fe45d075fc2cf855a10487&time=1480046530.928323&token=f0456bMFdBmZ--_CkMdexHQWbwhjc0-VT7yW_vsgbOEFG7u6awRB5uzWMl1x6TInojg_A-841S_ml5E&version=10204";
    }
    if (cid == 4) {
        path = @"http://api.1sapp.com/content/getList?OSVersion=10.0.2&cid=4&content_type=1%2C2%2C4&deviceCode=00000000-0000-0000-0000-000000000000&dtu=100&lat=30.58341086477603&lon=103.9878837660048&max_time=0&network=WIFI&op=2&page=1&sign=2052fa724839e5a66d2297a46af279f0&time=1480059461.070485&token=f0456bMFdBmZ--_CkMdexHQWbwhjc0-VT7yW_vsgbOEFG7u6awRB5uzWMl1x6TInojg_A-841S_ml5E&version=10204";
    }
    return path;
}

@end
