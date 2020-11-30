Grover.configure do |config|
  config.options = {
    format: 'A4',
    margin: {
      top: '5px',
      bottom: '5px',
      left: '5px',
      right: '5px'
    },
    # scale: 0.9,
    # full_page: true,
    viewport: {
      width: 640,
      height: 480
    },
    # debug: {
    #   headless: false,  # Default true. When set to false, the Chromium browser will be displayed
    #   devtools: true    # Default false. When set to true, the browser devtools will be displayed.
    # },
    prefer_css_page_size: true,
    emulate_media: 'screen',
    cache: false,
    timeout: 0, # Timeout in ms. A value of `0` means 'no timeout'
    launch_args: ['--font-render-hinting=medium'],
    wait_until: 'domcontentloaded'
  }
end
