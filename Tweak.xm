@interface SpringBoard : UIApplication // iOS 3 - 11
-(id)_accessibilityTopDisplay; // iOS 5 - 11
@end

@interface UIStatusBarTimeItemView : UIView // iOS 4 - 11
@end

%hook UIStatusBarTimeItemView
-(void)setVisible:(BOOL)arg1 frame:(CGRect)arg2 duration:(CGFloat)arg3 {
	BOOL isInStatusBarWindowOrInFolderContainerView = self.superview != nil && self.superview.superview != nil && self.superview.superview.superview != nil && ([self.superview.superview.superview isKindOfClass:%c(UIStatusBarWindow)] || [self.superview.superview.superview isKindOfClass:%c(SBFolderContainerView)]);
	if (isInStatusBarWindowOrInFolderContainerView) {
		/*id frontDisplay = [(SpringBoard *)[%c(SpringBoard) sharedApplication] _accessibilityTopDisplay];
		BOOL isHomescreen = frontDisplay == nil;
		BOOL isLockscreen = [frontDisplay isKindOfClass:%c(SBDashBoardViewController)] || [frontDisplay isKindOfClass:%c(SBLockscreenViewController)];
		if (isHomescreen || isLockscreen)
			arg1 = NO;*/
		arg1 = NO; // should hide all springboard status bars that are in windows or folders
	}
	%orig(arg1, arg2, arg3);
}
%end