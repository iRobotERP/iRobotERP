
class IrobotuisController < ApplicationController
  layout "iRobotUIHome"
  before_filter :authenticate_user!

  # GET /irobotuis
  # GET /irobotuis.json
  def index
   # before_filter :authenticate_user!
    @irobotuis = Irobotui.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @irobotuis }
      format.xml { render xml: @irobotuis }
    end
  end

  # GET /irobotuis/1
  # GET /irobotuis/1.json
  def show
    @irobotui = Irobotui.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @irobotui }
      format.xml { render xml: @irobotui }
    end
  end

  # GET /irobotuis/new
  # GET /irobotuis/new.json
  def new
    @irobotui = Irobotui.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @irobotui }
      format.xml { render xml: @irobotui }
    end
  end

  # GET /irobotuis/1/edit
  def edit
    @irobotui = Irobotui.find(params[:id])
  end

  # POST /irobotuis
  # POST /irobotuis.json
  def create
    @irobotui = Irobotui.new(params[:irobotui])

    respond_to do |format|
      if @irobotui.save
        format.html { redirect_to @irobotui, notice: 'Irobotui was successfully created.' }
        format.json { render json: @irobotui, status: :created, location: @irobotui }
        format.xml { render xml: @irobotui, status: :created, location: @irobotui }
      else
        format.html { render action: "new" }
        format.json { render json: @irobotui.errors, status: :unprocessable_entity }
        format.xml { render xml: @irobotui, status: :created, location: @irobotui }
      end
    end
  end

  # PUT /irobotuis/1
  # PUT /irobotuis/1.json
  def update
    @irobotui = Irobotui.find(params[:id])

    respond_to do |format|
      if @irobotui.update_attributes(params[:irobotui])
        format.html { redirect_to @irobotui, notice: 'Irobotui was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @irobotui.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /irobotuis/1
  # DELETE /irobotuis/1.json
  def destroy
    @irobotui = Irobotui.find(params[:id])
    @irobotui.destroy

    respond_to do |format|
      format.html { redirect_to irobotuis_url }
      format.json { head :no_content }
    end
  end
end
