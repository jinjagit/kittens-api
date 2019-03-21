class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render :json => @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(name: params[:kitten][:name],
                          age: params[:kitten][:age],
                          cuteness: params[:kitten][:cuteness],
                          softness: params[:kitten][:softness])
    if @kitten.save
      flash[:notice] = "Kitten created!"
      redirect_to kitten_path(@kitten.id)
    else
      render 'new'
    end
  end

  def edit
    @kitten = Kitten.find_by(id: params[:id])
  end

  def update
    @kitten = Kitten.find_by(id: params[:id])
    permitted = params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    @kitten.update_attributes(permitted)
    flash[:notice] = "Kitten edited!"
    redirect_to kitten_path(@kitten.id)
  end

  def destroy
    @kitten = Kitten.find_by(id: params[:id])
    @kitten.destroy
    flash[:notice] = "Kitten deleted!"
    redirect_to root_url
  end
end
