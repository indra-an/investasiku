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

  def queue_newsletter
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
end
