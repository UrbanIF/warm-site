RailsAdmin.config do |config|

  ### Popular gems integration

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard # mandatory
    index # mandatory
    new do
      except ['Faq', 'StaticPage']
    end
    export
    bulk_delete do
      except ['Faq', 'StaticPage']
    end
    show
    edit
    delete do
      except ['Faq', 'StaticPage']
    end
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.included_models = %w(
News
News::Translation
Publication
Publication::Translation
Partner
Partner::Translation
Project
Project::Translation
StaticPage
StaticPage::Translation
Faq
Faq::Translation
User
MediaPartner
)

  [Publication, StaticPage, Faq].each do |_model|
    config.model _model do
      configure :translations, :globalize_tabs
    end
  end

  config.model 'News' do
    configure :translations, :globalize_tabs
    weight 1
    field :image, :carrierwave
    list do
      field :title_uk
      fields :image, :date, :show_on_mine
    end
    edit do
      fields :image, :date, :slug, :show_on_mine, :translations
    end
  end

  config.model 'Partner' do
    configure :translations, :globalize_tabs
    weight 1
    field :logo_color, :carrierwave
    list do
      field :title_uk
      fields :position
    end
    edit do
      field :logo_black_and_white, :carrierwave
      fields :url, :position, :video, :translations
    end
  end



  config.model 'News::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    configure :body, :ck_editor
    include_fields :locale, :title, :short, :body, :title_on_mine, :short_on_mine
  end

  config.model 'Publication::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    include_fields :locale, :title, :source
  end

  config.model 'Partner::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    # configure :body, :ck_editor
    include_fields :locale, :title, :body
  end

  config.model 'Project' do
    field :status, :enum do
      enum do
        [ [ 'великий','big' ], [ 'малий','small' ] ]
      end
      default_value 'big'
    end
    field :weight, :integer do
      default_value 0
    end
    field :is_show, :boolean do
      default_value true
    end
    configure :translations, :globalize_tabs
    edit do
      fields :slug, :image, :big_image, :status, :file_link, :is_show, :weight, :translations
    end
    list do
      fields :slug, :image, :status, :is_show
      field :title_uk
    end
  end

  config.model 'Project::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    configure :body, :ck_editor
    include_fields :locale, :title, :short, :body
  end

  config.model 'Faq::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    configure :source, :ck_editor
    include_fields :locale, :source
  end

  config.model 'StaticPage::Translation' do
    visible false
    configure :vision_text, :ck_editor
    configure :values_text, :ck_editor
    configure :tasks_text, :ck_editor
    configure :locale, :hidden do
      help ''
    end
    include_fields :locale, :vision_title, :vision_text, :values_text, :tasks_text
  end
end
