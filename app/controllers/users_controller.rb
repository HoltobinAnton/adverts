class UsersController < ApplicationController
  include Wicked::Wizard
  #before_action :set_user, only: [:show]

  steps :personal, :address

  def new
    redirect_to wizard_path(steps.first)
  end

  def show
    render_wizard
  end

  def edit
    p params
    @user = User.find(params[:address][:user_id])
    unless params[:address].nil?
      CheckoutAddress.call(params) do
        on(:invalid) do 
          flash[:danger] = t('flash.checkout.invalid')
        end
        on(:valid) do |address|
          flash[:success] = t('flash.checkout.valid')
        end
      end
    end
  end

  def update
    p params
    @user = current_user
    if @user.update(user_params)
      bypass_sign_in(@user)
      flash[:success] = t('flash.user.success')
      redirect_to root_path
    else
      render :edit
    end
  end

  def look_at
    @user = User.find(params[:format])
  end

  def create
    case step
    when :personal
      CheckoutPersonal.call(params) do
        on(:invalid) do
          flash[:danger] = t('flash.checkout.invalid')
          render_wizard
        end
        on(:valid) do |user|
          flash[:success] = t('flash.checkout.valid')
          @user = user
          render_wizard @user
        end
      end
    when :address
      CheckoutAddress.call(params) do
        on(:invalid) do 
          flash[:danger] = t('flash.checkout.invalid')
          redirect_to wizard_path step
        end
        on(:valid) do |address|
          flash[:success] = t('flash.checkout.valid')
          sign_in(address.user)
          redirect_to root_path
        end
    end
  end
end

private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :email, :login, :full_name, :birthday)
  end

end

