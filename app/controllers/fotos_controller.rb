class FotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_foto, only: [:edit, :update, :destroy]
  def index
    @fotos = Foto.all
  end

  def new
    @foto = Foto.new
  end

  def create
    @foto = Foto.new(fotos_params)
    if @foto.save
      redirect_to fotos_path, notice: "Slowgramを作成しました！"
    else
      render 'new'
    end
  end

  def update
    if @foto.update(fotos_params)
    redirect_to fotos_path, notice: "Slowgramを更新しました！"
    else
    render 'edit'
    end
  end

  def edit
  end

  def destroy
      @foto.destroy
      redirect_to fotos_path, notice: "Slowgramを削除しました！"
  end

  private
      def fotos_params
        params.require(:foto).permit(:title, :content)
      end
      def set_foto
           @foto = Foto.find(params[:id])
      end
    end
