class Procategory < ActiveRecord::Base
	belongs_to :user
	belongs_to :procategory

	has_many :projects
	has_many :procategories

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

  def name_with_no_projects_ddc
  	no_projects = self.projects.where(["status = ?", true]).count.to_s
  	return self.ddc + " - " + self.name + " (" + no_projects + ")"
  end
end
