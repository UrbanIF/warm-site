class CreateFaqs < ActiveRecord::Migration
  def up
    create_table :faqs
    Faq.create_translation_table! source: :text
  end

  def down
    drop_table :faqs
    Faq.drop_translation_table!
  end
end
