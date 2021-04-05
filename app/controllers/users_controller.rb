class UsersController < ApplicationController
  before_action :set_user, only: %i[ edit update destroy ]

  def show
  end

  def new
    redirect_to user_path(current_user) if user_signed_in?
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'Usuário cadastrado com sucesso'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
    @user = User.find params[:id]

    if @user.update(user_params)
      flash[:success] = 'Dados do usuário atualizados com sucesso'
      redirect_to root_url
    else
      flash[:danger] = 'Ocorreu um erro tentar atualizar os dados do usuário'
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = 'Conta excluida com sucesso'
    sign_out
    redirect_to root_url
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
