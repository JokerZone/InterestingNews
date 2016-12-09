//
//  ZYOtherSetViewController.m
//  InterestingNews
//
//  Created by m n on 16/12/1.
//  Copyright © 2016年 m n. All rights reserved.
//

#import "ZYOtherSetViewController.h"

@interface ZYOtherSetViewController ()<UIWebViewDelegate,UICollectionViewDelegate,NSURLConnectionDataDelegate>

@property (nonatomic,assign) BOOL authenticated;
@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSURLRequest *request;

@end

@implementation ZYOtherSetViewController

#pragma mark -  lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
    self.publicWebView.delegate = self;
    
    self.request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.requestPath]];
    [self.publicWebView loadRequest:self.request];
    
    [self initBtnViews];
    
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark - initViews

- (void)initBtnViews{
        
    self.normalFontSizeButton.backgroundColor = [UIColor greenColor];
    self.clipNormalFontSizeView.backgroundColor = [UIColor greenColor];
    self.bigFontSizeButton.backgroundColor = [UIColor whiteColor];
    self.superBigFontSizeButton.backgroundColor = [UIColor whiteColor];
    self.clipsuperFontSizeView.backgroundColor = [UIColor whiteColor];
    
    if  (self.selectedBtnIndex == 0) {
        
        self.normalFontSizeButton.backgroundColor = [UIColor greenColor];
        self.clipNormalFontSizeView.backgroundColor = [UIColor greenColor];
        self.bigFontSizeButton.backgroundColor = [UIColor whiteColor];
        self.superBigFontSizeButton.backgroundColor = [UIColor whiteColor];
        self.clipsuperFontSizeView.backgroundColor = [UIColor whiteColor];
    }
    if (self.selectedBtnIndex == 1) {
        
        self.normalFontSizeButton.backgroundColor = [UIColor whiteColor];
        self.clipNormalFontSizeView.backgroundColor = [UIColor whiteColor];
        self.bigFontSizeButton.backgroundColor = [UIColor greenColor];
        self.superBigFontSizeButton.backgroundColor = [UIColor whiteColor];
        self.clipsuperFontSizeView.backgroundColor = [UIColor whiteColor];
    }
    if (self.selectedBtnIndex == 2) {
        
        self.normalFontSizeButton.backgroundColor = [UIColor whiteColor];
        self.clipNormalFontSizeView.backgroundColor = [UIColor whiteColor];
        self.bigFontSizeButton.backgroundColor = [UIColor whiteColor];
        self.superBigFontSizeButton.backgroundColor = [UIColor greenColor];
        self.clipsuperFontSizeView.backgroundColor = [UIColor greenColor];
    }
    
}


#pragma mark - systemDelegate

#pragma mark -- UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
{
    NSLog(@"Did start loading: %@ auth:%d", [[request URL] absoluteString], _authenticated);
    
    NSString* scheme = [[request URL] scheme];
    if ([scheme isEqualToString:@"https"]) {
        
        if (!_authenticated) {
            
            _authenticated = NO;
            
            _urlConnection = [[NSURLConnection alloc] initWithRequest:_request delegate:self];
            
            [_urlConnection start];
            
            return NO;
        }
        return YES;
    }
    return YES;
}

#pragma mark -- NURLConnection delegate

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;
{
    NSLog(@"WebController Got auth challange via NSURLConnection");
    
//    if ([challenge previousFailureCount] == 0)
//    {
//        _authenticated = YES;
//        
//        NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
//        
//        [challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
//        
//    } else
//    {
//        [[challenge sender] cancelAuthenticationChallenge:challenge];
//    }

    //另一种信任方式
    //判断是否是信任服务器证书
    if (challenge.protectionSpace.authenticationMethod ==NSURLAuthenticationMethodServerTrust)
    {
        //创建一个凭据对象
        NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
        //告诉服务器客户端信任证书
        [challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
        
    }
    
}

// We use this method is to accept an untrusted site which unfortunately we need to do, as our PVM servers are self signed.
- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

#pragma mark -- NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
{
    NSLog(@"WebController received response via NSURLConnection");
    
    // remake a webview call now that authentication has passed ok.
    _authenticated = YES;
    [self.publicWebView loadRequest:_request];
    
    // Cancel the URL connection otherwise we double up (webview + url connection, same url = no good!)
    [_urlConnection cancel];
}


#pragma mark - event response
- (IBAction)clickGoBack:(UIButton *)sender {

    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickSetNormalFontSize:(UIButton *)sender {
    
    self.selectedBtnIndex = 0;
    
    [self initBtnViews];
}

- (IBAction)clickSetBigFontSize:(UIButton *)sender {
    
    self.selectedBtnIndex = 1;
    
    [self initBtnViews];
}

- (IBAction)clickSetSuperBigFontSize:(UIButton *)sender {
    
    self.selectedBtnIndex = 2;
    
    [self initBtnViews];
}

- (IBAction)clickChangeFontSize:(UIButton *)sender {
    
    self.fontSizeBtnBlock(self.selectedBtnIndex);
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
