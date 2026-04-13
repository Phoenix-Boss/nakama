function InitModule(ctx, logger, nk, initializer) {
  logger.info('Nakama runtime initialized. Connected to Supabase DB.');

  initializer.registerRpc('health', function(ctx, logger, nk, payload) {
    return JSON.stringify({
      status: 'ok',
      timestamp: new Date().toISOString()
    });
  });
}
