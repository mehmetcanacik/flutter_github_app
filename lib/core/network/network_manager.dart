class NetworkManager {
  static final NetworkManager _singleton = NetworkManager._getInternal();

  NetworkManager._getInternal();
  factory NetworkManager() => _singleton;

  
}
