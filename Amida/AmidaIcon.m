
#import "AmidaIcon.h"


@implementation AmidaIcon

@synthesize symbol = _symbol;
@synthesize identifier = _identifier;

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
    
    return self;    
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:_identifier forKey:@"identifier"];
    [encoder encodeObject:_symbol forKey:@"symbol"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (!self)
    {
        return nil;
    }
    
    _identifier = [[decoder decodeObjectForKey:@"identifier"] retain];
    _symbol = [[decoder decodeObjectForKey:@"symbol"] retain];
    
    return self;
}

- (void)dealloc
{
    [_identifier release];
    [_symbol release];
    
    [super dealloc];
}

@end
