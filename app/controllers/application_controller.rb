class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def oauth_client
    OAuth2::Client.new(Storenvy_app_id, Storenvy_secret, :site => 'https://api.storenvy.com')
  end
  
  def storenvy_reusable_access_token(user)
    OAuth2::AccessToken.from_hash(
      oauth_client,
       {"access_token" => user.access_token}
    )
  end
  
  def storenvy_store_info(user)
    storenvy_reusable_access_token(user).get("/v1/store").parsed["data"].symbolize_keys
  end
  
  def storenvy_products(user, params = {})
    response = storenvy_reusable_access_token(user).get("/v1/products?#{params.to_query}").parsed
    Rails.logger.info(response)
    response["data"]["products"].map &:symbolize_keys
  end
  
  def login_required
    return if current_user
    flash[:error] = "Please log in to do that."
    redirect_to root_url and return false
  end
  
end
