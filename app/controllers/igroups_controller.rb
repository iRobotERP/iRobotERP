class IgroupsController < ApplicationController
  # GET /igroups
  # GET /igroups.json
  def index
    @igroups = Igroup.all
    @igroups_grid=initialize_grid(Igroup)
    @users_grid=initialize_grid(User)
    @imenus_grid=initialize_grid(Imenu)
    @menuboms_grid=initialize_grid(Menubom)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @igroups }
    end
  end

  # GET /igroups/1
  # GET /igroups/1.json
  def show
    @igroup = Igroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @igroup }
    end
  end

  # GET /igroups/new
  # GET /igroups/new.json
  def new
    @igroup = Igroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @igroup }
    end
  end

  # GET /igroups/1/edit
  def edit
    @igroup = Igroup.find(params[:id])
  end

  # POST /igroups
  # POST /igroups.json
  def create
    @igroup = Igroup.new(params[:igroup])
    @igroup.create_man=current_user.email
    @igroup.select_count=1

    respond_to do |format|
      if @igroup.save
        format.html { redirect_to @igroup, notice: 'Igroup was successfully created.' }
        format.json { render json: @igroup, status: :created, location: @igroup }
      else
        format.html { render action: "new" }
        format.json { render json: @igroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /igroups/1
  # PUT /igroups/1.json
  def update
    @igroup = Igroup.find(params[:id])
    @igroup.update_man=current_user.email
    @igroup.select_count=@igroup.select_count+1
    respond_to do |format|
      if @igroup.update_attributes(params[:igroup])
        format.html { redirect_to @igroup, notice: 'Igroup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @igroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /igroups/1
  # DELETE /igroups/1.json
  def destroy
    @igroup = Igroup.find(params[:id])
    @igroup.destroy

    respond_to do |format|
      format.html { redirect_to igroups_url }
      format.json { head :no_content }
    end
  end
end
