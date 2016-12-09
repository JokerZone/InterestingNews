//
//  RequestVieosAll.m
//  InterestingNews
//
//  Created by Mac on 16/11/25.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "RequestVieosAll.h"

@implementation RequestVieosAll

+(NSString *)getVieosPathCid:(NSInteger)cid
{
    NSString *path;
    if (cid == 255)
    {
       path = @"http://api.1sapp.com/content/getList?OSVersion=10.0.2&cid=255&content_type=3&deviceCode=00000000-0000-0000-0000-000000000000&dtu=100&lat=30.58341086477603&lon=103.9878837660048&max_time=1480058795747&network=WIFI&op=2&page=2&sign=2998801f11037749da22296fb95cc656&time=1480059608.343011&token=f0456bMFdBmZ--_CkMdexHQWbwhjc0-VT7yW_vsgbOEFG7u6awRB5uzWMl1x6TInojg_A-841S_ml5E&version=10204";
    }else if(cid == 6)
    {
        path = @"http://api.1sapp.com/content/getList?OSVersion=10.0.2&cid=6&content_type=3&deviceCode=00000000-0000-0000-0000-000000000000&dtu=100&lat=30.58341086477603&lon=103.9878837660048&max_time=0&network=WIFI&op=2&page=1&sign=0dd6a8c48670cb80392ae136470a3e02&time=1480059946.538799&token=f0456bMFdBmZ--_CkMdexHQWbwhjc0-VT7yW_vsgbOEFG7u6awRB5uzWMl1x6TInojg_A-841S_ml5E&version=10204";
    }else if(cid == 2)
    {
       path = @"http://api.1sapp.com/content/getList?OSVersion=10.0.2&cid=2&content_type=3&deviceCode=00000000-0000-0000-0000-000000000000&dtu=100&lat=30.58341086477603&lon=103.9878837660048&max_time=0&network=WIFI&op=2&page=1&sign=ff9ecf95378689c154fbee049e1b82d3&time=1480059986.396309&token=f0456bMFdBmZ--_CkMdexHQWbwhjc0-VT7yW_vsgbOEFG7u6awRB5uzWMl1x6TInojg_A-841S_ml5E&version=10204";
    }else if(cid == 1)
    {
        path = @"http://api.1sapp.com/content/getList?OSVersion=10.0.2&cid=1&content_type=3&deviceCode=00000000-0000-0000-0000-000000000000&dtu=100&lat=30.58341086477603&lon=103.9878837660048&max_time=0&network=WIFI&op=2&page=1&sign=02128a3c485a4a4312b5e8644f63ac19&time=1480060067.195588&token=f0456bMFdBmZ--_CkMdexHQWbwhjc0-VT7yW_vsgbOEFG7u6awRB5uzWMl1x6TInojg_A-841S_ml5E&version=10204";
    }else if(cid == 19)
    {
        path = @"http://api.1sapp.com/content/getList?OSVersion=10.0.2&cid=19&content_type=3&deviceCode=00000000-0000-0000-0000-000000000000&dtu=100&lat=30.58341086477603&lon=103.9878837660048&max_time=0&network=WIFI&op=2&page=1&sign=de7e76dfa25c92dc929576f78ac59dbb&time=1480060083.09433&token=f0456bMFdBmZ--_CkMdexHQWbwhjc0-VT7yW_vsgbOEFG7u6awRB5uzWMl1x6TInojg_A-841S_ml5E&version=10204";
    }else if (cid == 7)
    {
        path = @"http://api.1sapp.com/content/getList?OSVersion=10.0.2&cid=7&content_type=3&deviceCode=00000000-0000-0000-0000-000000000000&dtu=100&lat=30.58337760586942&lon=103.9879077083889&max_time=0&network=WIFI&op=2&page=1&sign=0c4c3051f37c836036b2ae2a5322b90b&time=1480325191.653327&token=25ecUKNvBR-oonDKYhcE70ZrLw4T2tw_wKjwGUgkyJhYeVcrDkG5T9XUa9pVvGmHX5mwJG1kLE8X4J8&version=10204";
    }
    
    return path;
}

@end
