class QueryController < ApplicationController
before_filter :authenticate_user!
	def queryMain
	end
	def gameList
	end
	def devList
	end
	def pubList
	end
	def saleList
	end
	def direct
		params[:q]=params[:q].gsub("$","%");
		@r=ActiveRecord::Base.connection.execute(params[:q])
		puts @r[0]
	end
end
