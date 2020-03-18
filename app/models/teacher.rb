class Teacher < ApplicationRecord
  validates :name, presence: true, length: { in: 5..50 }
  validates :email, presence: true, length: { maximum: 105 },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }
  has_many :courses

  def formal_name
    self.position + " " + self.name
  end
end
