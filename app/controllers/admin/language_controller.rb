module Admin
  class LanguageController < BaseController
    def index
      @languages = Language.all.order(:language_name)
    end

    def create
      @language = Language.new(language_params)
    end

    def create_from_select
      language_list = params["Select Languages"]
      language_list.each do |language|
        lang_name, locale_name = language.split('/')
        lang = Language.find_by('locale_name' => locale_name)
        if lang.nil?
          Language.create([:language_name => lang_name, :locale_name => locale_name])
        end
      end
      redirect_to admin_language_index_path
    end

    def change_language_status
      @language = Language.find(params['format'])
      @language.update_attribute(:status, !@language.status)
      redirect_to(admin_language_index_path)
    end

    private

    def language_params
      params.require(:language).permit(:language_name, :local_name, :status)
    end
  end
end
