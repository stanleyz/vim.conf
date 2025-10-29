// background.js (service worker)
// Receives requests from content scripts and opens a new background tab

chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
  if (!message || message.action !== 'open_in_background') return;

  const url = message.url;
  if (!url) return;

  // Create a new tab but keep it inactive (background)
  chrome.tabs.create({ url: url, active: false }, (tab) => {
    // optionally do something with the created tab
    // We don't call sendResponse because we don't need to
  });

  // no async response
});
