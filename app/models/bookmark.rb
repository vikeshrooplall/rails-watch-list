class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie, uniqueness: {
    scope: :list,
    message: "has already been added to this list"}
  validates :comment, length: {
    minimum: 6,
    too_short: "Comment should have minimum %{count} characters" }


end

#A bookmark must be linked to a movie and a list,
#and the [movie, list] pairings should be unique.
