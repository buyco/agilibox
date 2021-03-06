module CapybaraWaitAjaxRequests
  def wait_ajax_requests(timeout = Capybara.default_max_wait_time)
    Timeout.timeout(timeout) do
      sleep 0.1 until all_ajax_requests_finished?
    end
  end

  def all_ajax_requests_finished?
    page.evaluate_script("jQuery.active").zero?
  end
end

World(CapybaraWaitAjaxRequests)

# Auto wait ajax request between steps
AfterStep do |_scenario|
  wait_ajax_requests if page.evaluate_script("typeof jQuery") != "undefined"
end
