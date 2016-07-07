module ApplicationHelper
  def dynamic_background
    current_user ? 'not-landing' : 'landing'
  end

  def in_landing
    !current_user
  end

  def landing_container
    'welcome' unless current_user
  end

  def home_link_title
    link_to 'Smart Parking', root_path, class: 'logo-title'
  end
end
