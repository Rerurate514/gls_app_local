import 'package:firebase_auth/firebase_auth.dart';
import './logics/UserAuthInfo.dart';
import './logics/UserAuth.dart';
import './logics/Users.dart';
import './logics/UserProfile.dart';

class UserController{
  late final UserAuthentifier _auth;
  final UserResistry _resistry = UserResistry();
  final UserDataFetcher _fetcher = UserDataFetcher();

  late final UserAuthInfo _userAuthInfo;
  late final UserProfile _userProfile;
  late final UserStoreInfo _userStoreInfo;
  late final User? _user;

  bool get isLogin => _auth.isLogin;

  Map<String, dynamic> get profileMap => _userProfile.dbProcessedMap;

  UserController(this._userAuthInfo, this._userProfile){
    _auth = UserAuthentifier(_userAuthInfo);
  }

  void createUserWithEmailAndPassWord() async {
    await _auth.createUserWithEmailAndPassWord();
  }

  Future signInWithEmailAndPassWord() async { 
    _user = await _auth.signInWithEmailAndPassWord();
    if(_user == null) {
      print("_user variable is null in createUserWithEmailAndPassWord method of userController class");
      return;
    }
    
    _userStoreInfo = UserStoreInfo(uidArg: _user.uid, profileArg: _userProfile);
  }

  void sendPasswordResetEmail() async {
    _auth.sendPasswordResetEmail();
  }

  void signOut(){
    if(!isLogin) return;
    _auth.signOut();
  } 

  void addToStore() { 
    if(!isLogin) return;
    _resistry.add(newUserDataArg: _userStoreInfo);
  }

  void updateToStore(UserStoreInfo newUserDataArg, UserTableColumn columnArg) {
    if(!isLogin) return;
    _resistry.update(newUserDataArg: newUserDataArg, columnArg: columnArg);
  }

  ///Mapデータを取得するときは、取得した変数[UsersTableColumn.カラム名（データベースの項目名）.name]と記述する。
  void fetchFromStore(){
    if(!isLogin) return;
    if(_userStoreInfo.uid == "") return;
    _fetcher.fetch(targetUidArg: _userStoreInfo.uid);
  }
}