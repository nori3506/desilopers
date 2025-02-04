class Companies::CompaniesController < Companies::ApplicationController
  # layout 'layouts/regist.html.erb', only: [:new]
  layout 'layouts/company/layout.html.erb', only: [:show, :edit]

  def new
    @company = Company.new
    @form = Companies::CompanyRegistForm.new(@company, current_user)
    render :layout => 'regist'
  end

  def create
    params[:company][:foundation_date] = fondation_date_join
    @company = Company.new
    @form = Companies::CompanyRegistForm.new(@company, params, current_user)
    if @form.save
      @company.images.create(file_name: params[:company][:file_name])
      flash[:success] = "Company was successfully created"
      redirect_to companies_home_index_path
    else
      render(action: 'new', layout:"regist")
    end
  end

  def show
    @company = current_user.company
  end

  def edit
    @company = Company.find(params[:id])
    @form = Companies::CompanyRegistForm.new(@company, current_user)
  end

  def update
    @company = Company.find(params[:id])
    @form = Companies::CompanyRegistForm.new(@company, params, current_user)

    if @form.save
      @company.images.update(file_name: params[:company][:file_name])
      flash[:success] = "Company was successfully updated"
      redirect_to companies_company_path(@company)
    else
      render(action: 'edit', layout:"layouts/company/layout.html.erb")
    end
  end

  private
  def fondation_date_join
    date = params[:foundation_date]
    Date.new date["foundation_date(1i)"].to_i, date["foundation_date(2i)"].to_i, date["foundation_date(3i)"].to_i
  end
end