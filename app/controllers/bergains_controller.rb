class BergainsController < ApplicationController
  # GET /bergains
  # GET /bergains.json
  def index
    @bergains = Bergain.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bergains }
    end
  end

  # GET /bergains/1
  # GET /bergains/1.json
  def show
    @bergain = Bergain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bergain }
    end
  end

  # GET /bergains/new
  # GET /bergains/new.json
  def new
    @bergain = Bergain.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bergain }
    end
  end

  # GET /bergains/1/edit
  def edit
    @bergain = Bergain.find(params[:id])
  end

  # POST /bergains
  # POST /bergains.json
  def create
    @bergain = Bergain.new(params[:bergain])

    respond_to do |format|
      if @bergain.save
        format.html { redirect_to @bergain, notice: 'Bergain was successfully created.' }
        format.json { render json: @bergain, status: :created, location: @bergain }
      else
        format.html { render action: "new" }
        format.json { render json: @bergain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bergains/1
  # PUT /bergains/1.json
  def update
    @bergain = Bergain.find(params[:id])

    respond_to do |format|
      if @bergain.update_attributes(params[:bergain])
        format.html { redirect_to @bergain, notice: 'Bergain was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bergain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bergains/1
  # DELETE /bergains/1.json
  def destroy
    @bergain = Bergain.find(params[:id])
    @bergain.destroy

    respond_to do |format|
      format.html { redirect_to bergains_url }
      format.json { head :no_content }
    end
  end
end
