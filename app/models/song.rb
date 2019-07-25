class Song < ApplicationRecord

  validates :title, uniqueness: {
    scope: %i[release_year artist_name], #sets the scope of validation
    message: 'cannot be repeated by the same artist in the same year'
  }
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: :released?, numericality: {only_integer: true, less_than_or_equal_to: Date.today.year}
  validates :artist_name, presence: true
  validates :genre, presence: true


  def released?
    released
  end


end
