class OtherItemsController < ApplicationController
  # GET /other_items
  # GET /other_items.json
  def index
    @other_items = OtherItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @other_items }
    end
  end

  # GET /other_items/1
  # GET /other_items/1.json
  def show
    @other_item = OtherItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @other_item }
    end
  end

  # GET /other_items/new
  # GET /other_items/new.json
  def new
    @other_item = OtherItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @other_item }
    end
  end

  # GET /other_items/1/edit
  def edit
    @other_item = OtherItem.find(params[:id])
  end

  # POST /other_items
  # POST /other_items.json
  def create
    @other_item = OtherItem.new(params[:other_item])

    respond_to do |format|
      if @other_item.save
        format.html { redirect_to @other_item, notice: 'Other item was successfully created.' }
        format.json { render json: @other_item, status: :created, location: @other_item }
      else
        format.html { render action: "new" }
        format.json { render json: @other_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /other_items/1
  # PUT /other_items/1.json
  def update
    @other_item = OtherItem.find(params[:id])

    respond_to do |format|
      if @other_item.update_attributes(params[:other_item])
        format.html { redirect_to @other_item, notice: 'Other item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @other_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /other_items/1
  # DELETE /other_items/1.json
  def destroy
    @other_item = OtherItem.find(params[:id])
    @other_item.destroy

    respond_to do |format|
      format.html { redirect_to other_items_url }
      format.json { head :no_content }
    end
  end
end
