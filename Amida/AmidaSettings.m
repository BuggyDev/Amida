
#import "AmidaSettings.h"

@implementation AmidaSettings

@synthesize identifier = _identifier;
@synthesize title = _title;
@synthesize choice = _choice;
@synthesize icons = _icons;

- (id)init
{
    self = [super init];
    if (!self)
    {
        return nil;
    }
    
    CFUUIDRef uuid;
    uuid = CFUUIDCreate(NULL);
    _identifier = (NSString *)CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    
    //配列の初期化
    _icons = [[NSMutableArray array] retain];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
	[encoder encodeObject:_identifier forKey:@"identifier"];
	[encoder encodeObject:_title forKey:@"title"];
	[encoder encodeObject:_icons forKey:@"icons"];
    [encoder encodeInteger:_choice forKey:@"choice"];
    
    [self save];
}

- (id)initWithCoder:(NSCoder *)decoder
{
	self = [super init];
	if (!self)
	{
		return nil;
	}
		
    _identifier = [[decoder decodeObjectForKey:@"identifier"] retain];
    _title = [[decoder decodeObjectForKey:@"title"] retain];
    _choice = [decoder decodeIntegerForKey:@"choice"];
    _icons = [[decoder decodeObjectForKey:@"icons"] retain];
    
    [self load];
    
	return self;
}

//AMiIconManagerとしての働きをするためのメソッド
- (NSString *)_iconDir
{
    //ドキュメントパスを取得
    NSArray *paths;
    NSString *path;
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                NSUserDomainMask, YES);
    if ([paths count] < 1)
    {
        return nil;
    }
    path = [paths objectAtIndex:0];
    
    //.iconディレクトリへのパスを作成
    path = [path stringByAppendingPathComponent:@".icon"];
    return path;
}

- (NSString *)_iconPath
{
    //icon.datパスを作成する
    NSString *path;
    path = [[self _iconDir] stringByAppendingPathComponent:@"icon.dat"];
    return path;
}

- (void)save
{
    //ファイルマネージャを取得する
    NSFileManager *fileMgr;
    fileMgr = [NSFileManager defaultManager];
    
    //.iconディレクトリを作成する
    NSString *iconDir;
    iconDir = [self _iconDir];
    if (![fileMgr fileExistsAtPath:iconDir])
    {
        NSError *error;
        [fileMgr createDirectoryAtPath:iconDir
           withIntermediateDirectories:YES
                            attributes:nil error:&error];
    }
    
    //アイコンの配列を保存する
    NSString *iconPath;
    iconPath = [self _iconPath];
    [NSKeyedArchiver archiveRootObject:_icons toFile:iconPath];
}

- (void)load
{
    //ファイルパスを取得する
    NSString *iconPath;
    iconPath = [self _iconPath];
    if (!iconPath || ![[NSFileManager defaultManager] fileExistsAtPath:iconPath])
    {
        return;
    }
    
    //チャンネルの配列を読み込む
    NSArray *icons;
    icons = [NSKeyedUnarchiver unarchiveObjectWithFile:iconPath];
    if (!icons)
    {
        return;
    }
    
    //チャンネルの配列を設定する
    [_icons setArray:icons];
}

- (void)dealloc
{
	[_identifier release];
	[_title release];
	[_icons release];
	
	[super dealloc];
}


@end
