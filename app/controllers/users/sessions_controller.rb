class Users::SessionsController < Devise::SessionsController
  # Called after successful sign in
  def create
    super do |resource|
      if resource.chef?
        flash[:notice] = "Welcome Chef!"
      else resource.owner?
        flash[:notice] = "Welcome Owner!"
      end
    end
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  # Called after sign out
  def destroy
    super do |resource|
      flash[:notice] = "You have signed out successfully."
    end
  end
end