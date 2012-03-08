module ApplicationHelper
  include Admin::NavigationHelpers

  def options_for_simple_time_select
    times_array = []
    (0..23).each do |hour|
      ['00', '30'].each do |minutes|
        prefix = hour.to_s.size < 2 ? '0' : ''
        times_array << "#{prefix}#{hour}:#{minutes}"
      end
    end
    times_array
  end

  def locale_for_facebook
    case I18n.locale
    when :en
      'en_US'
    when :fr
      'fr_FR'
    else
      'pt_BR'
    end
  end
end
