class ArticulosController < ApplicationController
  before_action :set_articulo, only: [:show, :update, :destroy]
  before_action :authenticate_user
  # GET /articulos
  def index
    @articulos = Articulo.all

    render json: @articulos
  end

  # GET /articulos/1
  def show
    render json: @articulo
  end

  # POST /articulos
  def create
    @articulo = Articulo.new(articulo_params)
    @articulo.user = current_user #knock retorna el usuario actual(token)
    if @articulo.save
      render json: @articulo, status: :created, location: @articulo
    else
      render json: @articulo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articulos/1
  def update
    if @articulo.update(articulo_params)
      render json: @articulo
    else
      render json: @articulo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articulos/1
  def destroy
    @articulo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articulo
      @articulo = Articulo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def articulo_params
      params.require(:articulo).permit(:titulo, :contenido, :user_id)
    end
end
