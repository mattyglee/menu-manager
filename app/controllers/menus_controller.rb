class MenusController < ApplicationController
  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.order("start_date desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @menus }
    end
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    @menu = Menu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @menu }
    end
  end

  # GET /menus/new
  # GET /menus/new.json
  def new
    @menu = Menu.new
    start_day = Time.now.to_date
    @menu.start_date = start_day
    @menu.menu_items << MenuItem.new(:having => start_day)
    @menu.menu_items << MenuItem.new(:having => start_day.advance(days: 1))
    @menu.menu_items << MenuItem.new(:having => start_day.advance(days: 2))
    @menu.menu_items << MenuItem.new(:having => start_day.advance(days: 3))
    @menu.menu_items << MenuItem.new(:having => start_day.advance(days: 4))
    @menu.menu_items << MenuItem.new(:having => start_day.advance(days: 5))
    @menu.menu_items << MenuItem.new(:having => start_day.advance(days: 6))

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @menu }
    end
  end

  # GET /menus/1/edit
  def edit
    @menu = Menu.find(params[:id])
    @menu.menu_items.sort!{|a,b| a.having <=> b.having}
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(params[:menu])

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
        format.json { render json: @menu, status: :created, location: @menu }
      else
        format.html { render action: "new" }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /menus/1
  # PUT /menus/1.json
  def update
    @menu = Menu.find(params[:id])

    respond_to do |format|
      if @menu.update_attributes(params[:menu])
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to menus_url }
      format.json { head :no_content }
    end
  end
  
  def generate_shopping_list
  	@menu = Menu.find(params[:id])
  	@shopping_list = ShoppingList.populate_list(@menu)
  	@shopping_list.menu = @menu
  	@shopping_list.save
  	
    redirect_to @shopping_list
  end
end
