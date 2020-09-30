//
//  QXHomeController.m
//  QXHome
//
//  Created by iMac on 2020/9/29.
//

#import "QXHomeController.h"
#import "QXHomeWaterLayout.h"

@interface QXHomeController ()<UICollectionViewDataSource, QXHomeWaterLayoutDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation QXHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupCollectionView];
}

-(void)setupCollectionView {
    self.collectionView.dataSource = self;
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 12, 0, 12);
    QXHomeWaterLayout *layout = (QXHomeWaterLayout *)self.collectionView.collectionViewLayout;
    
    layout.delegate = self;
//    layout.itemSize = CGSizeMake((self.view.bounds.size.width - 3*10)/2, 300);
//    layout.minimumLineSpacing = 10;
//    layout.minimumInteritemSpacing = 1;
}

// MARK: - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 32;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"homeCellid" forIndexPath:indexPath];
    return cell;
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"QXHomeHeaderView" forIndexPath:indexPath];
//    }
    return nil;
}

#pragma mark - JXCategoryListContentViewDelegate

- (UIView *)listView {
    return self.view;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView heightForPhotoAtIndexPath:(NSIndexPath *)indexPath {
    
    int x = arc4random() % 2;
    return x == 0 ? 300 : 250;
    
}

@end
