class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :booking, foreign_key: true
      t.integer :host_rating
      t.integer :guest_rating
      t.text :host_review
      t.text :guest_review

      t.timestamps
    end
  end
end
