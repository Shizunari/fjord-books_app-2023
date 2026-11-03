# frozen_string_literal: true

class Report < ApplicationRecord
  has_many :comments,
           as: :commentable,
           dependent: :destroy,
           inverse_of: :commentable

  belongs_to :user
  validates :title, :body, presence: true
end
