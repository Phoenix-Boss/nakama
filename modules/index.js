// Initialize runtime logger
let logger = null;

// Register initialization hook
initializer.registerInitModule((ctx, loggerInstance, nk) => {
  logger = loggerInstance;
  logger.info("Nakama runtime initialized. Connected to Supabase DB.");
  
  // Register health check RPC
  nk.registerRpc("health", (ctx, payload) => {
    return JSON.stringify({
      status: "ok",
      timestamp: new Date().toISOString(),
      uptime: process.uptime()
    });
  });
});

// 60-second bot/heartbeat timer
initializer.registerTimer("seed_cycle", (ctx, logger, nk) => {
  logger.info("Bot cycle triggered. Checking pool velocity & pending replies...");
}, 60, 0);

// Chat intercept hook
initializer.registerBeforeSendChatMessage((ctx, logger, nk, payload) => {
  logger.info(`Chat message from ${ctx.userId} in pool ${ctx.channel?.id || "unknown"}`);
  return payload;
});
