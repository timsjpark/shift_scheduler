class Employee < ActiveRecord::Base
  has_one :schedule
  has_many :shifts, through: :schedule
  belongs_to :department
  belongs_to :organization

  has_secure_password(validations: false)
  validates_presence_of :first_name, :last_name, :email
  validates :email, format: { with: /@/ }
  validates_uniqueness_of :email

  # validates :password, length: {minimum: 8, message: "must contain at least 8 characters"},
  #   format: {with: /[!@#$%^&*]+\d+/, message: 'must contain at least one number and one character (!@#$%^&*)'}, if: ->(employee) {
  #     !employee.omniauth? && employee.persisted? == false
  #   }
  validates_confirmation_of :password, if: ->(employee) {
    !employee.omniauth? && employee.password.present?
  }
  validates_presence_of :password, if: ->(employee) {
    !employee.omniauth? 
  }, on: :create
  validates_presence_of :password_confirmation, if: ->(employee) { 
    !employee.omniauth? && employee.password.present?
  }

  def manager?
    type == 'Manager'
  end

  def needs_verification!
    self.update_attributes!(
        token: SecureRandom.urlsafe_base64,
        verified_email: false
    )
    EmployeeNotifier.signed_up(self).deliver_now
  end
end
