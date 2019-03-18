class AddDefaultValuesToKittensColumns < ActiveRecord::Migration[5.2]
  def change
    change_table :kittens do |t|
     t.change_default :age, 0
     t.change_default :cuteness, 0
     t.change_default :softness, 0
   end
  end
end
