class AdminUser < ApplicationRecord

  has_secure_password
  # When changing table names must change pre-gen file names or points
  # self.table_name = "admin_users"

  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, through: :section_edits

scope :sorted, lambda { |column| order("LOWER(#{column})")}

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  FORBIDDEN_USER_NAMES = %w(cgibsonmm suckatwat).freeze

  validates :first_name, presence: true,
                         length: { maximum: 25 }

  validates :last_name, presence: true,
                        length: { maximum: 50 }

  validates :user_name, presence: true,
                        length: { within: 8..25 },
                        uniqueness: true

  validates :email, presence: true,
                    length: { maximum: 100 },
                    format: { with: EMAIL_REGEX },
                    confirmation: true

  validate :user_name_is_allowed
  validate :no_new_users_on_monday, on: :create


    def name
      "#{first_name} #{last_name}"
    end

  private

  def user_name_is_allowed
    if FORBIDDEN_USER_NAMES.include?(user_name)
      errors.add(:user_name, 'has been restricted from use.')
    end
  end

  def no_new_users_on_monday
    if Time.now.sunday?
      errors.add(:base, "Can't create user today, please come back tomorrow.")
    end
  end
end
