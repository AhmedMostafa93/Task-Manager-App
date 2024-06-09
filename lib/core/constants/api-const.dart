class ApiConstants {
  static const baseUrl = 'https://dummyjson.com/';
  static const login = '${baseUrl}auth/login';
  static const addTask = '${baseUrl}todos/add';
  static const getTasks = '${baseUrl}todos?';

  static const refreshToken = '${baseUrl}auth/refresh';

  static const tokenAttribute = 'token';
  static const refreshTokenAttribute = 'refresh_token';
  static const languageAttribute = 'lang';
  static const pageNumberAttribute = 'page_number';
  static const pageSizeAttribute = 'page_size';

  static const userIdAttribute = 'userId';
}
