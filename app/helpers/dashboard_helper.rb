module DashboardHelper
  def number_for_statistics(source)
    number_to_human(source, :format => '%n%u', :units => { :thousand => 'K' })
  end
end
