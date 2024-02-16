local notify = require 'notify'
notify.setup  {
    background_colour = "NotifyBackground",
    fps = 30,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
    },
    level = 2,
    max_width = 30,
    render = "wrapped-compact",
    stages = "slide",
    time_formats = {
      notification = "%T",
      notification_history = "%FT%T"
    },
    timeout = 100,
    top_down = true
}
