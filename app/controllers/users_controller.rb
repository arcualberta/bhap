class UsersController < ApplicationController
  include Sufia::UsersControllerBehavior

	def update()
		render :nothing => true
  end

  def edit()
		render :nothing => true
  end

end
