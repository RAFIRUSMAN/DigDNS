class DnsQuery < ApplicationRecord
    validates :domain, presence: true
    validates :record_type, presence: true
  end
  