//
//  QXHomeContainerController.m
//  QXHome
//
//  Created by iMac on 2020/9/27.
//

#import "QXHomeContainerController.h"
#import <JXCategoryView/JXCategoryView.h>
#import <YYCategories/YYCategories.h>
#import "QXHomePageController.h"
#import <Masonry/Masonry.h>
#import "QXHomeController.h"

@interface QXHomeContainerController ()
<JXCategoryViewDelegate,JXCategoryListContainerViewDelegate,
UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *titles;
@property (weak, nonatomic) IBOutlet JXCategoryTitleView *categoryView;
@property (weak, nonatomic) IBOutlet UIView *containView;

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;



@end

@implementation QXHomeContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    [self setupCategory];
    [self setupCategoryListContainerView];
}

// MARK:- Set up view
- (void)setupCategory {
    //
    self.titles = @[@"首页",@"家居",@"食品",
                    @"洗护",@"美妆",@"母婴",
                    @"电器",@"数码",@"配饰",
                    @"户外",@"办公",];
    
    self.categoryView.delegate = self;
    
    self.categoryView.titles = self.titles;
    self.categoryView.backgroundColor = [UIColor clearColor];
    self.categoryView.titleColorGradientEnabled = YES;
    self.categoryView.titleFont = [UIFont systemFontOfSize:17];
    self.categoryView.titleSelectedColor = UIColor.whiteColor;
    self.categoryView.titleColor = [UIColor colorWithHexString:@"#999999"];
    // 添加指示器
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorWidth = 10;
    lineView.indicatorColor = [UIColor whiteColor];
    lineView.lineStyle = JXCategoryIndicatorLineStyle_Lengthen;
    self.categoryView.indicators = @[lineView];
    
    
}

- (void)setupCategoryListContainerView {
    JXCategoryListContainerView *listContainerView = [[JXCategoryListContainerView alloc]
                                                  initWithType:JXCategoryListContainerType_ScrollView delegate:self];
    listContainerView.frame = self.containView.bounds;
    [self.containView addSubview:listContainerView];
    //关联到categoryView
    self.categoryView.listContainer = listContainerView;

}

// MARK:- User Touch
// 显示全部频道
- (IBAction)showAllTouch:(id)sender {
    
    if ([self.collectionView isDescendantOfView:self.view]) {
        [self.collectionView setHidden:false];
        return;
    }
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.searchBar.mas_bottom);
        make.height.equalTo(@120);
    }];
    
    // 加内边距
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 12, 0, 12);
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    
    CGFloat itemWidth = (self.view.bounds.size.width - 5*12)/4;
    flowLayout.itemSize = CGSizeMake(itemWidth, 45);
    
    flowLayout.minimumLineSpacing = 10; // 最小行间距
    flowLayout.minimumInteritemSpacing = 4; //最小元素之间的间距
    
}

// 隐藏全部频道
- (void)hidAllTouch {
    [self.collectionView setHidden:true];
}

// MARK:- JXCategoryViewDelegate
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    //侧滑手势处理
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}


// MARK:- JXCategoryListContainerViewDelegate
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView
                                          initListForIndex:(NSInteger)index {
    UIViewController *targetVC;
    if (index == 0) {
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"QXHome" bundle:bundle];
        targetVC = [sb instantiateViewControllerWithIdentifier:@"QXHomeController"];
    } else {
        targetVC = [[QXHomePageController alloc] init];
    }
    return targetVC;
}

- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titles.count;
}

// MARK:- UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.titles.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid"
                                              forIndexPath:indexPath];
    UIButton *bnt = [cell viewWithTag:101];
    [bnt setTitle:self.titles[indexPath.row] forState:UIControlStateNormal];;
    return cell;
    
}
/// 头部
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;

    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView =
        [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                           withReuseIdentifier:@"HeaderView"
                                                  forIndexPath:indexPath];
        // 隐藏按钮
        UIButton *bnt = [headerView viewWithTag:101];
        [bnt addTarget:self action:@selector(hidAllTouch)
      forControlEvents:UIControlEventTouchUpInside];
        reusableview = headerView;
    }
    return reusableview;

}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.categoryView selectItemAtIndex:indexPath.row];
    [self hidAllTouch];
}

- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@(self.collectionView.contentSize.height + 12));
        }];
    }
}


@end
