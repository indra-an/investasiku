class Admins::DashboardController < Admins::BaseController
  def index
    @login_times = current_admin.sign_in_count
    @server_cpu = Usagewatch.uw_cpuused rescue nil
    @server_memory = Usagewatch.uw_memused rescue nil
    @server_storage = Usagewatch.uw_diskused_perc rescue nil
    @newsletter_queue = NewsletterQueue.new
    @statistics = [Visit.this_month_count, Visit.last_month_count, Visit.count]
    @daily_traffic = Visit.group_by_day(:started_at,
                                        :range => 1.month.ago.midnight..Time.now,
                                        :format => '%b %d').count
  end

  def preferences
    @preference = Preference.fetch || Preference.new
    set_preference_attributes
  end

  def save_preferences
    @preference = Preference.fetch || Preference.new
    @preference.facebook_link = params[:facebook_link]
    @preference.twitter_link = params[:twitter_link]
    @preference.instagram_link = params[:instagram_link]
    @preference.banner_ad_script = params[:banner_ad_script]
    @preference.sidebar_ad_script = params[:sidebar_ad_script]
    @preference.news_id = params[:news]
    @preference.investment_tip_id = params[:investment_tip]
    @preference.module_step_1_id = params[:module_step_1]
    @preference.module_step_2_id = params[:module_step_2]
    @preference.module_step_3_id = params[:module_step_3]
    @preference.module_step_4_id = params[:module_step_4]
    @preference.module_step_5_id = params[:module_step_5]

    if @preference.save
      redirect_to admins_preferences_path, notice: 'Website preferences saved.'
    else
      set_preference_attributes
      render :preferences
    end
  end

  def update_full_name
    current_admin.full_name = params[:full_name]
    @status = current_admin.save
    @error_message = current_admin.errors.first.join(' ').titleize unless @status
  end

  def update_password
    current_admin.password = params[:new_password]
    current_admin.password_confirmation = params[:retype_new_password]
    @status = current_admin.save
    @error_message = current_admin.errors.first.join(' ').titleize unless @status
  end

  private

    def set_preference_attributes
      @news = News.select(:id, :title).collect { |news| [news.title, news.id] }
      @learning_modules = LearningModule.select(:id, :title).collect { |mod| [mod.title, mod.id] }
      @tips = InvestmentTip.select(:id, :title).collect { |tip| [tip.title, tip.id] }
      @news_selected = [@preference.news.title, @preference.news.id] rescue nil
      @tip_selected = [@preference.investment_tip.title, @preference.investment_tip.id] rescue nil
      @module_selected = []

      5.times do |i|
        mod = eval("@preference.module_step_#{i + 1}")
        @module_selected << mod.nil? ? nil : [mod.title, mod.id]
      end
    end
end
