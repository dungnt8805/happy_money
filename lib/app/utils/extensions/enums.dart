part of utils;

// extension FileTypeExt on FileType {
//   bool get isVideo => this == FileType.video;

//   bool get isImage => this == FileType.image;
// }

// extension AppPermissionStatusExt on AppPermissionStatus {
//   bool get isInitializing => this == AppPermissionStatus.initializing;

//   bool get isGranted => this == AppPermissionStatus.granted;

//   bool get isUnlicensed => this == AppPermissionStatus.unlicensed;
// }

// extension MediaPickerTypeExt on MediaPickerType {
//   bool get isCamera => this == MediaPickerType.camera;

//   bool get isImage => this == MediaPickerType.image;

//   bool get isVideo => this == MediaPickerType.video;

//   bool get isCameraAndImage => this == MediaPickerType.cameraAndImage;
// }

// extension MediaSuggestionTypeExt on MediaSuggestionType {
//   bool get isForYou => this == MediaSuggestionType.forYou;

//   bool get isFollowing => this == MediaSuggestionType.following;
// }

// extension MediaTypeExt on MediaType {
//   bool get isVideo => this == MediaType.video;

//   bool get isImages => this == MediaType.images;
// }

// extension MediaProcessExt on MediaProcess {
//   bool get isWaiting => this == MediaProcess.waiting;

//   bool get isRunning => this == MediaProcess.running;

//   bool get isFinished => this == MediaProcess.finished;

//   bool get isError => this == MediaProcess.error;
// }

// extension MediaStateExt on MediaState {
//   bool get isAvailable => this == MediaState.available;

//   bool get isDeleted => this == MediaState.deleted || this == MediaState.userDeleted;

//   bool get isUploading => this == MediaState.uploading;

//   bool get isPending => this == MediaState.pending;
// }

// extension MediaVisibleExt on MediaVisibleState {
//   bool get isHidden => this == MediaVisibleState.hidden;

//   bool get isOnlyMe => this == MediaVisibleState.onlyMe;

//   bool get isFriends => this == MediaVisibleState.friends;

//   bool get isPublic => this == MediaVisibleState.public;
// }

// extension ProfileTypeExt on ProfileType {
//   bool get isMyProfile => this == ProfileType.myProfile;

//   bool get isFollowed => this == ProfileType.followed;

//   bool get isUnFollow => this == ProfileType.unfollow;
// }

// extension RelationShipTypeExt on RelationShipType {
//   bool get isFollower => this == RelationShipType.follower;

//   bool get isFollowing => this == RelationShipType.following;

//   bool get isFriend => this == RelationShipType.friend;

//   bool get isNotRelation => this == RelationShipType.notRelation;
// }

// extension MediaProfileTypeExt on MediaProfileType {
//   bool get isPublic => this == MediaProfileType.public;

//   bool get isPrivate => this == MediaProfileType.private;

//   bool get isTravelHistory => this == MediaProfileType.travelHistory;
// }

// extension UserUpdateTypeExt on UserUpdateType {
//   bool get isAvatar => this == UserUpdateType.avatar;

//   bool get isCover => this == UserUpdateType.cover;

//   bool get isUsername => this == UserUpdateType.username;

//   bool get isName => this == UserUpdateType.name;

//   bool get isEmail => this == UserUpdateType.email;

//   bool get isDescription => this == UserUpdateType.description;

//   bool get isLanguage => this == UserUpdateType.language;

//   bool get isLink => this == UserUpdateType.link;

//   String get title {
//     return switch (this) {
//       UserUpdateType.avatar => R.string.avatar,
//       UserUpdateType.cover => R.string.cover,
//       UserUpdateType.name => R.string.name,
//       UserUpdateType.email => R.string.email,
//       UserUpdateType.username => R.string.recagoId,
//       UserUpdateType.description => R.string.bio,
//       UserUpdateType.language => R.string.language,
//       UserUpdateType.link => R.string.link,
//     };
//   }
// }

// extension HomeNewFeedTabExt on HomeNewFeedTab {
//   bool get isFollowing => this == HomeNewFeedTab.following;

//   bool get isForYou => this == HomeNewFeedTab.forYou;
// }

// extension NotifyStateExt on NotifyState {
//   bool get isSent => this == NotifyState.sent;

//   bool get isSeen => this == NotifyState.seen;

//   bool get isDelete => this == NotifyState.delete;

//   bool get isError => this == NotifyState.error;
// }

// extension BizAccountStateExt on BizAccountState {
//   bool get isRejected => this == BizAccountState.rejected;

//   bool get isPending => this == BizAccountState.pending;

//   bool get isActivated => this == BizAccountState.activated;

//   bool get isDeActivated => this == BizAccountState.deActivated;
// }

// extension UserRoleExt on UserRole {
//   bool get isStandard => this == UserRole.standard;

//   bool get isEmpUser => this == UserRole.empUser;

//   bool get isAdmin => this == UserRole.admin;

//   bool get isEditor => this == UserRole.editor;
// }

// extension SocialLinkTypeExt on SocialLinkType {
//   bool get isFacebook => this == SocialLinkType.facebook;

//   bool get isInstagram => this == SocialLinkType.instagram;

//   bool get isTiktok => this == SocialLinkType.tiktok;

//   bool get isYoutube => this == SocialLinkType.youtube;

//   bool get isAnother => this == SocialLinkType.another;

//   String get iconPath {
//     return switch (this) {
//       SocialLinkType.facebook => R.svgs.icFbLogo.path,
//       SocialLinkType.instagram => R.svgs.icIgLogo.path,
//       SocialLinkType.tiktok => R.svgs.icTiktokLogo.path,
//       SocialLinkType.youtube => R.svgs.icYtbLogo.path,
//       SocialLinkType.another => R.svgs.icAnotherLogo.path,
//     };
//   }

//   String titleAddLink(BuildContext context) {
//     return switch (this) {
//       SocialLinkType.facebook => context.string.addFacebook,
//       SocialLinkType.instagram => context.string.addInstagram,
//       SocialLinkType.tiktok => context.string.addTiktok,
//       SocialLinkType.youtube => context.string.addYoutube,
//       SocialLinkType.another => context.string.addAnother,
//     };
//   }
// }
