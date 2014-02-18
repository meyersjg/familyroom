 class FamiliesController < ApplicationController

  def index
    @families = Family.all
  end

  def show
    @family = Family.find_by(id: params[:id])
  end

  def new
  end

  def create
    @family = Family.new
    @family.name = params[:name]
    @family.save

    current_member.family_id = @family.id
    current_member.save

    redirect_to family_url(id: @family.id)
  end

  def edit
    @family = Family.find_by(id: params[:id])
  end

  def update
    @family = Family.find_by(id: params[:id])
    @family.name = params[:name]

    if @family.save
      redirect_to family_url, notice: "Family updated successfully."
    else
      render 'edit'
    end
  end
end
