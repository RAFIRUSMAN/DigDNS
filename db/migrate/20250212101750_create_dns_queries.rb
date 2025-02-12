class CreateDnsQueries < ActiveRecord::Migration[8.0]
  def change
    create_table :dns_queries do |t|
      t.string :domain
      t.string :record_type
      t.text :result

      t.timestamps
    end
  end
end
