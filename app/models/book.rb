# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :comments, -> { order(:created_at) },
           as: :commentable,
           dependent: :destroy,
           inverse_of: :commentable
end
