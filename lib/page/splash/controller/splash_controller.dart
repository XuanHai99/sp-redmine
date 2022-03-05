import 'package:apphainguyen/repository/repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashController extends GetxController{
  final RxBool _isLoading = true.obs;
  get isLoading => _isLoading.value;

  final RxBool _isAuthenticated = false.obs;
  get isAuthenticated =>_isAuthenticated.value;


  String? userEmail;
  String? userPass;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // verifyLogin();
    verifyLogin();
  }

  verifyLogin()async{
    _isLoading.value=true;
    final sharedPreferences = await SharedPreferences.getInstance();
    String userEmail = sharedPreferences.getString("email") ?? '';
    String userPass = sharedPreferences.getString("password")?? '';
    if(userEmail==''){
      _isAuthenticated.value= false;
      _isLoading.value=false;
    }else{
      AppRepository().postLogin(userMail: userEmail, userPassword: userPass).then((response){
        if(response){
          _isAuthenticated.value = true;
        }else{
          _isAuthenticated.value = false;
        }
      }).whenComplete(()=> _isLoading.value = false);
    }
  }
}