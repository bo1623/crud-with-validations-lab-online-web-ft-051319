class Song < ApplicationRecord

  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: :released?, numericality: {only_integer: true, less_than_or_equal_to: Date.today.year}
  validates :artist_name, presence: true
  validates :genre, presence: true


  def released?
    released
  end
  #
  # def same_release_year
  #   if @song=Song.find_by(title: params[:title])
  #     @song.release_year==params[:release_year]
  #   end
  # end

end
