class OrganizationsController < ApplicationController

  def new
    @organization = Organization.new
  end
  
  def create
    @organization = Organization.new(organization_params)

    respond_to do |format|
      if @organization.save
        current_employee.type = 'Manager'
        format.html { redirect_to employees_path, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @organizations = Organization.all
  end

  def join
    @organization = Organization.find_by(params[:id])
    current_employee.organization_id = @organization.id
    redirect_to schedule_path
  end


  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name)
  end

end
