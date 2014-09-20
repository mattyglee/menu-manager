class RecipesController < ApplicationController
  # GET /recipes
  # GET /recipes.json
  require 'pp'
  
  def index
    @recipes = Recipe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new
    @recipe.ingredients << Ingredient.new
    get_food_maps

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
    get_food_maps
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end
  
  # GET /recipes/1/copy
  def copy
    old_recipe = Recipe.find(params[:id])
    @recipe = old_recipe.dup
    old_recipe.ingredients.each do |i|
    	@recipe.ingredients << i.dup
    end
    
    @recipe.save!
    get_food_maps
    
    render action: "edit"
  end

  private
  
  def get_food_maps
  	@foods = Food.all(:order => 'name')
		
		@food_name_list = @foods.map { |f| '"'+f.recipe_name+'"' }.join(',')
		@food_id_map = @foods.map { |f| '"'+f.recipe_name+'": "'+f.id.to_s+'"' }.join(',')

  end
end
