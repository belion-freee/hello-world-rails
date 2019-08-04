module SystemSupport
  # give me block return boolean
  def wait_until(wait_time = Capybara.default_max_wait_time)
    Timeout.timeout(wait_time) do
      loop until yield
    end
  end

  def wait_for_css(selector, wait_time = Capybara.default_max_wait_time, non_display: false)
    Timeout.timeout(wait_time) do
      loop until send((non_display ? :has_no_css? : :has_css?), selector)
    end
    yield if block_given?
  end

  def wait_for_ajax(wait_time = Capybara.default_max_wait_time)
    Timeout.timeout(wait_time) do
      loop until page.evaluate_script("jQuery.active").zero?
    end
    yield if block_given?
  end
end
