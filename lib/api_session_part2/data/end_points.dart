class EndPoints{
  static const String baseUrl='https://food-api-omega.vercel.app/api/v1/';
  static  const String chefSignIn='chef/signin';
  static  const String chefChangePassword='chef/change-password';
  static  const String chefDelete='chef/delete';
  static  const String chefGet='chef/get-chef/';
  static  const String changeForgottenPassword='chef/change-forgotten-password';
  static  const String updateChef='chef/update';
  static  const String logOut='chef/logout';
  static  const String addMeal='meal/add-to-menu';
  static  const String updateMeal='chef/update-meal/';
  static  const String deleteMeal='meal/delete-meal/';

  static  const String getAllMeal='meal/get-meals';

  static String getChefDataEndPoint(id){
    return '$chefGet$id';
  }

  static String getUpdateIdEndPoint(id){
    return '$updateMeal$id';
  }

  static String getDeleteIdEndPoint(id){
    return '$deleteMeal$id';
  }
}




//chef/get-chef/64a2dafe744ee48035d4692c
//chef/delete?id=649789d769bd2c36dce15979
