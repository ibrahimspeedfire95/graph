class CreateUserSessionData < ActiveRecord::Migration[5.1]
  def change
    create_table :user_session_data do |t|
      t.string :platform, null: false
      t.string :notifications_token, null: false, default: ""

      t.belongs_to :student, index: true

      t.timestamps
    end
  end
end
