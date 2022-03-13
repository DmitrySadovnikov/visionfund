class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies, id: :uuid do |t|
      t.date :date
      t.string :title
      t.string :city
      t.string :state
      t.string :country
      t.string :home_overview
      t.string :overview
      t.string :leadership
      t.string :fund
      t.string :company_status
      t.string :sector
      t.string :region
      t.timestamps
    end
  end
end
