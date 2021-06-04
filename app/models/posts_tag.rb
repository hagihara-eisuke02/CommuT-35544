class PostsTag

  include ActiveModel::Model
  attr_accessor :title, :message, :tag_name, :user_id

  with_options presence: true do
    validates :title
    validates :message
    validates :tag_name
    validates :user_id
  end

  def save(tag_list)
    post = Post.create(title: title, message: message, user_id: user_id)

      tag_list.each do |tag_name|
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save

      PostTagRelation.create(post_id: post.id, tag_id: tag.id)
      end
  end

end