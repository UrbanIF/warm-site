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
    new
    export
    bulk_delete
    show
    edit
    delete
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
User
)


  config.model 'News' do
    configure :translations, :globalize_tabs
    weight 1
    field :image, :carrierwave
  end

  [Publication, Partner, Project, StaticPage, News].each do |_model|
    config.model _model do
      configure :translations, :globalize_tabs
    end
  end

  config.model 'News::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    configure :body, :ck_editor
    include_fields :locale, :title, :short, :body
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
    configure :body, :ck_editor
    include_fields :locale, :title, :body
  end

  config.model 'Project::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    configure :body, :ck_editor
    include_fields :locale, :title, :short, :body
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
