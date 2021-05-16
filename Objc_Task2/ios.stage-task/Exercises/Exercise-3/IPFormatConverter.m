#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    if ((numbersArray == nil) || (numbersArray.count == 0)) {
        return @"";
    }
    for (NSNumber* number in numbersArray) {
        if (number.intValue > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
        if (number.intValue < 0) {
            return @"Negative numbers are not valid for input.";
        }
    }
    
    NSArray *arr1 = @[@(0), @(0), @(0)];
    NSArray* newArray = [[numbersArray mutableCopy] arrayByAddingObjectsFromArray: arr1];
    
    NSArray *ipNumbersArray = [newArray subarrayWithRange:NSMakeRange(0, 4)];
    
    NSMutableString *ipResult = [NSMutableString string];
    
    for (NSNumber* number in ipNumbersArray) {
        [ipResult appendString: [NSString stringWithFormat:@"%d.", number.intValue]];
    }
    [ipResult deleteCharactersInRange: NSMakeRange([ipResult length]-1, 1)];
    
    return ipResult;
}

@end
