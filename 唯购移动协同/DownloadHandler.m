//
//  DownloadHandler.m
//  DownloadHandler
//
//  Created by 阿 朱 on 12-4-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "ShowAlert.h"
#import "DownloadHandler.h"
static DownloadHandler *sharedDownloadhandler = nil;
@interface DownloadHandler()
-(NSString *)actualSavePath;//文件实际存放的路径
-(NSString *)cachesPath;//缓冲存放的地址
-(void)removeRequestFromQueue;//将方法从队列中移除
@end
@implementation DownloadHandler
{
    ASIHTTPRequest *_request;
    ASINetworkQueue *_queue;
    NSString *_pathOfTmp;
    ProgressIndicator *_progress;
    UILabel *_label;
    unsigned long long _dataSize;
//    BOOL _downloading;
}

@synthesize url = _url;
@synthesize name = _name;
@synthesize fileType = _fileType;
@synthesize savePath = _savePath;
@synthesize progress = _progress;
@synthesize delegate;
+(DownloadHandler *)sharedInstance{
    if (!sharedDownloadhandler) 
    {
        sharedDownloadhandler = [[DownloadHandler alloc] init];
    }
    return sharedDownloadhandler;
}
-(id)init
{
    if (self = [super init]) {
        if (!_queue)
        {
            _queue = [[ASINetworkQueue alloc] init];
            _queue.showAccurateProgress = YES;
            _queue.shouldCancelAllRequestsOnFailure = NO;
            [_queue go];
        }
//        _downloading = NO;
    }
    return self;
}
-(void)start
{
    for (ASIHTTPRequest *r in [_queue operations]) {
        NSString *fileName = [r.userInfo objectForKey:@"Name"];
        if ([fileName isEqualToString:_name]) {
            return;//队列中已存在特定request时，退出
        }
    }
    NSURL *url = [NSURL URLWithString:_url];
    NSLog(@"%@",_url);
    _request = [ASIHTTPRequest requestWithURL:url];
    _request.delegate = self;
    _request.temporaryFileDownloadPath = [self cachesPath];
    _request.downloadDestinationPath = [self actualSavePath];
    _request.downloadProgressDelegate = _progress;
    _request.allowResumeForFileDownloads = YES;
    _request.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:_name, @"Name", nil];
    [_queue addOperation:_request];
}
-(NSString *)actualSavePath
{
    return [_savePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", _name, _fileType]];
}
-(NSString *)cachesPath
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    path = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", _name, _fileType]];
    return path;
}
-(void)request:(ASIHTTPRequest *)request didReceiveResponseHeaders:(NSDictionary *)responseHeaders
{
    NSLog(@"total size: %lld", request.contentLength);
    _progress.totalSize = request.contentLength/1024.0/1024.0;
}
-(void)requestStarted:(ASIHTTPRequest *)request
{
    
}
-(void)requestFinished:(ASIHTTPRequest *)request
{
    if ([_fileType isEqualToString:@"zip"]) 
    {
       // [self unzipFile];
    }
    [self.delegate passDownLoadInfoDt:[self actualSavePath]];
    [self removeRequestFromQueue];
//    _downloading = NO;
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    NSLog(@"download failed, error: %@", error);
    [self.delegate passDownLoadInfoDt:@"false"];
    [self removeRequestFromQueue];
//    _downloading = NO;

}
-(void)removeRequestFromQueue
{
    for (ASIHTTPRequest *r in [_queue operations])
    {
        NSString *fileName = [r.userInfo objectForKey:@"Name"];
        if ([fileName isEqualToString:_name]) 
        {
            [r clearDelegatesAndCancel];
        }
    }
    
}

-(void)dealloc{
    [_queue release];
    _queue = nil;
    [_progress release];
    _progress = nil;
    [_label release];
    _label = nil;
    [super dealloc];
}
@end
