class ListsController < ApplicationController


  def create
    list = List.new(list_params)
    list.save
    redirect_to '/lists'
  end


  def show
  @list = List.find(params[:id])
  
 
  end

  def index
    @list = List.new
    @lists = List.all
    
  end

  def edit
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end

private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
