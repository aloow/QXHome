//
//  QXHomeHeaderView.m
//  QXHome
//
//  Created by iMac on 2020/9/29.
//

#import "QXHomeHeaderView.h"
#import <Masonry/Masonry.h>

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
    self.recommendCollectionView.delegate = self;
    self.recommendCollectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    UICollectionViewFlowLayout *rLayout = (UICollectionViewFlowLayout *)self.recommendCollectionView.collectionViewLayout;
    rLayout.itemSize = CGSizeMake((self.bounds.size.width - 4*10)/3, 195);
    rLayout.minimumLineSpacing = 1;
    rLayout.minimumInteritemSpacing = 1;
    
    self.choiceCollectionView.dataSource = self;
    self.choiceCollectionView.delegate = self;
    self.choiceCollectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    UICollectionViewFlowLayout *cLayout = (UICollectionViewFlowLayout *)self.choiceCollectionView.collectionViewLayout;
    cLayout.itemSize = CGSizeMake((self.bounds.size.width - 3*10)/2, 156);
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

// MARK: - UI
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    
    //
    if (collectionView.tag == 111) {
        return 6;
    } else if (collectionView.tag == 112) {
        return 2;
    }
    return 0;
    
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (collectionView.tag == 111) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"rcellid" forIndexPath:indexPath];
        return cell;
    } else if (collectionView.tag == 112) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ccellid" forIndexPath:indexPath];
        return cell;
    }
    return [UICollectionViewCell new];
    
}

- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath {
    // 根据cell自适应collectionView
    if (collectionView.tag == 111) {
        [self.recommendCollectionView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@(self.recommendCollectionView.contentSize.height));
        }];
    } else if (collectionView.tag == 112) {
        [self.choiceCollectionView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@(self.choiceCollectionView.contentSize.height));
        }];
    }
    
}

@end
