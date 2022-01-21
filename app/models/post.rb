class Post < ActiveRecord::Base
    

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valide category"}

    validate :is_clickbait?

    CLICKBAIT_PATTERN = [
            /Won't Believe/i,
            /Secret/i,
            /Top [0-9]*/i,
            /Guess/i
        ]
    def is_clickbait?
        
        if CLICKBAIT_PATTERN.none? {  |pat| pat.match title}
            errors.add(:title, 'This is not click bait')
        end
    end

end
