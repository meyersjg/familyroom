class PagesController < ApplicationController

  def homepage
  	@member = Member.new
  end


end
