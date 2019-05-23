class Song < ApplicationRecord

  validates :title, {
    :presence => true,
    :uniqueness => true
    }
  
  validates :released, inclusion: { :in => [true, false] }
  
  # validates :release_year,
  #   { presence: true, if: :released_true? },
  #   numericality: { greater_than: 2019 }

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  validates :artist_name, :presence => true

end


private

  def released_true?
    released == true
  end