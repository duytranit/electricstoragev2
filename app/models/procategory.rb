class Procategory < ActiveRecord::Base
	belongs_to :user
	belongs_to :procategory

	has_many :projects
	has_many :procategories

	validate :check_name?

	def check_name?
		name = self.name

		if (name[0..1] == '') || (name[0..1] == ' ')
			errors.add(:name, 'cannot start with a space')
		end
	end

	def full_name
    flag = self.level.to_i
    name = self.ddc + " - "
    while flag > 1 do
      flag -= 1
      name = " - " + name
    end
    name = name + self.name
    return name
  end
end
