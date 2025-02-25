class Users::SessionsController < Devise::SessionsController
  # Called after successful sign in
  def create
    super do |resource|
      if resource.chef?
        flash[:notice] = "Welcome Chef!"
        return redirect_to root_path
      elsif resource.owner?
        flash[:notice] = "Welcome Owner!"
        return redirect_to root_path
      else
        return redirect_to root_path
      end
    end
  end

  # Called after sign out
  def destroy
    super do |resource|
      flash[:notice] = "You have signed out successfully."
    end
  end
end