# an upload that can be assigned to an email recipient,
# and accessed via a secure token.
class Upload < ApplicationRecord
  has_one_attached :file
  has_secure_token

  # really, you can't trust a regexp for email. But, meh, close enough.
  # https://davidcel.is/posts/stop-validating-email-addresses-with-regex/
  EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :email, presence: true, format: { with: Upload::EMAIL_REGEXP }

  delegate :attached?, to: :file, prefix: true
  delegate :filename, to: :file
end
