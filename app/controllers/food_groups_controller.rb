class FoodGroupsController < ApplicationController
  # GET /food_groups
  # GET /food_groups.json
  def index
    @food_groups = FoodGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @food_groups }
    end
  end

  # GET /food_groups/1
  # GET /food_groups/1.json
  def show
    @food_group = FoodGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @food_group }
    end
  end

  # GET /food_groups/new
  # GET /food_groups/new.json
  def new
    @food_group = FoodGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @food_group }
    end
  end

  # GET /food_groups/1/edit
  def edit
    @food_group = FoodGroup.find(params[:id])
  end

  # POST /food_groups
  # POST /food_groups.json
  def create
    @food_group = FoodGroup.new(params[:food_group])

    respond_to do |format|
      if @food_group.save
        format.html { redirect_to @food_group, notice: 'Food group was successfully created.' }
        format.json { render json: @food_group, status: :created, location: @food_group }
      else
        format.html { render action: "new" }
        format.json { render json: @food_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /food_groups/1
  # PUT /food_groups/1.json
  def update
    @food_group = FoodGroup.find(params[:id])

    respond_to do |format|
      if @food_group.update_attributes(params[:food_group])
        format.html { redirect_to @food_group, notice: 'Food group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @food_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_groups/1
  # DELETE /food_groups/1.json
  def destroy
    @food_group = FoodGroup.find(params[:id])
    @food_group.destroy

    respond_to do |format|
      format.html { redirect_to food_groups_url }
      format.json { head :no_content }
    end
  end
end
