class Companies::ProjectRegistForm < ::Companies::ApplicationForm
  attr_accessor :title,
                :file_name,
                :company_id,
                :status,
                :background,
                :allocation,
                :detail,
                :requirement,
                :benefit,
                :emp_type,
                :min_salary,
                :max_salary,
                :number_of_hire,
                :process,
                :place,
                :welfare

  attr_reader :project

  validates :title, presence: true, length: { maximum: 50 }
  validates :company_id, presence: true
  validates :background, presence: true
  validates :detail, presence: true
  validates :requirement, presence: true
  validates :process, presence: true
  validates :place, presence: true

  def initialize(project, params = nil)
    @project = project
    set_defaults
    params ? super(sanitize_params(params)) : super()
  end

  def save
    return false if invalid?

    @project.title = title
    @project.company_id = company_id
    @project.status = status
    @project.background = background
    @project.allocation = allocation
    @project.detail = detail
    @project.requirement = requirement
    @project.benefit = benefit
    # @project.emp_type = emp_type
    @project.min_salary = min_salary
    @project.max_salary = max_salary
    @project.number_of_hire = number_of_hire
    @project.process = process
    @project.place = place
    @project.welfare = welfare

    @project.save
  end

  def set_defaults
    self.title ||= @project.title
    self.company_id ||= @project.company_id
    self.status ||= @project.status
    self.background ||= @project.background
    self.allocation ||= @project.allocation
    self.detail ||= @project.detail
    self.requirement ||= @project.requirement
    self.benefit ||= @project.benefit
    # self.emp_type ||= @project.emp_type
    self.min_salary ||= @project.min_salary
    self.max_salary ||= @project.max_salary
    self.number_of_hire ||= @project.number_of_hire
    self.process ||= @project.process
    self.place ||= @project.place
    self.welfare ||= @project.welfare
  end

  def sanitize_params(params)
    params.require(:project)
          .permit(:title,
                  :company_id,
                  :background,
                  :allocation,
                  :detail,
                  :requirement,
                  :benefit,
                  :emp_type,
                  :number_of_hire,
                  :process,
                  :place,
                  :welfare,
                  :min_salary,
                  :max_salary,
                  :status,
                  :file_name
          )
  end

  private

  def validate_file_name
    errors[:base] << 'Project main image is required' if file_name.nil?
  end
end