class Api::SessionsController < Api::BaseApiController
  before_filter :authenticate_user!, :except => [:create, :destroy, :say_hi ]
  skip_before_filter :authenticate_auth_token, :only => [:create, :destroy, :say_hi ]
  skip_before_filter :ensure_authorized, :only => [:create, :destroy, :say_hi ]
  
  
  before_filter :ensure_params_exist, :except => [:say_hi, :destroy, :authenticate_auth_token]

  respond_to :json
  
  
  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    user = user_email.present? && User.find_by(email: user_email)

    if user.valid_password? user_password
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
#       render json: user, status: 200, location: [:api, user]
      render :json => {
                :success=>true, 
                :auth_token=>user.auth_token, 
                :email=>user.email,
                :role => user.role.to_json
              }
      
      
    else
#       render json: { errors: "Invalid email or password" }, status: 422
      invalid_login_attempt
    end
  end
  
  def destroy
    user = User.find_by(auth_token: params[:id])
    user.generate_authentication_token!
    user.save
    head 204
  end
  
#   http://apionrails.icalialabs.com/book/chapter_five
  protected
  def ensure_params_exist
    return unless params[:user_login].blank?
    render :json=>{:success=>false, :message=>"missing user_login parameter"}, :status=>422
  end
 
  def invalid_login_attempt
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end
end