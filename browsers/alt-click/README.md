Alt-click → Ctrl-click browser extension

What this does
- When you Alt (Option) + click a link, this extension will open the link in a new background tab (same effect as Ctrl+click on many systems).

Files added
- `manifest.json` — MV3 manifest and permissions
- `content.js` — content script that detects Alt+click and sends the URL to the background script
- `background.js` — service worker that opens the URL in a background tab

Install (Chrome / Edge)
1. **Create the icon**: Convert `icon.svg` to `icon48.png`:
   ```bash
   # Using ImageMagick (install: apt install imagemagick)
   convert icon.svg -resize 48x48 icon48.png
   
   # Or using Inkscape (install: apt install inkscape)
   inkscape icon.svg --export-type=png --export-filename=icon48.png --export-width=48 --export-height=48
   
   # Or use any online SVG-to-PNG converter
   ```
2. Open `chrome://extensions/`.
2. Toggle "Developer mode" on.
3. Click "Load unpacked" and select this directory (`browsers/alt-click`).
4. Test by Alt/Option + clicking a link.

Install (Firefox)
- Firefox has evolving MV3 support; if MV3 is supported in your version you can load via `about:debugging` → "This Firefox" → "Load Temporary Add-on" and pick the manifest. If that fails, the same approach can work after converting to MV2 (background script instead of service_worker).

Notes
- The extension needs the `tabs` permission and host permission for the sites you want to open. Using `<all_urls>` is the most convenient but you can restrict it to specific domains in `manifest.json`.
- Because synthetic MouseEvents cannot reliably trigger browser-native tab-opening behavior, this extension uses the extension API to open a tab — which is the reliable way to reproduce Ctrl+click behavior.
- If you want the opened tab to become focused, change `active: false` to `active: true` in `background.js`.

Limitations
- Extensions cannot perfectly emulate modifier-key behavior within the page (for example, some sites check event.ctrlKey). This implementation opens the link in a new tab via the extension API which is equivalent to Ctrl+click from the user's perspective (new tab opened), though some site JavaScript that checks the original click event modifiers may not see the ctrlKey.

Customization
- To change modifier from Alt to another (e.g., Meta), edit `content.js` and check `e.metaKey` or `e.ctrlKey` instead of `e.altKey`.

That's it — load the extension and test Alt+click to open links in background tabs.
