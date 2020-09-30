//
//  QXHomeWaterLayout.h
//  QXHome
//
//  Created by iMac on 2020/9/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol QXHomeWaterLayoutDelegate <NSObject>

@required
- (CGFloat)collectionView:(UICollectionView *)collectionView
heightForPhotoAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface QXHomeWaterLayout : UICollectionViewLayout

@property (weak, nonatomic) id<QXHomeWaterLayoutDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
