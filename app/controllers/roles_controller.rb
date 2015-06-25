class RolesController < ApplicationController
  include Hydra::RoleManagement::RolesBehavior

  def create()
		render :nothing => true
  end

  def new()
		render :nothing => true
  end

  def edit()
		render :nothing => true
  end

  def show()
		render :nothing => true
  end

  def update()
		render :nothing => true
  end

  def destroy()
		render :nothing => true
  end


end