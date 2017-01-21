module DemoHelper

    def date_today
      d = Time.now
      d.strftime("%m-%d-20%y")
    end
end
