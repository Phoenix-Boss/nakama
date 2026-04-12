// Initialize runtime logger
let logger = null;

// Register initialization hook
initializer.registerInitModule((ctx, loggerInstance, nk) => {
  logger = loggerInstance;
  logger.info("Nakama runtime initialized. Connected to Supabase DB.");
});

// 60-second bot/heartbeat timer
initializer.registerTimer("seed_cycle", (ctx, logger, nk) => {
  logger.info("Bot cycle triggered. Checking pool velocity & pending replies...");
  // Future: Insert MongoDB fetch, zero-silence logic, sharp reply dispatch
}, 60, 0);

// Chat intercept hook
initializer.registerBeforeSendChatMessage((ctx, logger, nk, payload) => {
  logger.info(`Chat message from ${ctx.userId} in pool ${ctx.channel?.id || "unknown"}`);
  // Future: Parse @mentions, queue sharp replies to MongoDB, validate rate limits
  return payload;
});
