// background.js - Can actually modify headers
chrome.declarativeNetRequest.updateDynamicRules({
    removeRuleIds: [1, 2], // Remove existing rules first
    addRules: [{
        id: 1,
        priority: 1,
        action: {
            type: "modifyHeaders",
            requestHeaders: [{
                header: "user-agent",
                operation: "set",
                value: "Mozilla/5.0 (X11; CrOS x86_64 10066.0.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36"
            }]
        },
        condition: {
            urlFilter: "*",
        }
    }]
});