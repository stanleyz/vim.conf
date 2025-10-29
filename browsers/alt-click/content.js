// content.js
// Detect Alt/Option + click on links, prevent default, and ask background to open the link in a background tab.

(function () {
  'use strict';

  // Use capture and set passive:false so we can call preventDefault()
  document.addEventListener('click', (e) => {
    // only left-button clicks
    if (e.button !== 0) return;

    const anchor = e.target?.closest('a');
    if (!anchor) return;

    // only if Alt/Option key is pressed
    if (!e.altKey) return;

    const href = anchor.href;
    if (!href) return;

    // Don't trigger on anchors that have javascript: or empty href
    if (href.startsWith('javascript:')) return;

    // Prevent page's default behavior
    e.preventDefault();
    e.stopPropagation();

    // Send a message to background to open the URL in a background tab
    // We intentionally open inactive (background) tab to emulate Ctrl+Click
    try {
      chrome.runtime.sendMessage({ action: 'open_in_background', url: href });
    } catch (err) {
      // Fallback for browsers that expose `browser` instead of `chrome`
      try {
        browser.runtime.sendMessage({ action: 'open_in_background', url: href });
      } catch (e) {
        // Last resort: fallback to window.open (may be blocked or behave differently)
        window.open(href, '_blank');
      }
    }
  }, { capture: true, passive: false });

})();
