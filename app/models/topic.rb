# frozen_string_literal: true
# This is the topic model to describe that
# topic has many quizzes
class Topic < ApplicationRecord

	# attr_accessor :remote_logo_url

  has_many :quizzes, dependent: :destroy

  validates :title, :description, presence: true

	mount_uploader :logo, LogoUploader

end
