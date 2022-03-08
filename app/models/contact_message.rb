class ContactMessage < ApplicationRecord
  validates_presence_of :email, :full_name, :message
  validates_format_of :email, with: Devise::email_regexp, allow_blank: true
  has_many :contact_message_reads, dependent: :destroy
  has_many :admins, through: :contact_message_reads

  def read_by(admin)
  	contact_message_reads.map(&:admin_id).include? admin.id
  end

  def add_reader(admin)
  	contact_message_reads.create(admin_id: admin.id)
  end

  def read_time(admin)
    contact_message_reads.find_by(admin_id: admin.id).created_at
  end

  def self.unread_by(admin)
    self.all.select { |message| !message.read_by(admin) }
  end
end
