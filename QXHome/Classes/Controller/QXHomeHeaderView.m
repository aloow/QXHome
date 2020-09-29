//
//  QXHomeHeaderView.m
//  QXHome
//
//  Created by iMac on 2020/9/29.
//

#import "QXHomeHeaderView.h"


@implementation QXHomeHeaderView

- (void)awakeFromNib {
    
    [super awakeFromNib];
    [self setupView];
    
}

- (void)setupView {
    
    // 顶部滚动广告
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero
                                         imageNamesGroup:@[@"vip_center_mid_adv1",@"vip_center_mid_adv2"]];
    cycleScrollView.frame = self.topBannerContainView.bounds;
    cycleScrollView.delegate = self;
    cycleScrollView.autoScrollTimeInterval = 15.0;
    cycleScrollView.backgroundColor = [UIColor clearColor];
    [self.topBannerContainView addSubview:cycleScrollView];
    
    self.recommendCollectionView.dataSource = self;
    self.recommendCollectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    UICollectionViewFlowLayout *rLayout = (UICollectionViewFlowLayout *)self.recommendCollectionView.collectionViewLayout;
    rLayout.estimatedItemSize = CGSizeMake((self.bounds.size.width - 4*10)/3, 195);
    rLayout.minimumLineSpacing = 1;
    rLayout.minimumInteritemSpacing = 1;
    
    self.choiceCollectionView.dataSource = self;
    self.choiceCollectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    UICollectionViewFlowLayout *cLayout = (UICollectionViewFlowLayout *)self.choiceCollectionView.collectionViewLayout;
    cLayout.estimatedItemSize = CGSizeMake((self.bounds.size.width - 3*10)/2, 156);
    cLayout.minimumLineSpacing = 1;
    cLayout.minimumInteritemSpacing = 1;
    
    
    // 中部滚动广告
    SDCycleScrollView *bcycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero
                                         imageNamesGroup:@[@"vip_center_mid_adv1",@"vip_center_mid_adv2"]];
    bcycleScrollView.frame = self.midBannerContainView.bounds;
    bcycleScrollView.delegate = self;
    bcycleScrollView.autoScrollTimeInterval = 15.0;
    bcycleScrollView.backgroundColor = [UIColor clearColor];
    [self.midBannerContainView addSubview:bcycleScrollView];
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    
    //
    if (collectionView.tag == 111) {
        return 0;
    } else if (collectionView.tag == 112) {
        return 0;
    }
    return 0;
    
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    

    return [UICollectionViewCell new];
    
}



@end
