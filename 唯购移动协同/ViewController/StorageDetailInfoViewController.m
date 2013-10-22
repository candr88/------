//
//  StorageDetailInfoViewController.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "GlobalVar.h"
#import "ShowAlert.h"
#import "DownloadHandler.h"
#import "StorageDetailInfoViewController.h"

@interface StorageDetailInfoViewController ()
-(void)downLoadFromWeb;//开始下载
-(NSString *)getPathOfDocument;//文件存放的地址
-(void)scale:(id)sender;//图片的缩放
@end
@implementation StorageDetailInfoViewController
@synthesize fileInfoArray,flag;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self handleFileArrayInfo];//处理下载文件信息
    [self judgeFolderExist];
    // Do any additional setup after loading the view from its nib.
}
-(void)handleFileArrayInfo
{
    NSArray *fileInfoTmp=[[[NSArray alloc] initWithObjects:
                          [self.fileInfoArray objectAtIndex:0],//文件的ID
                          [[[self.fileInfoArray objectAtIndex:1]componentsSeparatedByString:@"."]objectAtIndex:0],
                          //文件的名称
                          [[[self.fileInfoArray objectAtIndex:1]componentsSeparatedByString:@"."]objectAtIndex:1],
                          //文件的类型
                          nil]autorelease]; 
    self.fileInfoArray=nil;
    self.fileInfoArray=fileInfoTmp;
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.fileInfoArray=nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)dealloc//内存释放
{
    [super dealloc];
    [fileInfoArray release];

}
#pragma mark_JudgeFileExist
-(void)judgeFolderExist//每个用户都拥有自己文件夹
{
    NSString *path=[self getPathOfDocument];
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path])//判断文件夹是否存在
    {
        //文件夹存在
    }
    else
    {
        //文件夹不存在,创建一个文件夹
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    [self judgeFileExist ];
}
-(void)judgeFileExist//判断文件是否存在
{
    NSString *path=[self getPathOfDocument];
    path=[NSString stringWithFormat:@"%@/%@.%@",path,[self.fileInfoArray objectAtIndex:1],[self.fileInfoArray objectAtIndex:2]];
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path])//判断文件是否存在
    {
        //文件存在,打开本地文件
        [self judgeFileType:path];
    }
    else
    {
        _progress=[[ProgressIndicator alloc] initWithFrame:CGRectMake(0, 0, 240, 33)];
        //初始化一个进度条
        _progress.center=CGPointMake(160, 240+50/2+50);
        [self.view addSubview:_progress];
        //文件不存在,从网络上下载
        [self downLoadFromWeb];
    }

}

#pragma mark-DownLoadFile
-(void)downLoadFromWeb//从网络上下载文件
{
    NSString *url=
            @"http://wztx2007.gnway.net:8090/Common/WebStoreDownloadFile?fileid=";
    DownloadHandler *downLoadHandler=[DownloadHandler sharedInstance];
    downLoadHandler.url=
        [NSString stringWithFormat:@"%@%@",url,[self.fileInfoArray objectAtIndex:0]];
    NSLog(@"%@",downLoadHandler.url);
    downLoadHandler.fileType=[self.fileInfoArray objectAtIndex:2];
    downLoadHandler.name=[self.fileInfoArray objectAtIndex:1];
    downLoadHandler.savePath=[self getPathOfDocument];//获取文件的存放路径
    downLoadHandler.progress=_progress;
    downLoadHandler.delegate=self;
    [downLoadHandler start];//开始下载文件

}
-(NSString*)getPathOfDocument//返回存放文件的路径
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//文件的路径
    NSString *path=[paths lastObject];
    path=[NSString stringWithFormat:@"%@/%@",path,[[GlobalVar shareGlobalVar]loginId]];
    return path;
}
#pragma mark _Delegete 委托处理
-(void)passDownLoadInfoDt:(NSString *)info//委托处理
{
    if ([info isEqualToString:@"false"])
    {
        [ShowAlert showAlert:@"失败了" :@"文件下载失败"];
        [self.navigationController popViewControllerAnimated:YES];//跳转到前面的节目
        return;
    }
    else//文件下载成功
    {
        [self judgeFileType:info];//打开下载文件
    }
    //[_progress removeFromSuperview];
    
}
#pragma mark -OpenDownLoadFile
-(void)judgeFileType:(NSString *)path
{
    //图片的缩放比例
    NSArray * imageTypeArray=[[NSArray alloc]initWithObjects:   
                              @"tiff",//UIImage能支持的所有图片类型
                              @"tif",
                              @"jpg",
                              @"gif",
                              @"png",
                              @"bmp",  
                              @"bmpf",
                              @"ico",
                              @"cur",
                              @"xbm",
                              nil];
    for (int i=0; i<[imageTypeArray count]; i++)
    {
        if ([[imageTypeArray objectAtIndex:i] isEqualToString:[self.fileInfoArray objectAtIndex:2]])//判断文件类型是否UIimage能打开的
        {
            [self openImageFile:path];
            return;
        }
    }
    NSArray * officeFileType=[[NSArray alloc]initWithObjects:
                              @"doc",
                              @"xls",
                              @"txt",
                              @"pdf",
                              nil];//是否为办公类文件
    for (int i=0; i<[officeFileType count]; i++)
    {
        if ([[officeFileType objectAtIndex:i] isEqualToString:[self.fileInfoArray objectAtIndex:2]])//判断文件类型是否UIimage能打开的
        {
            [self openOfficeFile:path];//打开文件
            return;
        }    
    }
    [self unKnowFile];//未知文件类型
}

-(void)openImageFile:(NSString*)path//打开图片文件
{
    UIImage *image=[[[UIImage alloc]initWithContentsOfFile:path]autorelease];
    UIImageView *imageView=[[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)]autorelease];
    imageView.image=image;
    [self.view addSubview:imageView];
    imageView.contentMode=UIViewContentModeScaleAspectFit;//图片适应屏幕
    imageView.tag=101;//设置标签...
    flag=YES;
    UIPinchGestureRecognizer *pinGesture=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(scale:)];//添加双击图片放大的手势
    pinGesture.delegate=self;
    [self.view addGestureRecognizer:pinGesture];
    [pinGesture release];

}
-(void)openOfficeFile:(NSString *)path//打开办公文件
{
    UIWebView *webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    NSURL *url=[NSURL fileURLWithPath:path];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    [webView release];
}

-(void)unKnowFile//未知文件类型
{
    [ShowAlert showAlert:@"对不起" :@"文件类型无法识别,无法打开"];
}
#pragma mark Gesture
-(void)scale:(id)sender//图片的缩放
{
    flag=NO;
    [self.view bringSubviewToFront:[(UIPinchGestureRecognizer*)sender view]];
    //当手指离开屏幕时,将lastscale设置为1.0
    if([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded)
    {
        lastScale = 1.0;
        return;
    }
    //对图片进行缩放
    CGFloat scale = 1.0 - (lastScale - [(UIPinchGestureRecognizer*)sender scale]);
    UIImageView *imageView=(UIImageView*)[self.view viewWithTag:101];
    CGAffineTransform currentTransform = imageView.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    [imageView  setTransform:newTransform];
    lastScale = [(UIPinchGestureRecognizer*)sender scale];
   

}
//图片的拖动
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!flag)//图片在放大的情况才预许移动 
    {
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!flag)//图片在放大的情况才预许移动 
    {
        UIImageView *imageView=(UIImageView*)[self.view viewWithTag:101];
        NSArray *touchArray=[touches allObjects];
        CGPoint center=[[touchArray objectAtIndex:0] locationInView:self.view];
        imageView.center=center;
    }

}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!flag)//图片在放大的情况才预许移动 
    {
        UIImageView *imageView=(UIImageView*)[self.view viewWithTag:101];
        NSArray *touchArray=[touches allObjects];
        CGPoint center=[[touchArray objectAtIndex:0] locationInView:self.view];
        imageView.center=center;
    }

}
@end
