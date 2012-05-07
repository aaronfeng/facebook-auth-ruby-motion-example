class AppDelegate
  attr_accessor :facebook

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @facebook = Facebook.alloc.initWithAppId("YOUR-APP-ID", andDelegate:self)

    defaults = NSUserDefaults.standardUserDefaults

    if defaults.objectForKey("FBAccessTokenKey") &&
       defaults.objectForKey("FBExpirationDateKey")
        @facebook.accessToken = defaults.objectForKey("FBAccessTokenKey")
        @facebook.expirationDate = defaults.objectForKey("FBExpirationDateKey")
    end

    if !facebook.isSessionValid
      @facebook.authorize nil
    end

    true
  end

  def fbDidLogin
    defaults = NSUserDefaults.standardUserDefaults
    defaults.setObject(@facebook.accessToken, forKey:"FBAccessTokenKey")
    defaults.setObject(@facebook.expirationDate, forKey:"FBExpirationDateKey")
  end

  def application(application,
                  openURL:url,
                  sourceApplication:sourceApplication,
                  annotation:annotation)
    @facebook.handleOpenURL(url)
  end
end
