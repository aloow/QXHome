//
//  QXHomeHeaderView.h
//  QXHome
//
//  Created by iMac on 2020/9/29.
//

#import <UIKit/UIKit.h>
#import <SDCycleScrollView/SDCycleScrollView.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXHomeHeaderView : UICollectionReusableView
<SDCycleScrollViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *topBannerContainView;
// 新人推荐
@property (weak, nonatomic) IBOutlet UICollectionView *recommendCollectionView;
// 4区精选
@property (weak, nonatomic) IBOutlet UICollectionView *choiceCollectionView;

@property (weak, nonatomic) IBOutlet UIView *midBannerContainView;
@end

NS_ASSUME_NONNULL_END
