class Song < ActiveRecord::Base
  validates :title, presence: true
  #validates :release_year, numericality: { less_than: 2019 }
  #validates :release_year, presence: true, if: :released
  validates :title, uniqueness: { scope: [:title, :release_year] }
  with_options if: :released? do |song|
      song.validates :release_year, presence: true
      song.validates :release_year, numericality: { less_than: 2019 }
    end

  #def initiliaze
  #    if self.release_year
  #      self.released = true
  #    end
  #end


  def released?
    released == true
  end
end
