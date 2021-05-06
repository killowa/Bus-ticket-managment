class CustomsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def update
    super
  end

  def user_params
    params.require(:user).permit(:email, :password, :type)
  end
end 