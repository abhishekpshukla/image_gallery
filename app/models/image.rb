class Image < ActiveRecord::Base
  acts_as_taggable

  belongs_to :user, :foreign_key => :user_id
  
  has_attached_file :avatar,
  :styles => {
    :thumb=> "100x100#",
    :small  => "150x150>",
    :medium => "300x300>",
    :large =>   "660x400>" }
end
