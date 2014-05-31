class GameListsController < ApplicationController
  before_action :set_game_list, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /game_lists
  # GET /game_lists.json
  def index
    @game_lists = GameList.all
    if(params[:o].present?)
    	@game_lists=@game_lists.order(params[:o])
    end
  end

  # GET /game_lists/1
  # GET /game_lists/1.json
  def show
  	@gen=Genre.where(:gid=>params[:id])
  	@con=Console.where(:gid=>params[:id])
  end

  # GET /game_lists/new
  def new
    @game_list = GameList.new
    @ard=Array.new
    @arp=Array.new
    @dar=Developer.all
    @dar.each do |dr|
    	@ard << dr.name
    end
    @par=Publisher.all
    @par.each do |pr|
    	@arp << pr.name
    end
  end

  # GET /game_lists/1/edit
  def edit
    @ard=Array.new
    @arp=Array.new
    @arg=Array.new
    @arc=Array.new
    @dar=Developer.all
    @dar.each do |dr|
    	@ard << dr.name
    end
    @par=Publisher.all
    @par.each do |pr|
    	@arp << pr.name
    end
    @gar=Genre.where(:gid=>params[:id])
    @gar.each do |gr|
    	@arg << gr.genre
    end
    @car=Console.where(:gid=>params[:id])
    @car.each do |cr|
    	@arc << cr.console
    end
  end

  # POST /game_lists
  # POST /game_lists.json
  def create
    @game_list = GameList.new(game_list_params)
    @dev=@game_list.dev
    @pub=@game_list.pub
    @frn=@game_list.franchise
    respond_to do |format|
      if @game_list.save
      	if(DevPub.where(:dev=>@dev).where(:pub=>@pub).present?)
      		@var=DevPub.where(:dev=>@dev).where(:pub=>@pub)[0]
      		@var.collab=@var.collab+1
      		@var.save
      	else
      		@var=DevPub.new
      		@var.dev=@dev
      		@var.pub=@pub
      		@var.collab=1
      		@var.save
      	end
      	if Franchise.where(:name=>@pub).where(:franc=>@frn).present?
      	else
      		@rec=Franchise.new
      		@rec.name=@pub
      		@rec.franc=@frn
      		@var.save
      	end
        format.html { redirect_to @game_list, notice: 'Game list was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @game_list.errors, status: :unprocessable_entity }
      end
    end
  end

def yindex
	@year=params[:y][0..3]
	@g=GameList.where("yor like ?","#{@year}%")
end

def eindex
	@g=GameList.where(:esrb=>params[:e])
end

  # PATCH/PUT /game_lists/1
  # PATCH/PUT /game_lists/1.json
  def update
    @dev=@game_list.dev
    @pub=@game_list.pub
    respond_to do |format|
      if @game_list.update(game_list_params)
        if(DevPub.where(:dev=>@dev).where(:pub=>@pub).present?)
      		@var=DevPub.where(:dev=>@dev).where(:pub=>@pub)[0]
      		@var.collab=@var.collab+1
      		@var.save
      	else
      		@var=DevPub.new
      		@var.dev=@dev
      		@var.pub=@pub
      		@var.collab=1
      		@var.save
      	end
      	if Franchise.where(:name=>@pub).where(:franc=>@frn).present?
      	else
      		@rec=Franchise.new
      		@rec.name=@pub
      		@rec.franc=@frn.to_s
      		@rec.save
      	end
        format.html { redirect_to @game_list, notice: 'Game list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_lists/1
  # DELETE /game_lists/1.json
  def destroy
    @game_list.destroy
    @var=Sale.where(:gid=>@game_list.id).first
    if @var.present?
    @var.destroy
    end
    respond_to do |format|
      format.html { redirect_to game_lists_url }
      format.json { head :no_content }
    end
  end
def downDevPub
	@rec=DevPub.where(:dev=>params[:d]).where(:pub=>params[:p])[0]
	@rec.collab=@rec.collab-1
	if(@rec.collab.to_i=="0".to_i)
		@rec.destroy
	else 
		@rec.save
	end
end
def downFranchise
	@rec=Franchise.where(:franc=>params[:f]).where(:name=>params[:p])[0]
	@check=GameList.where(:franchise=>params[:f]).where(:pub=>params[:p])
	if(@check[1].present?)
	else
		@rec.destroy
	end
end
def addGenres
	if(params[:i].present?)
		@next=params[:i]
	else 
		@next=ActiveRecord::Base.connection.execute("SELECT seq FROM sqlite_sequence WHERE name = 'game_lists';").first[0]+1
	end
	@ar=Array.new
	@ar=params[:ar].split(',')
	@ar.each do |ar|
		@rec=Genre.new
		@rec.gid=@next
		@rec.genre=ar
		@rec.save
	end
end
def remGenres
	@next=params[:i]
	@ar=Array.new
	@ar=params[:ar].split(',')
	@ar.each do |ar|
		@rec=Genre.where(:gid=>@next).where(:genre=>ar.to_s)[0]
		@rec.destroy
	end
end
def addConsoles
	if(params[:i].present?)
		@next=params[:i]
	else 
		@next=ActiveRecord::Base.connection.execute("SELECT seq FROM sqlite_sequence WHERE name = 'game_lists';").first[0]+1
	end
	@ar=Array.new
	@ar=params[:ar].split(',')
	@ar.each do |ar|
		@rec=Console.new
		@rec.gid=@next
		@rec.console=ar
		@rec.save
	end
end
def remConsoles
	@next=params[:i]
	puts @next
	@ar=Array.new
	@ar=params[:ar].split(',')
	puts @ar
	@ar.each do |ar|
		@rec=Console.where(:gid=>@next).where(:console=>ar.to_s)[0]
		@rec.destroy
	end
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_list
      @game_list = GameList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_list_params
      params.require(:game_list).permit(:name, :dev, :pub, :esrb, :crit, :yor)
    end
end
