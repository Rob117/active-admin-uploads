class AddHelloAudioToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hello_audio, :string
  end
end
