//
//  QXHomeWaterLayout.m
//  QXHome
//
//  Created by iMac on 2020/9/29.
//

#import "QXHomeWaterLayout.h"

@interface QXHomeWaterLayout() {
    int numberOfColumns;
    CGFloat cellPadding;
    CGFloat contentHeight;
    NSMutableArray<UICollectionViewLayoutAttributes *> *cache;
}

@end

@implementation QXHomeWaterLayout

// MARK: overwrite
- (void)prepareLayout {
    
    numberOfColumns = 2;
    cellPadding = 6;
    contentHeight = 0;
    
    cache = @[].mutableCopy;
    
    if (cache.count != 0 || self.collectionView == nil) {
        return;
    }
    
    CGFloat columnWidth = [self contentWidth] / numberOfColumns;
    NSMutableArray *xOffset = @[].mutableCopy;
    
    for (int i = 0; i < numberOfColumns; i++) {
        [xOffset addObject:@(i * columnWidth)];
    }
    
    int column = 0;
    NSMutableArray *yOffset = @[].mutableCopy;
    for (int i = 0; i < numberOfColumns; i++) {
        [yOffset addObject:@0];
    }
    for (int item = 0; item < [self.collectionView numberOfItemsInSection:0]; item = item + 1) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:item inSection:0];
        
        // 拿到高度
        CGFloat height = [self.delegate collectionView:self.collectionView heightForPhotoAtIndexPath:indexPath];
        CGRect frame = CGRectMake([xOffset[column] floatValue],
                                   [yOffset[column] floatValue],
                                  columnWidth, height);
        CGRect insetFrame = CGRectInset(frame, self->cellPadding,
                                        self->cellPadding);
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.frame = insetFrame;
        [self->cache addObject:attributes];
        
        contentHeight = contentHeight > CGRectGetMaxY(frame) ?
        contentHeight : CGRectGetMaxY(frame);
        yOffset[column] = @([yOffset[column] floatValue] + height);
        
        column = column < (numberOfColumns - 1) ? (column + 1) : 0;
    }
    
}

- (CGSize)collectionViewContentSize {
    
    return CGSizeMake([self contentWidth], contentHeight);
    
}

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray<UICollectionViewLayoutAttributes *> *visibleLayoutAttributes = @[].mutableCopy;
    
    for (UICollectionViewLayoutAttributes *attributes in self->cache) {
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            [visibleLayoutAttributes addObject:attributes];
        }
    }
    return  visibleLayoutAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return  cache[indexPath.item];
    
}


// MARK: - help property
- (CGFloat)contentWidth {
    
    if (self.collectionView == nil) { return 0; }
    UIEdgeInsets insets = self.collectionView.contentInset;
    return self.collectionView.bounds.size.width - (insets.left + insets.right);
    
}


@end
