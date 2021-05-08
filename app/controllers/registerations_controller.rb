class RegisterationsController < Devise::RegistrationsController

    def new
        super
    end

    def create


        if params[:user][:type] == "Admin"
            @user = Admin.new(user_params)
        else
            @user = Student.new(user_params)
        end

        if @user.save
            redirect_to sign_in(@user)
        else
            render :new
        end

        
    end

    def edit
        super
    end

    def update
        super
    end

    def destroy
        super
    end

    def cancel
        super
    end
    def user_params
        params.require(:user).permit(:email, :password, :type, :name, :department)
    end
end