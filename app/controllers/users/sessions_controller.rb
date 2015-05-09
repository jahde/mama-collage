class Users::SessionsController < Devise::SessionsController
  after_action :set_csrf_headers, only: :create
  prepend_before_filter :verify_user, only: [:destroy]
  # protect_from_forgery unless: -> { request.format.json? }
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
  def set_csrf_headers
     if request.xhr?
       # Add the newly created csrf token to the page headers
       # These values are sent on 1 request only
       response.headers['X-CSRF-Token'] = "#{form_authenticity_token}"
       response.headers['X-CSRF-Param'] = "#{request_forgery_protection_token}"
     end
  end

  def verify_user
    ## redirect to appropriate path
    redirect_to new_user_session_path, notice: 'You have already signed out. Please sign in again.' and return unless user_signed_in?
  end
end
