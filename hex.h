@implementation NSString (Hex)

+ (NSString*) hexStringWithData: (unsigned char*) data ofLength: (int) len
{
    NSMutableString *tmp = [NSMutableString string];
    for (int i=0; i<len; i++)
        [tmp appendFormat:@"%02X", data[i]];
    return [NSString stringWithString:tmp];
}

@end
